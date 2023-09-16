import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';

class UsuarioProvider extends ChangeNotifier {
  Usuario? _usuario;

  bool get existeUsuario => (_usuario == null) ? false : true;
  Usuario? get usuario => _usuario;

  void cambiarUsuario(Usuario user) {
    _usuario = user;
    notifyListeners();
  }

  void cambiarEdad(int edad) {
    usuario?.edad = edad;
    notifyListeners();
  }

  void removerUsuario() {
    _usuario = null;
    notifyListeners();
  }

  void adicionarProfesion() {
    _usuario?.profesiones.add("Profesion ${_usuario!.profesiones.length + 1}");
    notifyListeners();
  }
}
