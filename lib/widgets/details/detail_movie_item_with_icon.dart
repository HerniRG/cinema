/*
 * Created by Hernán Rodríguez
 * Copyright (c) 2023
 */

import 'package:flutter/material.dart';

// Widget para mostrar un elemento de detalles con un ícono
Widget detailMovieItemWithIcon(
    String label, String value, IconData icon, Color iconColor,
    {double fontSize = 16, FontWeight fontWeight = FontWeight.normal}) {
  return ListTile(
    title: Text(
      label,
      style: const TextStyle(
          color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
    ),
    subtitle: Row(
      children: [
        Icon(icon, color: iconColor), // Icono
        Text(
          value == "0" ? "Sin valorar" : value, // Valor
          style: TextStyle(
              color: Colors.white, fontSize: fontSize, fontWeight: fontWeight),
        ),
      ],
    ),
  );
}
