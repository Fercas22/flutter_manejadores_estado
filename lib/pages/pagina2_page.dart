import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:estados_app/bloc/usuario/usuario_cubit.dart';
import 'package:estados_app/models/usuario.dart';
class Pagina2Page extends StatelessWidget {
  const Pagina2Page({super.key});

  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Establecer Usuario',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              onPressed: () {
                final newUser = Usuario(
                  nombre: 'Fernando Miguel',
                  edad: 22,
                  profesiones: [
                    'Egresado de la UPChiapas',
                    'Trabajador'
                  ]
                );
                // context.read<UsuarioCubit>().seleccionarUsuario(newUser);
                usuarioCubit.seleccionarUsuario(newUser);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Cambiar Edad',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              onPressed: () {
                usuarioCubit.cambiarEdad(30);
              },
            ),
            MaterialButton(
              color: Colors.blue,
              child: const Text(
                'Añadir Profesion',
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              onPressed: () {
                usuarioCubit.agregarProfesion();
              },
            )
          ],
        ),
      ),
    );
  }
}