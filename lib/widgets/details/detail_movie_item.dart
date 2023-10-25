import 'package:flutter/material.dart';

// Widget para mostrar un elemento de detalles
Widget detailMovieItem(String label, String value,
    {double fontSize = 16, FontWeight fontWeight = FontWeight.normal}) {
  return value.isEmpty
      ? const SizedBox() // Oculta el elemento si el valor está vacío
      : ListTile(
          title: Text(
            label,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            value,
            style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: fontWeight),
          ),
        );
}
