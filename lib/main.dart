import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/screens/screen_dos.dart';
import 'package:estados/screens/screen_uno.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => UsuarioCubit(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ScreenUno.nameScreen,
      routes: {
        ScreenUno.nameScreen: (context) => const ScreenUno(),
        ScreenDos.nameScreen: (context) => const ScreenDos(),
      },
    );
  }
}
