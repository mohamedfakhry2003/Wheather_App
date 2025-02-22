import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/search_cubit.dart';
import 'package:weather_app/cubits/states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather.dart';
import 'package:weather_app/widgets/weather_info.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Weather App"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SearchView(),
                  ));
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: BlocBuilder<SearchCubit, WeatherState>(
          builder: (context, state) {
            if (state is NoWeatherState) {
              return const NoWeather();
            } else if (state is WeatherLoadedState) {
              return WeatherInfo( weatherModel: state.weatherModel,);
            } else {
              return const Text("there was an error");
            }
          },
        ),
      ),
    );
  }
}
