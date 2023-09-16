import 'package:bloc/bloc.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';

part 'usuario_event.dart';
part 'usuario_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(const UsuarioInitial()) {
    on<ActivateUsuario>(
        (event, emit) => emit(UsuarioSetState(newUsuario: event.usuario)));

    on<ChangeAgeUsuario>((event, emit) {
      if (!state.exiteUsuario) return;
      emit(UsuarioSetState(
          newUsuario: state.usuario!.copyWith(edad: event.edad)));
    });

    on<AddProUsuario>((event, emit) {
      if (!state.exiteUsuario) return;
      final usuario = state.usuario;
      final Usuario newUsuario = usuario!.copyWith();
      newUsuario.profesiones.add("Profesion ${usuario.profesiones.length + 1}");
      emit(UsuarioSetState(newUsuario: newUsuario));
    });
    on<DeleteUsuario>((event, emit) {
      emit(const UsuarioInitial());
    });
  }
}
