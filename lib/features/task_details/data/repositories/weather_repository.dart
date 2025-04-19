import '../models/weather_city_search.dart';
import '../models/weather_current_conditions.dart';

abstract class WeatherRepository {
  Future<WeatherCitySearchModel> getCitySearch({
    required double lat,
    required double lng,
  });

  Future<WeatherCurrentConditionsModel> getCurrentConditions({
    required int locationCityKey,
  });
}
