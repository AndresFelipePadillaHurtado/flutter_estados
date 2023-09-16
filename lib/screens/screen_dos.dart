import 'package:flutter/material.dart';

class ScreenDos extends StatelessWidget {
  static String nameScreen = "ScreenDos";
  const ScreenDos({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text("Screen Dos")),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                color: color.primary,
                textColor: Colors.white,
                onPressed: () {},
                child: const Text("Establecer usuario"),
              ),
              MaterialButton(
                color: color.primary,
                textColor: Colors.white,
                onPressed: () {},
                child: const Text("Cambiar edad"),
              ),
              MaterialButton(
                textColor: Colors.white,
                color: color.primary,
                onPressed: () {},
                child: const Text("Añadir profesion"),
              ),
            ]),
      ),
    );
  }
}
