import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/search/model/search_response_model/search_response_model.dart';
import 'package:netflix_clone/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/search/search_service.dart';

import '../../domain/core/api_end_points.dart';

@LazySingleton(as: SearchService)
class SearchImpl implements SearchService {
  @override
  Future<Either<MainFailures, SearchResponseModel>> searchMovies(
      {required String movieQuery}) async {
    try {
      final response = await Dio(BaseOptions())
          .get(ApiEndPoints.search, queryParameters: {'query': movieQuery});

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = SearchResponseModel.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailures.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailures.clientFailure());
    }
  }
}
