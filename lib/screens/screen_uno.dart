import 'package:estados/models/usuario.dart';
import 'package:estados/providers/usuario_provider.dart';
import 'package:estados/screens/screen_dos.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScreenUno extends StatelessWidget {
  static String nameScreen = "ScreenUno";

  const ScreenUno({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioProvider = context.watch<UsuarioProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Uno"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () => usuarioProvider.removerUsuario(),
              icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: usuarioProvider.existeUsuario
          ? _BodyPage(usuarioProvider.usuario!)
          : const Center(
              child: Text("No se ha establecido un usuario"),
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

class _BodyPage extends StatelessWidget {
  final Usuario usuario;

  const _BodyPage(this.usuario);

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
          const Divider(),
          ListTile(
            title: Text("Nombre: ${usuario.nombre}"),
          ),
          ListTile(
            title: Text("Edad: ${usuario.edad}"),
          ),
          const Text(
            "Profesiones",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ...usuario.profesiones
              .map((e) => ListTile(
                    title: Text(e),
                  ))
              .toList()
        ]),
      ),
    );
  }
}
