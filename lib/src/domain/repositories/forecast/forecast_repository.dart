import 'package:dartz/dartz.dart';
import 'package:weather_app/src/common/usecase/failure.dart';
import 'package:weather_app/src/domain/entities/forecast/forecast_entity.dart';
import 'package:weather_app/src/domain/usecases/get_forecast/get_forecast_usecase.dart';

abstract class ForecastRepository {
  Future<Either<Failure, ForecastEntity>> getForecast(GetForecastParams params);
}
