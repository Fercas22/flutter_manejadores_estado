import 'package:flutter/material.dart';

import 'package:estados_app/pages/pagina1_page.dart';
import 'package:estados_app/pages/pagina2_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: 'pagina1',
      routes: {
        'pagina1' : ( _ ) => const Pagina1Page(),
        'pagina2' : ( _ ) => const Pagina2Page(),
      },
    );
  }
}
