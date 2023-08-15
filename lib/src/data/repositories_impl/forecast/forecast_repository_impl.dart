import 'package:dartz/dartz.dart';

import 'package:weather_app/src/common/usecase/failure.dart';
import 'package:weather_app/src/data/datasources/forecast/forecast_datasource.dart';
import 'package:weather_app/src/domain/entities/forecast/forecast_entity.dart';
import 'package:weather_app/src/domain/repositories/forecast/forecast_repository.dart';
import 'package:weather_app/src/domain/usecases/get_forecast/get_forecast_usecase.dart';

class ForecastRepositoryImpl implements ForecastRepository {
  final ForecastDatasource _datasource;

  const ForecastRepositoryImpl(
    this._datasource,
  );

  @override
  Future<Either<Failure, ForecastEntity>> getForecast(GetForecastParams params) async {
    try {
      return Right(await _datasource.getForecast(params));
    } on ServerFailure {
      rethrow;
    } catch (e) {
      throw UnexpectedFailure(message: e.toString());
    }
  }
}
