import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:movie_texo/core/api/api_config.dart';
import 'package:movie_texo/core/api/api_util.dart';
import 'package:movie_texo/core/failures/api_failure.dart';
import 'package:movie_texo/core/failures/data_source_failure.dart';
import 'package:movie_texo/core/failures/parsing_failure.dart';
import 'package:movie_texo/core/logger.dart';
import 'package:movie_texo/core/params/get_movies_params.dart';
import 'package:movie_texo/core/params/no_params.dart';
import 'package:movie_texo/data/data_source/movie_data_source.dart';
import 'package:movie_texo/data/dto/movie_result_dto.dart';
import 'package:movie_texo/data/dto/producer_interval_result_dto.dart';
import 'package:movie_texo/data/dto/studio_dto.dart';
import 'package:movie_texo/data/dto/year_with_multiple_winners_dto.dart';

/// `ApiMovieDataSource` is an implementation of the `MovieDataSource` interface,
/// providing concrete methods to interact with a remote API for fetching movie-related data.
///
/// This class serves as the data layer in the application architecture, directly handling
/// the communication with the API. It uses [ApiUtil] for making HTTP requests and [ApiConfig]
/// for configuring these requests. Additionally, it employs [Logger] to log important information
/// and errors, which assists in debugging and monitoring.
///
/// Each method in this class corresponds to a specific API endpoint and is responsible for
/// sending requests to that endpoint, handling the response, and converting the response data
/// into appropriate data transfer objects (DTOs). These DTOs are then used by higher layers
/// of the application.
///
/// In case of API failures or parsing errors, appropriate error handling is implemented to
/// ensure that these issues are logged and converted into domain-specific error types,
/// allowing the application to handle them gracefully.
///
/// Example usage:
/// ```
/// final movieDataSource = ApiMovieDataSource(
///   apiConfig: ApiConfig(/* ... */),
///   apiUtil: ApiUtil(/* ... */),
///   logger: Logger(/* ... */),
/// );
/// ```
class ApiMovieDataSource extends MovieDataSource {
  /// Identifier for logging purposes. This string is used in log messages
  /// to indicate that the log originated from `ApiMovieDataSource`.
  final String source = "ApiMovieDataSource";

  /// Configuration for the API. This includes base URLs, endpoints, and
  /// potentially API keys or other necessary configuration details.
  ///
  /// The `apiConfig` is used to construct the full URL for each API call,
  /// ensuring that requests are directed to the correct endpoints.
  final ApiConfig apiConfig;

  /// Utility for making API calls. This encapsulates the logic for
  /// network communication, error handling, and response parsing.
  ///
  /// The `apiUtil` abstracts the details of HTTP requests and responses,
  /// providing a simpler interface for fetching data from the network.
  final ApiUtil apiUtil;

  /// Logger for recording events, errors, or other significant occurrences.
  ///
  /// The `logger` is used throughout the data source to log various activities,
  /// especially errors or unusual occurrences, aiding in debugging and monitoring.
  final Logger logger;

  /// Constructs an `ApiMovieDataSource`.
  ///
  /// This constructor requires [apiConfig], [apiUtil], and [logger] to be provided.
  /// These dependencies are injected into the data source, allowing for greater
  /// flexibility and easier testing.
  ApiMovieDataSource({
    required this.apiConfig,
    required this.apiUtil,
    required this.logger,
  });

  /// Define how to get movie information.
  /// Send [GetMoviesParams] and return [List<MovieDto>] when successful.
  /// Otherwise returns [DataSourceFailure].
  @override
  Future<Either<DataSourceFailure, MovieResultDto>> getMovies(
      GetMoviesParams params) async {
    Either<ApiFailure, String> result = await apiUtil.get(endPoint: apiConfig.getMovies(params));
    return result.fold(
          (failure) => Left(failure),
          (response) {
            try {
              MovieResultDto movieResultDto =
              MovieResultDto.fromMap(json.decode(response));
              return Right(movieResultDto);
            }catch(err,stackTrace){
              ParsingFailure failure =ParsingFailure(objectToParse:response, message:err.toString(),stackTrace:stackTrace.toString());
              logger.logFailure(source, failure);
              return Left(failure);
            }
      },
    );
  }

  /// Define how to get years with multiple winners.
  /// Send [NoParams] and return [List<YearWithMultipleWinnersDto>] when successful.
  /// Otherwise returns [DataSourceFailure].
  @override
  Future<Either<DataSourceFailure, List<YearWithMultipleWinnersDto>>>
      getYearsWithMultipleWinners(NoParams params) async {
    Either<ApiFailure, String> result = await apiUtil.get(
        endPoint: apiConfig.getYearsWithMultipleWinners(params));
    return result.fold(
      (failure) => Left(failure),
      (response) {
        return
          _parseJsonList(response, YearWithMultipleWinnersDto.fromMap,field: "years");
      },
    );
  }

  /// Define how to get years with multiple winners.
  /// Send [NoParams] and return [List<ProducerIntervalResultDto>] when successful.
  /// Otherwise returns [DataSourceFailure].
  @override
  Future<Either<DataSourceFailure, ProducerIntervalResultDto>>
      getProducersWithMaxMinInterval(NoParams params) async {
    Either<ApiFailure, String> result = await apiUtil.get(
        endPoint: apiConfig.getProducersWithMaxMinInterval(params));
    return result.fold(
      (failure) => Left(failure),
      (response) {
        try {
          ProducerIntervalResultDto producerIntervalResultDto =
          ProducerIntervalResultDto.fromMap(json.decode(response));
          return Right(producerIntervalResultDto);
        }catch(err,stackTrace){
          ParsingFailure failure =ParsingFailure(objectToParse:response, message:err.toString(),stackTrace:stackTrace.toString());
          logger.logFailure(source, failure);
          return Left(failure);
        }
      },
    );
  }

  /// Define how to get studio with most wins.
  /// Send [NoParams] and return [List<StudioDto>] when successful.
  /// Otherwise returns [DataSourceFailure].
  @override
  Future<Either<DataSourceFailure, List<StudioDto>>> getStudiosWithMostWins(
      NoParams params) async {
    Either<ApiFailure, String> result =
        await apiUtil.get(endPoint: apiConfig.getStudiosWithMostWins(params));
    return result.fold(
      (failure) => Left(failure),
      (response) {
        return _parseJsonList(response, StudioDto.fromMap,field: "studios");
      },
    );
  }

  /// Parses a JSON string and converts it into a list of objects of type [T].
  ///
  /// This generic method takes a JSON string [response] and a function [fromMap] that
  /// defines how to convert a JSON map into an object of type [T]. The method attempts to
  /// decode the JSON string into a list and map each item using [fromMap]. If a [field] name
  /// is provided, the method looks for this field in the JSON map and parses the list found
  /// under this field. If [field] is null, it directly parses the JSON string as a list.
  ///
  /// Example usage:
  /// ```dart
  /// _parseJsonList<MovieDto>(response, MovieDto.fromMap, field: 'content');
  /// ```
  ///
  /// In case of a parsing error, logs the failure and returns a [ParsingFailure]. This is
  /// useful for debugging and error tracking, as it captures the error details including
  /// the stack trace.
  ///
  /// Parameters:
  /// - [response]: The JSON string to be parsed.
  /// - [fromMap]: A function that defines how to convert each item in the list from a
  ///   [Map<String, dynamic>] to an object of type [T].
  /// - [field]: An optional field name to specify where the list is located in the JSON structure.
  ///   If null, the entire JSON string is treated as a list.
  Either<ParsingFailure, List<T>> _parseJsonList<T>(
      String response, T Function(Map<String, dynamic>) fromMap,{String? field}) {
    try {
      var jsResult = json.decode(response);
      return Right((field == null ?jsResult as List: jsResult[field] as List)
          .map((item) => fromMap(item))
          .toList());
    }catch(err,stackTrace){
      ParsingFailure failure =ParsingFailure(objectToParse:response, message:err.toString(),stackTrace:stackTrace.toString());
      logger.logFailure(source, failure);
      return Left(failure);
    }
  }
}
