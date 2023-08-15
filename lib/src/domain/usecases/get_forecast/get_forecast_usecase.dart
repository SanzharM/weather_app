import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:weather_app/src/common/usecase/failure.dart';
import 'package:weather_app/src/common/usecase/usecase.dart';
import 'package:weather_app/src/domain/entities/forecast/forecast_entity.dart';
import 'package:weather_app/src/domain/repositories/forecast/forecast_repository.dart';

class GetForecastUseCase extends UseCase<ForecastEntity, GetForecastParams> {
  final ForecastRepository _repository;

  GetForecastUseCase(this._repository);

  @override
  Future<Either<Failure, ForecastEntity>> call({GetForecastParams? params}) {
    if (params == null) {
      throw Exception('Provide paramters to get forecast');
    }
    return _repository.getForecast(params);
  }
}

class GetForecastParams extends Equatable {
  final double latitude;
  final double longitude;

  const GetForecastParams({
    required this.latitude,
    required this.longitude,
  });

  @override
  List<Object?> get props => [latitude, longitude];

  static const String _hourlyOptions = 'temperature_2m,'
      'relativehumidity_2m,'
      'precipitation_probability,'
      'rain,snowfall,cloudcover,visibility';

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'hourly': _hourlyOptions,
    };
  }
}
