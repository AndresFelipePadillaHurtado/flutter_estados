import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/bloc/usuario/usuario_state.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenDos extends StatelessWidget {
  static String nameScreen = "ScreenDos";
  const ScreenDos({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    final usuarioBloc = context.watch<UsuarioCubit>();

    return Scaffold(
      appBar: AppBar(
          title: (usuarioBloc.state.runtimeType == UsuarioInitial)
              ? const Text("Screen Dos")
              : Text((usuarioBloc.state as UsuarioCreated).usuario.nombre)),
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
                  final usuario = Usuario(
                      nombre: "Andres",
                      edad: 20,
                      profesiones: ['Developer', ' Tester']);
                  usuarioBloc.establecerUsaurio(usuario);
                },
                child: const Text("Establecer usuario"),
              ),
              MaterialButton(
                color: color.primary,
                textColor: Colors.white,
                onPressed: () {
                  usuarioBloc.changeAge(30);
                },
                child: const Text("Cambiar edad"),
              ),
              MaterialButton(
                textColor: Colors.white,
                color: color.primary,
                onPressed: () {
                  usuarioBloc.addProfesion();
                },
                child: const Text("Añadir profesion"),
              ),
            ]),
      ),
    );
  }
}
