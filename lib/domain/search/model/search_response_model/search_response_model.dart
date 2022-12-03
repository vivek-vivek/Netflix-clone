import 'package:json_annotation/json_annotation.dart';
import 'package:netflix_clone/core/constants.dart';

part 'search_response_model.g.dart';

@JsonSerializable()
class SearchResponseModel {
  @JsonKey(name: 'results')
  List<SearchResultData>? results;

  SearchResponseModel({
    this.results = const [],
  });

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) {
    return _$SearchResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResponseModelToJson(this);
}

@JsonSerializable()
class SearchResultData {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'original_title')
  String? originalTitle;
  String? overview;
  @JsonKey(name: 'poster_path')
  String? posterPath;

  String get posterImageUrl => '$imageAppendUrl$posterPath';

  SearchResultData({
    this.id,
    this.originalTitle,
    this.overview,
    this.posterPath,
  });

  factory SearchResultData.fromJson(Map<String, dynamic> json) {
    return _$SearchResultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultDataToJson(this);
}
