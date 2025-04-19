import 'package:get_it/get_it.dart';

import 'app_runner.dart';
import 'features/task_details/data/repositories/weather_repository.dart';
import 'features/task_details/data/repositories/weather_repository_impl.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerLazySingleton<WeatherRepository>(() => ImplWeatherRepository());
}

void main() async {
  await setupLocator();
  appRunner();
}
