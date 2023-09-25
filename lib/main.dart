import 'package:estados/screens/screen_dos.dart';
import 'package:estados/screens/screen_uno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: ScreenUno.nameScreen,
        routes: {
          ScreenUno.nameScreen: (context) => const ScreenUno(),
          ScreenDos.nameScreen: (context) => const ScreenDos(),
        },
      ),
    );
  }
}
