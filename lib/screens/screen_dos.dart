import 'dart:math';

import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenDos extends StatelessWidget {
  static String nameScreen = "ScreenDos";
  const ScreenDos({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    final controller = Get.put(UsuarioController());

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
                  final random = Random();
                  int edad = random.nextInt(90);

                  Usuario usuario = Usuario(
                      nombre: "Andres",
                      edad: edad,
                      profesiones: ['Developer', 'Video Player']);
                  controller.establecerUsuario(usuario);
                },
                child: const Text("Establecer usuario"),
              ),
              const SizedBox(height: 2),
              MaterialButton(
                color: color.primary,
                textColor: Colors.white,
                onPressed: () {
                  controller.cambairEdad();
                },
                child: const Text("Cambiar edad"),
              ),
              const SizedBox(height: 2),
              MaterialButton(
                textColor: Colors.white,
                color: color.primary,
                onPressed: () {
                  controller.adicinarProfesion();
                },
                child: const Text("Añadir profesion"),
              ),
            ]),
      ),
    );
  }
}
