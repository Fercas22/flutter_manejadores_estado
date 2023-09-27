import 'package:estados_app/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados_app/bloc/usuario/usuario_cubit.dart';
class Pagina1Page extends StatelessWidget {
  const Pagina1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => context.read<UsuarioCubit>().borrarUsuario(),
          )
        ],
      ),
      // body: InformacionUsuario(),
      body: BlocBuilder<UsuarioCubit, UsuarioState>(
        builder: ( _ , state) {
          switch (state.runtimeType) {
            case UsuarioInitial:
              return const Center(child: Text('No hay informacion del usuario'));
            case UsuarioActivo: 
              return InformacionUsuario((state as UsuarioActivo).usuario);
            default: 
              return const Center(child: Text('data'));
          }
          // if (state is UsuarioInitial) {
          //   return const Center(child: Text('No hay informacion del usuario'),);
          // } else if (state is UsuarioActivo) {
          //   return InformacionUsuario(state.usuario);
          // } return const Center(child: Text('data'),);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigate_next_rounded),
        onPressed: () => Navigator.pushNamed(context, 'pagina2')
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario(this.usuario, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
          const Divider(),
          ListTile(
            title: Text('Nombre: ${usuario.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${usuario.edad}'),
          ),
          const Text(
            'Profesiones',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
          const Divider(),
          ...usuario.profesiones!.map(
            (profesion) => ListTile(title: Text(profesion),)
          ).toList()
        ],
      ),
    );
  }
}