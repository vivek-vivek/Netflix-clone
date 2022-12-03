part of 'downloads_bloc.dart';

@freezed
class DownloadsState with _$DownloadsState {
  const factory DownloadsState({
    required bool isloading,
    required List<Downloads>? downloads,
    required Option<Either<MainFailures, List<Downloads>>>
        downloadsFailureSuccessOption,
  }) = _DownloadsState;

  factory DownloadsState.initial() {
    return DownloadsState(
        isloading: false, downloadsFailureSuccessOption: none(), downloads: []);
  }
}
