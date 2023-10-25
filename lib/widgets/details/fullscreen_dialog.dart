/*
 * Created by Hernán Rodríguez
 * Copyright (c) 2023
 */

import 'package:flutter/material.dart';

// Función para mostrar una imagen en pantalla completa en un diálogo
void showFullScreenImageDialog(BuildContext context, String imageUrl) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop(); // Cierra el diálogo al tocar la imagen
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imageUrl, // Muestra la imagen desde la URL
              fit: BoxFit.contain,
            ),
          ),
        ),
      );
    },
  );
}
