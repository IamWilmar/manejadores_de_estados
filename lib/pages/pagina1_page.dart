import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina1'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              final bloc =BlocProvider.of<UsuarioCubit>(context, listen: false);
              bloc.borrarUsuario();
            },
          ),
        ],
      ),
      body: BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios_outlined),
        onPressed: () {
          Navigator.pushNamed(context, 'pagina2');
        },
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(
      builder: (_, state) {
        print(state);

        switch (state.runtimeType) {
          case UsuarioInitial:
            return Center(child: Text('No hay informacion del usuario'));
            break;

          case UsuarioActivo:
            return InformacionUsuario(user: (state as UsuarioActivo).usuario);
            break;

          default:
            return Center(child: Text('No hay informacion del usuario'));
        }

        //   if (state is UsuarioInitial) {
        //     return Center(child: Text('No hay información del usuario'));
        //   } else  if(state is UsuarioActivo){
        //     return InformacionUsuario(user: state.usuario);
        //   }
        //   return Center(child: Text('No hay información del usuario'));
      },
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario user;
  const InformacionUsuario({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'General',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ListTile(title: Text('Nombre: ${user.nombre}')),
          ListTile(title: Text('Edad: ${user.edad}')),
          Text(
            'Profesiones',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Divider(),
          ...user.profesiones
              .map((profesion) => ListTile(title: Text(profesion)))
              .toList(),
        ],
      ),
    );
  }
}
