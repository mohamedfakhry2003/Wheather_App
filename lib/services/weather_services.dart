import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherServices {
  final dio = Dio();
  String api = '';

  
  void setApi(String cityName) {
    api =
        'http://api.weatherapi.com/v1/forecast.json?key=3cb056d14b4f4dce933193841250502&q=$cityName&days=1';
  }

  Future<WeatherModel?> getCurrentWeather(String cityName) async {
    try {
      setApi(cityName);
      Response response = await dio.get(api);
      var jsonData = response.data;
      return WeatherModel.fromJson(jsonData);
    } catch (e) {
      return null;
    }
  }
}
