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
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: double.infinity,
        height: double.infinity,
        child: const SingleChildScrollView(
          child: Column(children: [
            Text(
              "General",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text("Nombre"),
            ),
            ListTile(
              title: Text("Edad"),
            ),
            Divider(),
            Text(
              "Profesiones",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ListTile(
              title: Text("Profesion 1"),
            ),
            ListTile(
              title: Text("Profesion 2"),
            ),
            ListTile(
              title: Text("Profesion 3"),
            ),
            ListTile(
              title: Text("Profesion 4"),
            ),
          ]),
        ),
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
