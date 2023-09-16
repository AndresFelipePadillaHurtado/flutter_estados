part of 'usuario_bloc.dart';

@immutable
abstract class UsuarioEvent {}

class ActivateUsuario extends UsuarioEvent {
  final Usuario usuario;
  ActivateUsuario({required this.usuario});
}

class ChangeAgeUsuario extends UsuarioEvent {
  final int edad;

  ChangeAgeUsuario({required this.edad});
}

class AddProUsuario extends UsuarioEvent {}

class DeleteUsuario extends UsuarioEvent {}
