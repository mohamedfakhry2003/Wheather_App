import 'package:flutter/material.dart';
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
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) {
                    return const HomeView();
                  },
                ));
              },
              icon: const Icon(Icons.search))),
    );
  }
}
