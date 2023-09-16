import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/bloc/usuario/usuario_state.dart';
import 'package:estados/models/usuario.dart';
import 'package:estados/screens/screen_dos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenUno extends StatelessWidget {
  static String nameScreen = "ScreenUno";

  const ScreenUno({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Uno"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                context.read<UsuarioCubit>().deleteUser();
              },
              icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: BlocBuilder<UsuarioCubit, UsuarioState>(
        builder: (context, state) {
          if (state.runtimeType == UsuarioInitial) {
            return const Center(
              child: Text("No se ha establecido un usuario!!"),
            );
          } else if (state.runtimeType == UsuarioCreated) {
            return _BodyScaffold(
              usuario: (state as UsuarioCreated).usuario,
            );
          }
          return const Center(
            child: Text("Estado no identificado"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          Navigator.pushNamed(context, ScreenDos.nameScreen);
        },
        child: const Icon(Icons.supervised_user_circle),
      ),
    );
  }
}

class _BodyScaffold extends StatelessWidget {
  final Usuario usuario;

  const _BodyScaffold({required this.usuario});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(children: [
          const Text(
            "General",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          ListTile(
            title: Text("Nombre: ${usuario.nombre}"),
          ),
          ListTile(
            title: Text("Edad: ${usuario.edad}"),
          ),
          const Divider(),
          const Text(
            "Profesiones",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ...usuario.profesiones.map((e) => ListTile(title: Text(e))).toList(),
        ]),
      ),
    );
  }
}
