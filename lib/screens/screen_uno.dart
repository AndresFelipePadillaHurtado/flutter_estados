import 'package:estados/models/usuario.dart';
import 'package:estados/providers/usuario_provider.dart';
import 'package:estados/screens/screen_dos.dart';
import 'package:flutter/material.dart';

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
      ),
      body: StreamBuilder(
        stream: usuarioProvider.streamUsuario,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? _BodyPage(usuarioProvider.usuario)
              : const Center(
                  child: Text("No esta definido el usuario"),
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
          ListTile(
            title: Text("Nombre: ${usuario.nombre}"),
          ),
          ListTile(
            title: Text("Edad:  ${usuario.edad}"),
          ),
          const Divider(),
          const Text(
            "Profesiones",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          const ListTile(
            title: Text("Profesion 1"),
          ),
          const ListTile(
            title: Text("Profesion 2"),
          ),
          const ListTile(
            title: Text("Profesion 3"),
          ),
          const ListTile(
            title: Text("Profesion 4"),
          ),
        ]),
      ),
    );
  }
}
