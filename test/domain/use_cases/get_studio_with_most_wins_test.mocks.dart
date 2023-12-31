// Mocks generated by Mockito 5.4.3 from annotations
// in movie_texo/test/domain/use_cases/get_studio_with_most_wins_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movie_texo/core/failures/failure.dart' as _i5;
import 'package:movie_texo/core/params/get_movies_params.dart' as _i7;
import 'package:movie_texo/core/params/no_params.dart' as _i9;
import 'package:movie_texo/domain/entities/movie_result.dart' as _i6;
import 'package:movie_texo/domain/entities/producer_interval_result.dart'
    as _i10;
import 'package:movie_texo/domain/entities/studio.dart' as _i11;
import 'package:movie_texo/domain/entities/year_with_multiple_winners.dart'
    as _i8;
import 'package:movie_texo/domain/repositories/movie_repository.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i3.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.MovieResult>> getMovies(
          _i7.GetMoviesParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovies,
          [params],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.MovieResult>>.value(
            _FakeEither_0<_i5.Failure, _i6.MovieResult>(
          this,
          Invocation.method(
            #getMovies,
            [params],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.MovieResult>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i8.YearWithMultipleWinners>>>
      getYearsWithMultipleWinners(_i9.NoParams? params) => (super.noSuchMethod(
            Invocation.method(
              #getYearsWithMultipleWinners,
              [params],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.Failure,
                        List<_i8.YearWithMultipleWinners>>>.value(
                _FakeEither_0<_i5.Failure, List<_i8.YearWithMultipleWinners>>(
              this,
              Invocation.method(
                #getYearsWithMultipleWinners,
                [params],
              ),
            )),
          ) as _i4.Future<
              _i2.Either<_i5.Failure, List<_i8.YearWithMultipleWinners>>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i10.ProducerIntervalResult>>
      getProducersWithMaxMinInterval(_i9.NoParams? params) =>
          (super.noSuchMethod(
            Invocation.method(
              #getProducersWithMaxMinInterval,
              [params],
            ),
            returnValue: _i4.Future<
                    _i2.Either<_i5.Failure, _i10.ProducerIntervalResult>>.value(
                _FakeEither_0<_i5.Failure, _i10.ProducerIntervalResult>(
              this,
              Invocation.method(
                #getProducersWithMaxMinInterval,
                [params],
              ),
            )),
          ) as _i4
              .Future<_i2.Either<_i5.Failure, _i10.ProducerIntervalResult>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i11.Studio>>> getStudiosWithMostWins(
          _i9.NoParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #getStudiosWithMostWins,
          [params],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, List<_i11.Studio>>>.value(
                _FakeEither_0<_i5.Failure, List<_i11.Studio>>(
          this,
          Invocation.method(
            #getStudiosWithMostWins,
            [params],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i11.Studio>>>);
}
