import 'package:estados/models/usuario.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UsuarioState {
  final Usuario usuario;
  final bool existeUsuario;

  UsuarioState({required this.usuario, required this.existeUsuario});

  UsuarioState copyWith({Usuario? usuario, bool? existeUsuario}) =>
      UsuarioState(
          usuario: usuario ?? this.usuario,
          existeUsuario: existeUsuario ?? this.existeUsuario);
}

class UsuarioNotifer extends StateNotifier<UsuarioState> {
  UsuarioNotifer()
      : super(UsuarioState(usuario: Usuario.empty(), existeUsuario: false));

  establecerUsuario(Usuario usuario) {
    state = state.copyWith(usuario: usuario, existeUsuario: true);
  }

  cambiarEdad(int valor) {
    state = state.copyWith(usuario: state.usuario.copyWith(edad: valor));
  }

  addProfesion() {
    final List<String> profesiones = state.usuario.profesiones;
    final String nuevaPro = "Profesion ${profesiones.length + 1}";
    profesiones.add(nuevaPro);

    state = state.copyWith(
        usuario: state.usuario.copyWith(profesiones: profesiones));
  }

  eliminarUsuario() {
    state = state.copyWith(usuario: Usuario.empty(), existeUsuario: false);
  }
}

final usuarioStateProvider =
    StateNotifierProvider<UsuarioNotifer, UsuarioState>((ref) {
  return UsuarioNotifer();
});
