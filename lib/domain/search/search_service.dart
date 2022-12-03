import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/failures/main_failures.dart';
import 'package:netflix_clone/domain/search/model/search_response_model/search_response_model.dart';

abstract class SearchService {
  Future<Either<MainFailures, SearchResponseModel>> searchMovies({
    required String movieQuery,
  });
}
