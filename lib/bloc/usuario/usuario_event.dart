part of 'usuario_bloc.dart';

@immutable
abstract class UsuarioEvent{

}

class ActivarUsuario extends UsuarioEvent{
  final Usuario usuario;
  ActivarUsuario(this.usuario);
}

class CambiarEdad extends UsuarioEvent{
  final int edad;
  CambiarEdad(this.edad);
}

class AgregarProfesion extends UsuarioEvent{
  final String nuevaProfesion;
  AgregarProfesion(this.nuevaProfesion);
}

class BorrarUsuario extends UsuarioEvent{

}