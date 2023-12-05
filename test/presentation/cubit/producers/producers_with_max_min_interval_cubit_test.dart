import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_texo/core/failures/failure.dart';
import 'package:movie_texo/core/params/no_params.dart';
import 'package:movie_texo/domain/entities/producer_interval.dart';
import 'package:movie_texo/domain/entities/producer_interval_result.dart';
import 'package:movie_texo/domain/use_cases/get_producers_with_max_min_interval.dart';
import 'package:movie_texo/presentation/cubit/producers/producers_with_max_min_interval_cubit.dart';
import 'package:movie_texo/presentation/cubit/producers/producers_with_max_min_interval_state.dart';

import 'producers_with_max_min_interval_cubit_test.mocks.dart';

@GenerateMocks([GetProducersWithMaxMinInterval])
void main() {
  late MockGetProducersWithMaxMinInterval mockGetProducersWithMaxMinInterval;

  setUp(() {
    mockGetProducersWithMaxMinInterval = MockGetProducersWithMaxMinInterval();
  });

  group('ProducersWithMaxMinIntervalCubit', () {
    blocTest<ProducersWithMaxMinIntervalCubit, ProducersWithMaxMinIntervalState>(
      'emits [Loading, Loaded] when producers are fetched successfully',
      build: () {
        const producerIntervalResult = ProducerIntervalResult(
          max: [ProducerInterval(producer: 'Producer Max', interval: 10, previousWin: 2000, followingWin: 2010)],
          min: [ProducerInterval(producer: 'Producer Min', interval: 1, previousWin: 2018, followingWin: 2019)],
        );
        when(mockGetProducersWithMaxMinInterval(NoParams()))
            .thenAnswer((_) async => const Right(producerIntervalResult));
        return ProducersWithMaxMinIntervalCubit(getProducersWithMaxMinInterval: mockGetProducersWithMaxMinInterval);
      },
      act: (cubit) => cubit.loadProducersWithMaxMinInterval(),
      expect: () => [
        ProducersWithMaxMinIntervalLoading(),
        isA<ProducersWithMaxMinIntervalLoaded>().having((state) => state.producerIntervalResult, 'producerIntervalResult', isNotNull),
      ],
    );

    blocTest<ProducersWithMaxMinIntervalCubit, ProducersWithMaxMinIntervalState>(
      'emits [Loading, Error] when fetching producers fails',
      build: () {
        when(mockGetProducersWithMaxMinInterval(NoParams()))
            .thenAnswer((_) async => const Left(Failure(message: 'Error', stackTrace: "")));
        return ProducersWithMaxMinIntervalCubit(getProducersWithMaxMinInterval: mockGetProducersWithMaxMinInterval);
      },
      act: (cubit) => cubit.loadProducersWithMaxMinInterval(),
      expect: () => [
        ProducersWithMaxMinIntervalLoading(),
        ProducersWithMaxMinIntervalError('Error'),
      ],
    );
  });
}
