import 'package:weather_app/src/common/api/api.dart';
import 'package:weather_app/src/common/usecase/failure.dart';
import 'package:weather_app/src/domain/entities/forecast/forecast_entity.dart';
import 'package:weather_app/src/domain/usecases/get_forecast/get_forecast_usecase.dart';

abstract class ForecastDatasource {
  Future<ForecastEntity> getForecast(GetForecastParams params);
}

class ForecastDatasourceImpl implements ForecastDatasource {
  final Api _api;

  const ForecastDatasourceImpl(
    this._api,
  );

  @override
  Future<ForecastEntity> getForecast(GetForecastParams params) async {
    final response = await _api.get(
      endPoint: ApiEndpoints.getForecast,
      query: params.toMap(),
    );

    if (response.statusCode == 200) {
      return ForecastEntity.fromMap(response.data as Map<String, dynamic>);
    }

    throw ServerFailure(
      errorMessage: response.data['message'] ?? response.statusMessage,
    );
  }
}
