
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix_clone/domain/core/failures/main_failures.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';

import '../../domain/downloads/models/downloads.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';
part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownloadsRepo _downloadsRepo;
  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.initial()) {
    on<_GetDownlodsImage>(
      (event, emit) async {
        emit(
          state.copyWith(
            isloading: true,
            downloadsFailureSuccessOption: none(),
          ),
        );
        final Either<MainFailures, List<Downloads>> downloadsOption =
            await _downloadsRepo.getDownloadsImage();
        emit(
          downloadsOption.fold(
            (failure) => state.copyWith(
                isloading: false,
                downloadsFailureSuccessOption: some(
                  left(failure),
                )),
            (success) => state.copyWith(
              isloading: false,
              downloads: success,
              downloadsFailureSuccessOption: some(
                right(success),
              ),
            ),
          ),
        );
      },
    );
  }
}
