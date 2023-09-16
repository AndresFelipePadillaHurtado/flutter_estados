part of 'usuario_bloc.dart';

@immutable
abstract class UsuarioState {
  final bool exiteUsuario;
  final Usuario? usuario;

  const UsuarioState({required this.exiteUsuario, required this.usuario});
}

class UsuarioInitial extends UsuarioState {
  const UsuarioInitial() : super(exiteUsuario: false, usuario: null);
}

class UsuarioSetState extends UsuarioState {
  final Usuario newUsuario;

  const UsuarioSetState({required this.newUsuario})
      : super(exiteUsuario: true, usuario: newUsuario);
}
