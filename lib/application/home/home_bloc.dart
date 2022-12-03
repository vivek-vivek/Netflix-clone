import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failures.dart';
import 'package:netflix_clone/domain/hot_and_new/hot_and_new_service.dart';

import '../../domain/hot_and_new/model/hot_and_new_resp.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HotAndNewService homeService;
  
  HomeBloc(this.homeService) : super(HomeState.initial()) {
   
    // on event get homeScreen data
    on<GetHomeScreenData>((event, emit) async {
      
       log('GETTING HOME SCREEN DATA');
      // send loading to UI
      emit(state.copyWith(isLoading: true, isError: false));
      // get Data
      final _movieResult = await homeService.getHotAndNewMovieData();
      final _tVResult = await homeService.getHotAndNewTVData();

      //  transform data
      final state1 = _movieResult.fold((MainFailures f) {
        return  HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: [],
          trendingMovieList: [],
          tenseDramasMovieLis: [],
          southIndianMovieList: [],
          trendingTVList: [],
          isLoading: false,
          isError: true,
        );
      }, (HotAndNewResp resp) {
        final pastYear = resp.results;
        final trending = resp.results;
        final dramas = resp.results;
        final southIndian = resp.results;
        pastYear.shuffle();
        trending.shuffle();
        dramas.shuffle();
        southIndian.shuffle();

        return HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: pastYear,
          trendingMovieList: trending,
          tenseDramasMovieLis: dramas,
          southIndianMovieList: southIndian,
          trendingTVList: state.trendingTVList,
          isLoading: false,
          isError: false,
        );
      });

      emit(state1);

      final state2 = _tVResult.fold((MainFailures f) {
        return  HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: [],
          trendingMovieList: [],
          tenseDramasMovieLis: [],
          southIndianMovieList: [],
          trendingTVList: [],
          isLoading: false,
          isError: true,
        );
      }, (HotAndNewResp resp) {
        final top10List = resp.results;

        return HomeState(
          stateId: DateTime.now().millisecondsSinceEpoch.toString(),
          pastYearMovieList: state.pastYearMovieList,
          trendingMovieList: top10List,
          tenseDramasMovieLis: state.tenseDramasMovieLis,
          southIndianMovieList: state.southIndianMovieList,
          trendingTVList: top10List,
          isLoading: false,
          isError: false,
        );
      });
      // send to UI
      emit(state2);
    });
  }
}
