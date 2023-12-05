import 'package:equatable/equatable.dart';
import 'package:movie_texo/domain/entities/studio.dart';

class StudiosWithMostWinsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class StudiosWithMostWinsInitial extends StudiosWithMostWinsState {}

class StudiosWithMostWinsLoading extends StudiosWithMostWinsState {}

class StudiosWithMostWinsLoaded extends StudiosWithMostWinsState {
  final List<Studio> studios;
  StudiosWithMostWinsLoaded(this.studios);
  @override
  List<Object?> get props => [studios];
}

class StudiosWithMostWinsError extends StudiosWithMostWinsState {
  final String message;
  StudiosWithMostWinsError(this.message);
  @override
  List<Object?> get props => [message];
}