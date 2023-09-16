import 'dart:async';
import 'package:estados/models/usuario.dart';

class _UsuarioProvider {
  late Usuario usuario;

  final StreamController<Usuario> _streamCtlUsuario =
      StreamController<Usuario>();

  Stream<Usuario> get streamUsuario => _streamCtlUsuario.stream;

  bool get existeUsuario => usuario.nombre.isEmpty ? false : true;

  void cargarUsuario(Usuario user) {
    usuario = user;
    _streamCtlUsuario.add(user);
  }

  void cambiarEdad(int edad) {
    usuario.edad = edad;
    _streamCtlUsuario.add(usuario);
  }

  dispose() {
    _streamCtlUsuario.close();
  }
}

final usuarioProvider = _UsuarioProvider();
