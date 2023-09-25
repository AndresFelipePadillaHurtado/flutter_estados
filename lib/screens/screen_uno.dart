import 'package:estados/models/usuario.dart';
import 'package:estados/providers/usuario_povider.dart';
import 'package:estados/screens/screen_dos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScreenUno extends ConsumerWidget {
  static String nameScreen = "ScreenUno";

  const ScreenUno({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usuarioProvider = ref.watch(usuarioStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Screen Uno"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                ref.read(usuarioStateProvider.notifier).eliminarUsuario();
              },
              icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: usuarioProvider.existeUsuario
          ? _BodyScaffold(
              usuario: usuarioProvider.usuario,
            )
          : const Center(
              child: Text("El usuario no se ha establecido"),
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
