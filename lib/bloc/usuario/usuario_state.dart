import 'package:estados/models/usuario.dart';

abstract class UsuarioState {}

class UsuarioInitial extends UsuarioState {
  final exixteUsuario = false;
}

class UsuarioCreated extends UsuarioState {
  // final exixteUsuario = true;
  final Usuario usuario;
  UsuarioCreated(this.usuario);
}
