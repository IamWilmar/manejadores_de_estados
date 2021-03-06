import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            MaterialButton(
              color: Colors.blue,
              child: Text('Establecer Usuario:',
                  style: TextStyle(color: Colors.white)),
              onPressed: () {
                final bloc =
                    BlocProvider.of<UsuarioCubit>(context, listen: false);
                final newUser = new Usuario(
                  nombre: 'Wilmar',
                  edad: 21,
                  profesiones: ['FullStack', 'Flutter dev'],
                );
                bloc.seleccionarUsuario(newUser);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text('Cambiar usuario:',
                  style: TextStyle(color: Colors.white)),
              onPressed: () {
                final bloc =
                    BlocProvider.of<UsuarioCubit>(context, listen: false);
                bloc.cambiarEdad(30);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text('Añadir Profesion:',
                  style: TextStyle(color: Colors.white)),
              onPressed: () {
                final bloc = BlocProvider.of<UsuarioCubit>(context, listen: false);
                bloc.addProfesion();
              },
            ),
          ],
        ),
      ),
    );
  }
}
