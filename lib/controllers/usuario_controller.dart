import 'dart:math';

import 'package:estados/models/usuario.dart';
import 'package:get/get.dart';

class UsuarioController extends GetxController {
  var existeUsuario = false.obs;

  var usuario = Usuario.empty().obs;
  void establecerUsuario(Usuario usuario) {
    existeUsuario.value = true;
    this.usuario.value = usuario;
  }

  void cambairEdad() {
    int edad = Random().nextInt(90);
    usuario.value = usuario.value.copyWith(edad: edad);
  }

  void adicinarProfesion() {
    String profesion = "Profesion ${usuario.value.profesiones.length + 1}";
    List<String> profesiones = usuario.value.profesiones;
    profesiones.add(profesion);
    usuario.value = usuario.value.copyWith(profesiones: profesiones);
  }

  void borrarUsuario() {
    existeUsuario.value = false;
    usuario.value = Usuario.empty();
  }
}
