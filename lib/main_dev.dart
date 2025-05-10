import 'app_runner.dart';
import 'main_prod.dart';

import 'features/task_details/data/repositories/weather_repository.dart';
import 'features/task_details/data/repositories/weather_repository_mock.dart';

Future<void> setupLocator() async {
  getIt.registerLazySingleton<WeatherRepository>(() => MockWeatherRepository());
}

void main() async {
  setupLocator();
  appRunner();
}
