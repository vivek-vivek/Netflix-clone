part of 'hot_and_new_bloc.dart';

@freezed
class HotAndNewState with _$HotAndNewState {
  const factory HotAndNewState({
    required final List<HotAndNewData> comingSoonList,
    required final List<HotAndNewData> everyOneIsWatchingList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;

  factory HotAndNewState.initial() => const HotAndNewState(
      comingSoonList: [],
      everyOneIsWatchingList: [],
      isLoading: false,
      hasError: false);
}
