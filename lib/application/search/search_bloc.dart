import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failures.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone/domain/search/search_service.dart';

import '../../domain/downloads/models/downloads.dart';
import '../../domain/search/model/search_response_model/search_response_model.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final IDownloadsRepo _downloadsService;
  final SearchService _searchService;

  SearchBloc(this._downloadsService, this._searchService)
      : super(SearchState.initial()) {
    // idle state
    on<Initialize>((event, emit) async {
      if (state.idleList.isNotEmpty) {
        emit(
          SearchState(
            searchResultLis: [],
            idleList: state.idleList,
            isLoading: false,
            isError: false,
          ),
        );
      }
      //get trending
      final result = await _downloadsService.getDownloadsImage();
      final _state = result.fold(
        (MainFailures f) {
          return const SearchState(
              searchResultLis: [],
              idleList: [],
              isLoading: false,
              isError: true);
        },
        (List<Downloads> list) {
          return SearchState(
              searchResultLis: [],
              idleList: list,
              isLoading: false,
              isError: false);
        },
      );
      // show to ui
      emit(_state);
    });

    // search state
    on<SearchMovie>((event, emit) async {
      // call search movie api

      emit(const SearchState(
          searchResultLis: [], idleList: [], isLoading: true, isError: false));
      final result =
          await _searchService.searchMovies(movieQuery: event.movieQuery);
      final _state = result.fold(
        (MainFailures f) {
          return const SearchState(
              searchResultLis: [],
              idleList: [],
              isLoading: false,
              isError: true);
        },
        (SearchResponseModel r) {
          return SearchState(
              searchResultLis: r.results!,
              idleList: [],
              isLoading: false,
              isError: false);
        },
      );

      print(result);
      // show to api
      emit(_state);
    });
  }
}
