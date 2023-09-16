import 'package:estados/bloc/usuario/usuario_bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenDos extends StatelessWidget {
  static String nameScreen = "ScreenDos";
  const ScreenDos({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    final usuarioBloc = context.read<UsuarioBloc>();
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
                  final Usuario usuario = Usuario(
                      nombre: "Andes",
                      edad: 20,
                      profesiones: ['Developer', 'Video Player']);

                  usuarioBloc.add(ActivateUsuario(usuario: usuario));
                },
                child: const Text("Establecer usuario"),
              ),
              MaterialButton(
                color: color.primary,
                textColor: Colors.white,
                onPressed: () {
                  usuarioBloc.add(ChangeAgeUsuario(edad: 23));
                },
                child: const Text("Cambiar edad"),
              ),
              MaterialButton(
                textColor: Colors.white,
                color: color.primary,
                onPressed: () {
                  usuarioBloc.add(AddProUsuario());
                },
                child: const Text("Añadir profesion"),
              ),
            ]),
      ),
    );
  }
}
