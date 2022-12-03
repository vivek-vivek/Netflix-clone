part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String stateId,
    required List<HotAndNewData> pastYearMovieList,
    required List<HotAndNewData> trendingMovieList,
    required List<HotAndNewData> tenseDramasMovieLis,
    required List<HotAndNewData> southIndianMovieList,
    required List<HotAndNewData> trendingTVList,
    required bool isLoading,
    required bool isError,
  }) = _Initial;

  factory HomeState.initial() =>const HomeState(
        pastYearMovieList: [],
        trendingMovieList: [],
        tenseDramasMovieLis: [],
        southIndianMovieList: [],
        trendingTVList: [],
        isLoading: false,
        isError: false, stateId: '0',
      );
}
