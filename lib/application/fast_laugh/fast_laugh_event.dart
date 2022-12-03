part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughEvent with _$FastLaughEvent {
  const factory FastLaughEvent.initialize() = Initialize;
  const factory FastLaughEvent.likeVideo({required int id}) = likeVideo;
  const factory FastLaughEvent.unLikeVideo({required int id}) = unLikeVideo;
}
