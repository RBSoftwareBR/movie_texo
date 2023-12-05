import 'package:equatable/equatable.dart';
import 'package:movie_texo/domain/entities/year_with_multiple_winners.dart';

abstract class YearsWithMultipleWinnersState extends Equatable {
  @override
  List<Object?> get props => [];
}

class YearsWithMultipleWinnersInitial extends YearsWithMultipleWinnersState {}

class YearsWithMultipleWinnersLoading extends YearsWithMultipleWinnersState {}

class YearsWithMultipleWinnersLoaded extends YearsWithMultipleWinnersState {
  final List<YearWithMultipleWinners> years;
  YearsWithMultipleWinnersLoaded(this.years);
  @override
  List<Object?> get props => [years];
}

class YearsWithMultipleWinnersError extends YearsWithMultipleWinnersState {
  final String message;
  YearsWithMultipleWinnersError(this.message);
  @override
  List<Object?> get props => [message];
}
