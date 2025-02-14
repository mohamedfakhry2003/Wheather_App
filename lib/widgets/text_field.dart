import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/search_cubit.dart';
import 'package:weather_app/views/home_view.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    super.key,
  });

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: 20,
      maxLines: 1,
      controller: _controller,
      decoration: InputDecoration(
          hintText: "Enter city name",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          suffixIcon: IconButton(
              onPressed: () {
                BlocProvider.of<SearchCubit>(context)
                    .getWeather(_controller.text);
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.search))),
    );
  }
}
