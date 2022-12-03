import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/failures/main_failures.dart';
import 'package:netflix_clone/domain/hot_and_new/model/hot_and_new_resp.dart';

abstract class HotAndNewService {
  Future<Either<MainFailures, HotAndNewResp>> getHotAndNewMovieData();
  Future<Either<MainFailures, HotAndNewResp>> getHotAndNewTVData();
}
