/*
 * Created by Hernán Rodríguez
 * Copyright (c) 2023
 */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/details/detail_movie_image.dart';
import '../widgets/details/detail_movie_item.dart';
import '../widgets/details/detail_movie_item_with_icon.dart';
import '../widgets/details/fullscreen_dialog.dart';

// Página de detalles de una película
class DetailsPage extends StatelessWidget {
  final Map<String, dynamic> movie;

  // Constructor que recibe datos de la película
  const DetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    // Extracción de datos de la película
    final title = movie['title'];
    final originalTitle = movie['original_title'];
    final releaseDate =
        DateFormat('dd-MM-yyyy').format(DateTime.parse(movie['release_date']));
    final overview = movie['overview'];
    final voteAverage = movie['vote_average'].toStringAsFixed(1);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'Detalles de la película',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            children: [
              // Imagen de la película con posibilidad de ampliación
              GestureDetector(
                onTap: () {
                  showFullScreenImageDialog(context,
                      'https://image.tmdb.org/t/p/w300${movie['poster_path']}');
                },
                child: detailMovieImage(movie),
              ),
              const SizedBox(height: 20),
              // Detalles de la película en una tarjeta
              Card(
                elevation: 10,
                color: Colors.black,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    // Título de la película
                    detailMovieItem('Título', title,
                        fontSize: 24, fontWeight: FontWeight.bold),
                    // Título original de la película
                    detailMovieItem('Título Original', originalTitle,
                        fontSize: 18),
                    // Fecha de lanzamiento
                    detailMovieItem('Fecha de Lanzamiento', releaseDate,
                        fontSize: 18),
                    // Puntuación promedio con ícono de estrella
                    detailMovieItemWithIcon('Puntuación Promedio',
                        '$voteAverage', Icons.star, Colors.amber,
                        fontSize: 18),
                    // Descripción de la película
                    detailMovieItem(
                      'Descripción:',
                      overview,
                      fontSize: 14,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
