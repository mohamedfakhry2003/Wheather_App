import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class SearchCubit extends Cubit<WeatherState> {
  SearchCubit() : super(NoWeatherState());

  WeatherModel? weatherModel ;
  getWeather(String value) async {
    try {
      weatherModel =
          await WeatherServices().getCurrentWeather(value);

      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
