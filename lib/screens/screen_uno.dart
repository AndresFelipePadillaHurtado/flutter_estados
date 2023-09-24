import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';
import 'package:estados/screens/screen_dos.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenUno extends StatelessWidget {
  static String nameScreen = "ScreenUno";

  const ScreenUno({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioController = Get.put(UsuarioController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Uno"),
        centerTitle: true,
        elevation: 0,
        // ignore: prefer_const_constructors
        actions: [
          IconButton(
              onPressed: () => usuarioController.borrarUsuario(),
              icon: const Icon(Icons.delete_forever))
        ],
      ),
      // ignore: prefer_const_constructors
      body: Obx(() => usuarioController.existeUsuario.value
          ? _BodyScaffold(usuario: usuarioController.usuario.value)
          // ignore: prefer_const_constructors
          : Center(
              // ignore: prefer_const_constructors
              child: Text("No se ha establecido ningun usuario!"),
            )),
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
