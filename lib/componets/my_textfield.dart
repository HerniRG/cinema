/*
 * Created by Hernán Rodríguez
 * Copyright (c) 2023
 */

import 'package:flutter/material.dart';

// Definición de la clase MyTextField
class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String headerText;
  final String hintText;

  // Constructor de MyTextField con controlador, texto de encabezado y texto de sugerencia
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.headerText,
  });

  @override
  Widget build(BuildContext context) {
    // Contenedor de relleno con una columna de texto y un campo de entrada de texto
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Muestra el texto del encabezado con estilo
          Text(
            headerText,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          // Campo de entrada de texto con estilo de borde y sugerencia
          TextField(
            controller: controller,
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurpleAccent),
              ),
              fillColor: Colors.grey.shade400,
              filled: true,
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
