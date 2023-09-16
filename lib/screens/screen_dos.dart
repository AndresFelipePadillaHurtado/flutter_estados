import 'package:estados/models/usuario.dart';
import 'package:estados/providers/usuario_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenDos extends StatelessWidget {
  static String nameScreen = "ScreenDos";
  const ScreenDos({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    final usuarioProvider = context.watch<UsuarioProvider>();

    return Scaffold(
      appBar: AppBar(
          title: usuarioProvider.usuario != null
              ? Text("Nombre: ${usuarioProvider.usuario?.nombre}")
              : const Text("Screen Dos")),
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
                  final user = Usuario(
                      nombre: "Andres",
                      edad: 20,
                      profesiones: [
                        "Fullstack Develover",
                        "Expert Video Player"
                      ]);
                  usuarioProvider.cambiarUsuario(user);
                },
                child: const Text("Establecer usuario"),
              ),
              MaterialButton(
                color: color.primary,
                textColor: Colors.white,
                onPressed: () {
                  usuarioProvider.cambiarEdad(23);
                },
                child: const Text("Cambiar edad"),
              ),
              MaterialButton(
                textColor: Colors.white,
                color: color.primary,
                onPressed: () {
                  usuarioProvider.adicionarProfesion();
                },
                child: const Text("Añadir profesion"),
              ),
            ]),
      ),
    );
  }
}
