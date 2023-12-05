import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_texo/core/failures/failure.dart';
import 'package:movie_texo/core/params/no_params.dart';
import 'package:movie_texo/domain/entities/studio.dart';
import 'package:movie_texo/domain/use_cases/get_studio_with_most_wins.dart';
import 'package:movie_texo/presentation/cubit/studios/studio_with_most_wins_cubit.dart';
import 'package:movie_texo/presentation/cubit/studios/studio_with_most_wins_state.dart';
import 'studio_with_most_wins_cubit_test.mocks.dart';


@GenerateMocks([GetStudiosWithMostWins])
void main() {
  late MockGetStudiosWithMostWins mockGetStudiosWithMostWins;
  setUp(() {
    mockGetStudiosWithMostWins = MockGetStudiosWithMostWins();
  });

  group('StudiosWithMostWinsCubit', () {
    blocTest<StudiosWithMostWinsCubit, StudiosWithMostWinsState>(
      'emits [Loading, Loaded] when studios are fetched successfully',
      build: () {
        when(mockGetStudiosWithMostWins(NoParams()))
            .thenAnswer((_) async => const Right([Studio(name: 'Studio A', winCount: 3)]));
        return StudiosWithMostWinsCubit(getStudiosWithMostWins: mockGetStudiosWithMostWins);
      },
      act: (cubit) => cubit.loadStudiosWithMostWins(),
      expect: () => [
        StudiosWithMostWinsLoading(),
        isA<StudiosWithMostWinsLoaded>().having((state) => state.studios, 'studios', isNotEmpty),
      ],
    );

    blocTest<StudiosWithMostWinsCubit, StudiosWithMostWinsState>(
      'emits [Loading, Error] when fetching studios fails',
      build: () {
        when(mockGetStudiosWithMostWins(NoParams()))
            .thenAnswer((_) async => const Left(Failure(message: 'Error',stackTrace: "")));
        return StudiosWithMostWinsCubit(getStudiosWithMostWins: mockGetStudiosWithMostWins);
      },
      act: (cubit) => cubit.loadStudiosWithMostWins(),
      expect: () => [
        StudiosWithMostWinsLoading(),
        StudiosWithMostWinsError('Error'),
      ],
    );
  });
}
