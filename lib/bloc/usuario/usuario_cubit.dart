import 'package:estados/bloc/usuario/usuario_state.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsuarioCubit extends Cubit<UsuarioState> {
  UsuarioCubit() : super(UsuarioInitial());

  void establecerUsaurio(Usuario usuario) {
    emit(UsuarioCreated(usuario));
  }

  void changeAge(int edad) {
    if (state.runtimeType == UsuarioCreated) {
      final usuario = (state as UsuarioCreated).usuario.copyWith(edad: edad);
      emit(UsuarioCreated(usuario));
    }
  }

  void addProfesion() {
    if (state.runtimeType == UsuarioCreated) {
      final usuario = (state as UsuarioCreated).usuario;
      final newUsuario = usuario.copyWith(profesiones: [
        ...usuario.profesiones,
        'Profesion ${usuario.profesiones.length + 1}'
      ]);
      emit(UsuarioCreated(newUsuario));
    }
  }

  void deleteUser() {
    emit(UsuarioInitial());
  }
}
