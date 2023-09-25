import 'dart:math';

import 'package:estados/models/usuario.dart';
import 'package:estados/providers/usuario_povider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScreenDos extends ConsumerWidget {
  static String nameScreen = "ScreenDos";

  const ScreenDos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                onPressed: () {
                  Usuario usuario = Usuario(
                      nombre: "Andres",
                      edad: 20,
                      profesiones: ["Developer", "Video Player"]);
                  ref
                      .read(usuarioStateProvider.notifier)
                      .establecerUsuario(usuario);
                },
                child: const Text("Establecer usuario"),
              ),
              MaterialButton(
                color: color.primary,
                textColor: Colors.white,
                onPressed: () {
                  final random = Random().nextInt(90);
                  ref.read(usuarioStateProvider.notifier).cambiarEdad(random);
                },
                child: const Text("Cambiar edad"),
              ),
              MaterialButton(
                textColor: Colors.white,
                color: color.primary,
                onPressed: () {
                  ref.read(usuarioStateProvider.notifier).addProfesion();
                },
                child: const Text("Añadir profesion"),
              ),
            ]),
      ),
    );
  }
}
