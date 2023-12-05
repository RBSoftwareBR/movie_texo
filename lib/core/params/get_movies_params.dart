import 'package:equatable/equatable.dart';

class GetMoviesParams extends Equatable {
  final int page;
  final int size;
  final bool? winner;
  final int? year;

  const GetMoviesParams(
      {required this.page,
      required this.size,
      this.winner,
      required this.year});

  @override
  List<Object?> get props => [
    page,
    size,
    winner,
    year,
  ];
}
