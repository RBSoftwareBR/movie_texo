// Mocks generated by Mockito 5.4.3 from annotations
// in movie_texo/test/data/repositories/movie_repository_impl_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:movie_texo/core/failures/data_source_failure.dart' as _i5;
import 'package:movie_texo/core/params/get_movies_params.dart' as _i7;
import 'package:movie_texo/core/params/no_params.dart' as _i9;
import 'package:movie_texo/data/data_source/movie_data_source.dart' as _i3;
import 'package:movie_texo/data/dto/movie_result_dto.dart' as _i6;
import 'package:movie_texo/data/dto/producer_interval_result_dto.dart' as _i10;
import 'package:movie_texo/data/dto/studio_dto.dart' as _i11;
import 'package:movie_texo/data/dto/year_with_multiple_winners_dto.dart' as _i8;

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

/// A class which mocks [MovieDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieDataSource extends _i1.Mock implements _i3.MovieDataSource {
  MockMovieDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.DataSourceFailure, _i6.MovieResultDto>> getMovies(
          _i7.GetMoviesParams? params) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovies,
          [params],
        ),
        returnValue: _i4.Future<
                _i2.Either<_i5.DataSourceFailure, _i6.MovieResultDto>>.value(
            _FakeEither_0<_i5.DataSourceFailure, _i6.MovieResultDto>(
          this,
          Invocation.method(
            #getMovies,
            [params],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.DataSourceFailure, _i6.MovieResultDto>>);

  @override
  _i4.Future<
          _i2
          .Either<_i5.DataSourceFailure, List<_i8.YearWithMultipleWinnersDto>>>
      getYearsWithMultipleWinners(_i9.NoParams? params) => (super.noSuchMethod(
            Invocation.method(
              #getYearsWithMultipleWinners,
              [params],
            ),
            returnValue: _i4.Future<
                _i2.Either<_i5.DataSourceFailure,
                    List<_i8.YearWithMultipleWinnersDto>>>.value(_FakeEither_0<
                _i5.DataSourceFailure, List<_i8.YearWithMultipleWinnersDto>>(
              this,
              Invocation.method(
                #getYearsWithMultipleWinners,
                [params],
              ),
            )),
          ) as _i4.Future<
              _i2.Either<_i5.DataSourceFailure,
                  List<_i8.YearWithMultipleWinnersDto>>>);

  @override
  _i4.Future<_i2.Either<_i5.DataSourceFailure, _i10.ProducerIntervalResultDto>>
      getProducersWithMaxMinInterval(_i9.NoParams? params) =>
          (super.noSuchMethod(
            Invocation.method(
              #getProducersWithMaxMinInterval,
              [params],
            ),
            returnValue: _i4.Future<
                _i2.Either<_i5.DataSourceFailure,
                    _i10.ProducerIntervalResultDto>>.value(_FakeEither_0<
                _i5.DataSourceFailure, _i10.ProducerIntervalResultDto>(
              this,
              Invocation.method(
                #getProducersWithMaxMinInterval,
                [params],
              ),
            )),
          ) as _i4.Future<
              _i2
              .Either<_i5.DataSourceFailure, _i10.ProducerIntervalResultDto>>);

  @override
  _i4.Future<_i2.Either<_i5.DataSourceFailure, List<_i11.StudioDto>>>
      getStudiosWithMostWins(_i9.NoParams? params) => (super.noSuchMethod(
            Invocation.method(
              #getStudiosWithMostWins,
              [params],
            ),
            returnValue: _i4.Future<
                    _i2
                    .Either<_i5.DataSourceFailure, List<_i11.StudioDto>>>.value(
                _FakeEither_0<_i5.DataSourceFailure, List<_i11.StudioDto>>(
              this,
              Invocation.method(
                #getStudiosWithMostWins,
                [params],
              ),
            )),
          ) as _i4
              .Future<_i2.Either<_i5.DataSourceFailure, List<_i11.StudioDto>>>);
}