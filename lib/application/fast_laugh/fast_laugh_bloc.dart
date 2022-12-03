import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';

import '../../domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final videoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
];

ValueNotifier<Set<int>> likedVideosIdsNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(
    IDownloadsRepo downloadService,
  ) : super(FastLaughState.initial()) {

    on<Initialize>((event, emit) async {
      // sending loading to Ui
      emit(
        const FastLaughState(
          videosList: [],
          isLoading: true,
          isError: false,
        ),
      );
      //  get trending movies
      final result = await downloadService.getDownloadsImage();
      final _state = result.fold(
        (l) => const FastLaughState(
          videosList: [],
          isLoading: false,
          isError: true,
        ),
        (resp) => FastLaughState(
          videosList: resp,
          isLoading: false,
          isError: false,
        ),
      );
      // send to ui
      emit(_state);
    });

    on<likeVideo>((event, emit) {
      likedVideosIdsNotifier.value.add(event.id);
      likedVideosIdsNotifier.notifyListeners();

      emit(
        state.copyWith(),
      );
    });
    on<unLikeVideo>((event, emit) {
      likedVideosIdsNotifier.value.remove(event.id);
      likedVideosIdsNotifier.notifyListeners();

      emit(
        state.copyWith(),
      );
    });
  }
}
