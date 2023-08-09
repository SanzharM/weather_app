import 'package:get_it/get_it.dart';
import 'package:weather_app/src/common/api/api.dart';
import 'package:weather_app/src/core/app_router/app_router.dart';

final GetIt sl = GetIt.instance;

Future<void> initialize() async {
  sl
    ..registerLazySingleton<Api>(() => Api())
    ..registerLazySingleton<AppRouter>(() => AppRouter());
}
