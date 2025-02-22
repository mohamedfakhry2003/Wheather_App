import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/search_cubit.dart';
import 'package:weather_app/cubits/states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: const MaterialWidget(),
    );
  }
}

class MaterialWidget extends StatelessWidget {
  const MaterialWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, WeatherState>(
      builder: (context, state) {
        return MaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
                backgroundColor: setColor(
                  BlocProvider.of<SearchCubit>(context).weatherModel?.conditon,
                ),
                elevation: 5),
          ),
          debugShowCheckedModeBanner: false,
          home: const HomeView(),
        );
      },
    );
  }
}

MaterialColor setColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  } else {
    switch (condition) {
      case "Sunny":
      case "Clear":
        return Colors.amber; // Sunny / Clear

      case "Partly cloudy":
        return Colors.amber; // Partly Cloudy

      case "Cloudy":
        return Colors.grey; // Cloudy

      case "Overcast":
        return Colors.grey; // Overcast

      case "Mist":
      case "Fog":
      case "Freezing fog":
        return Colors.blueGrey; // Mist / Fog

      case "Patchy rain possible":
      case "Patchy light rain":
      case "Light rain":
      case "Moderate rain":
      case "Heavy rain":
        return Colors.blue; // Rainy Conditions

      case "Patchy snow possible":
      case "Light snow":
      case "Moderate snow":
      case "Heavy snow":
        return Colors.lightBlue; // Snow Conditions

      case "Thundery outbreaks possible":
      case "Patchy light rain with thunder":
      case "Moderate or heavy rain with thunder":
      case "Patchy light snow with thunder":
      case "Moderate or heavy snow with thunder":
        return Colors.deepPurple; // Thunderstorms

      case "Ice pellets":
        return Colors.cyan; // Ice Pellets

      default:
        return Colors.grey; // Default for unknown conditions
    }
  }
}
