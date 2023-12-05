import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_texo/core/params/no_params.dart';
import 'package:movie_texo/domain/use_cases/get_producers_with_max_min_interval.dart';
import 'package:movie_texo/presentation/cubit/producers/producers_with_max_min_interval_state.dart';

class ProducersWithMaxMinIntervalCubit extends Cubit<ProducersWithMaxMinIntervalState> {
  final GetProducersWithMaxMinInterval getProducersWithMaxMinInterval;

  ProducersWithMaxMinIntervalCubit({required this.getProducersWithMaxMinInterval})
      : super(ProducersWithMaxMinIntervalInitial());

  Future<void> loadProducersWithMaxMinInterval() async {
    emit(ProducersWithMaxMinIntervalLoading());
    final result = await getProducersWithMaxMinInterval(NoParams());
    result.fold(
          (failure) => emit(ProducersWithMaxMinIntervalError(failure.message)),
          (intervalResult) => emit(ProducersWithMaxMinIntervalLoaded(intervalResult)),
    );
  }
}
