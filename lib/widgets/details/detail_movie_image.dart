import 'package:flutter/material.dart';

// Función para construir una imagen de una película
Widget detailMovieImage(Map<String, dynamic> movie) {
  return Stack(
    children: [
      // Tarjeta con la imagen de la película
      Card(
        elevation: 10,
        clipBehavior: Clip.antiAlias,
        child: Image.network(
          'https://image.tmdb.org/t/p/w300${movie['poster_path']}',
          fit: BoxFit.cover,
          height: 300,
        ),
      ),
      // Icono de zoom en la esquina superior derecha
      const Positioned(
        top: 5,
        right: 5,
        child: Icon(
          Icons.zoom_in,
          color: Colors.white,
          size: 30,
          shadows: [BoxShadow(color: Colors.black, blurRadius: 10)],
        ),
      ),
    ],
  );
}
