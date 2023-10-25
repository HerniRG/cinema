import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Establece la orientación predeterminada de la aplicación como retrato
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Inicia la aplicación
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'HRG MasterD',
      color: Colors.deepPurple,

      // Desactiva la etiqueta de depuración en la esquina superior derecha
      debugShowCheckedModeBanner: false,

      // Define la página de inicio de la aplicación como LoginPage
      home: LoginPage(),
    );
  }
}
