import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          initialData: usuarioService.usuario,
          builder: (context, AsyncSnapshot<Usuario> snapshot) {
            return snapshot.hasData ? Text(snapshot.data.nombre) : Text('Pagina 2'); 
          }
        ),
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
                final nuevoUsuario = new Usuario(
                  nombre: 'Wilmar',
                  edad: 22
                );
                usuarioService.cargarUsuario(nuevoUsuario);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text('Cambiar Edad:',
                  style: TextStyle(color: Colors.white)),
              onPressed: () {
                usuarioService.cambiarEdad(50);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: Text('Añadir Profesion:',
                  style: TextStyle(color: Colors.white)),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
