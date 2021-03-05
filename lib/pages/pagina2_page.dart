import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: usuarioService.existeUsuario
            ? Text(usuarioService.usuario.nombre)
            : Text('Pagina 2'),
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
                final newUser = new Usuario(
                  nombre: "Wilmar",
                  edad: 22,
                  profesiones: ['Full Stack Developer', 'Gamer'],
                );
                usuarioService.usuario = newUser;
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text('Cambiar usuario:',
                  style: TextStyle(color: Colors.white)),
              onPressed: () {
                usuarioService.cambiarEdad(33);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text('Añadir Profesion:',
                  style: TextStyle(color: Colors.white)),
              onPressed: () {
                usuarioService.agregarProfesion();
              },
            ),
          ],
        ),
      ),
    );
  }
}
