import 'package:estados/providers/usuario_provider.dart';
import 'package:estados/screens/screen_dos.dart';
import 'package:estados/screens/screen_uno.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UsuarioProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(useMaterial3: true),
      initialRoute: ScreenUno.nameScreen,
      routes: {
        ScreenUno.nameScreen: (context) => const ScreenUno(),
        ScreenDos.nameScreen: (context) => const ScreenDos(),
      },
    );
  }
}
