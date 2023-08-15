import 'package:get_it/get_it.dart';
import 'package:weather_app/src/common/api/api.dart';
import 'package:weather_app/src/core/app_router/app_router.dart';
import 'package:weather_app/src/core/local_storage/local_storage.dart';
import 'package:weather_app/src/data/datasources/forecast/forecast_datasource.dart';
import 'package:weather_app/src/data/repositories_impl/forecast/forecast_repository_impl.dart';
import 'package:weather_app/src/domain/repositories/forecast/forecast_repository.dart';
import 'package:weather_app/src/domain/usecases/get_forecast/get_forecast_usecase.dart';

final GetIt sl = GetIt.instance;

Future<void> initialize() async {
  sl
    ..registerLazySingleton<Api>(() => Api())
    ..registerLazySingleton<AppRouter>(() => AppRouter())
    ..registerLazySingleton<LocalStorage>(() => const LocalStorage())

    // Repositories
    ..registerLazySingleton<ForecastRepository>(
      () => ForecastRepositoryImpl(sl()),
    )

    // DataSources
    ..registerLazySingleton<ForecastDatasource>(
      () => ForecastDatasourceImpl(sl()),
    )

    // UseCases
    ..registerLazySingleton(
      () => GetForecastUseCase(sl()),
    );
}
