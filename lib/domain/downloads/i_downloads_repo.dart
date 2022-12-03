import 'package:dartz/dartz.dart';
import 'package:netflix_clone/domain/core/failures/main_failures.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';

abstract class IDownloadsRepo {
  Future<Either<MainFailures, List<Downloads>>> getDownloadsImage();
}
