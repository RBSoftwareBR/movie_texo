import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_texo/core/failures/failure.dart';
import 'package:movie_texo/core/params/no_params.dart';
import 'package:movie_texo/domain/entities/year_with_multiple_winners.dart';
import 'package:movie_texo/domain/use_cases/get_years_with_multiple_winners.dart';
import 'package:movie_texo/presentation/cubit/years/years_with_multiple_winners_cubit.dart';
import 'package:movie_texo/presentation/cubit/years/years_with_multiple_winners_state.dart';
import 'years_with_multiple_winners_cubit_test.mocks.dart'; // Atualize para o arquivo de mocks correto

@GenerateMocks([GetYearsWithMultipleWinners])
void main() {
  late MockGetYearsWithMultipleWinners mockGetYearsWithMultipleWinners;

  setUp(() {
    mockGetYearsWithMultipleWinners = MockGetYearsWithMultipleWinners();
  });

  group('YearsWithMultipleWinnersCubit', () {
    blocTest<YearsWithMultipleWinnersCubit, YearsWithMultipleWinnersState>(
      'emits [Loading, Loaded] when years are fetched successfully',
      build: () {
        when(mockGetYearsWithMultipleWinners(NoParams()))
            .thenAnswer((_) async => const Right([YearWithMultipleWinners(year: 1980, winnerCount: 2)]));
        return YearsWithMultipleWinnersCubit(getYearsWithMultipleWinners: mockGetYearsWithMultipleWinners);
      },
      act: (cubit) => cubit.loadYearsWithMultipleWinners(),
      expect: () => [
        YearsWithMultipleWinnersLoading(),
        isA<YearsWithMultipleWinnersLoaded>().having((state) => state.years, 'years', isNotEmpty),
      ],
    );

    blocTest<YearsWithMultipleWinnersCubit, YearsWithMultipleWinnersState>(
      'emits [Loading, Error] when fetching years fails',
      build: () {
        when(mockGetYearsWithMultipleWinners(NoParams()))
            .thenAnswer((_) async => const Left(Failure(message: 'Error', stackTrace: "")));
        return YearsWithMultipleWinnersCubit(getYearsWithMultipleWinners: mockGetYearsWithMultipleWinners);
      },
      act: (cubit) => cubit.loadYearsWithMultipleWinners(),
      expect: () => [
        YearsWithMultipleWinnersLoading(),
        YearsWithMultipleWinnersError('Error'),
      ],
    );
  });
}
