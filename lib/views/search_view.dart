import 'package:flutter/material.dart';
import 'package:weather_app/widgets/text_field.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Search a city"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 100,
              child: MyTextField(),
            ),
          ),
        ),
      ),
    );
  }
}
