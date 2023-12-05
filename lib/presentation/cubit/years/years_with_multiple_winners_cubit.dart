

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_texo/core/params/no_params.dart';
import 'package:movie_texo/domain/use_cases/get_years_with_multiple_winners.dart';
import 'package:movie_texo/presentation/cubit/years/years_with_multiple_winners_state.dart';

class YearsWithMultipleWinnersCubit extends Cubit<YearsWithMultipleWinnersState> {
  final GetYearsWithMultipleWinners getYearsWithMultipleWinners;

  YearsWithMultipleWinnersCubit({required this.getYearsWithMultipleWinners})
      : super(YearsWithMultipleWinnersInitial());

  Future<void> loadYearsWithMultipleWinners() async {
    emit(YearsWithMultipleWinnersLoading());
    final result = await getYearsWithMultipleWinners(NoParams());
    result.fold(
          (failure) => emit(YearsWithMultipleWinnersError(failure.message)),
          (years) => emit(YearsWithMultipleWinnersLoaded(years)),
    );
  }
}
