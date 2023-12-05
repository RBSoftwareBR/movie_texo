import 'package:equatable/equatable.dart';
import 'package:movie_texo/domain/entities/producer_interval_result.dart';

class ProducersWithMaxMinIntervalState extends Equatable{
  @override
  List<Object?> get props => [];
}

class ProducersWithMaxMinIntervalInitial extends ProducersWithMaxMinIntervalState {}

class ProducersWithMaxMinIntervalLoading extends ProducersWithMaxMinIntervalState {}

class ProducersWithMaxMinIntervalLoaded extends ProducersWithMaxMinIntervalState {
  final ProducerIntervalResult producerIntervalResult;
  ProducersWithMaxMinIntervalLoaded(this.producerIntervalResult);
  @override
  List<Object?> get props => [producerIntervalResult];
}

class ProducersWithMaxMinIntervalError extends ProducersWithMaxMinIntervalState {
  final String message;
  ProducersWithMaxMinIntervalError(this.message);
  @override
  List<Object?> get props => [message];
}
