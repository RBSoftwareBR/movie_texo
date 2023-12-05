
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_texo/core/params/no_params.dart';
import 'package:movie_texo/domain/use_cases/get_studio_with_most_wins.dart';
import 'package:movie_texo/presentation/cubit/studios/studio_with_most_wins_state.dart';

class StudiosWithMostWinsCubit extends Cubit<StudiosWithMostWinsState> {
  final GetStudiosWithMostWins getStudiosWithMostWins;

  StudiosWithMostWinsCubit({required this.getStudiosWithMostWins})
      : super(StudiosWithMostWinsInitial());

  Future<void> loadStudiosWithMostWins() async {
    emit(StudiosWithMostWinsLoading());
    final result = await getStudiosWithMostWins(NoParams());
    result.fold(
          (failure) => emit(StudiosWithMostWinsError(failure.message)),
          (studios) => emit(StudiosWithMostWinsLoaded(studios)),
    );
  }
}
