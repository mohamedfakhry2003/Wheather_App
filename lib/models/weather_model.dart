class WeatherModel {
  final String cityName;
  final String minTemp;
  final String maxTemp;
  final String conditon;
  final String lastUpdated;
  final String currentTemp;
  final String? image;

  WeatherModel(
      {required this.cityName,
      required this.minTemp,
      required this.maxTemp,
      required this.conditon,
      required this.lastUpdated,
      required this.currentTemp,
      required this.image});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      minTemp: json["forecast"]["forecastday"]["day"]["mintemp_c"].toString(),
      maxTemp: json["forecast"]["forecastday"]["day"]["maxtemp_c"].toString(),
      conditon: json["current"]["condition"]["text"],
      lastUpdated: json["location"]["last_updated"],
      currentTemp: json["current"]["temp_c"].toString(),
      image: json["current"]["condition"]["icon"],
      cityName: json["location"]["name"],
    );
  }
}
