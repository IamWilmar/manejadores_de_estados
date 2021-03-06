import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:estados/models/usuario.dart';
part 'usuario_event.dart';
part 'usuario_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(UsuarioState());
  //async* es para regresar streams
  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    if (event is ActivarUsuario) {
      yield state.copyWith(usuario: event.usuario);
    } else if (event is CambiarEdad) {
      yield state.copyWith(
        usuario: state.usuario.copyWith(edad: event.edad),
      );
    } else if (event is AgregarProfesion) {
      List<String> newProfesions = state.usuario.profesiones;
      newProfesions.add(event.nuevaProfesion);
      yield state.copyWith(
        usuario: state.usuario.copyWith(profesiones: newProfesions),
      );
    } else if (event is BorrarUsuario) {
      yield state.estadoInicial();
    }
  }
}
