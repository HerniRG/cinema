/*
 * Created by Hernán Rodríguez
 * Copyright (c) 2023
 */

import 'package:flutter/material.dart';
import '../../pages/details_page.dart';

// Widget para mostrar una tarjeta de película
Widget movieCard(dynamic movie, context) {
  final title = movie['title'];
  final stars = movie['vote_average'].toStringAsFixed(1);

  final imageUrl = movie['backdrop_path'] != null
      ? 'https://image.tmdb.org/t/p/w500${movie['backdrop_path']}'
      : 'https://cdn-icons-png.flaticon.com/512/11696/11696725.png';

  return GestureDetector(
    onTap: () {
      // Navega a la página de detalles al tocar la tarjeta
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return DetailsPage(movie: movie);
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            // Agrega animación de transición al mostrar la página de detalles
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
      );
    },
    child: Stack(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Muestra la imagen de la película
              FadeInImage.assetNetwork(
                image: imageUrl,
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
                placeholder: 'assets/images/iconHeaderNative.png',
                imageErrorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.error,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: FittedBox(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Muestra la puntuación si está disponible, o se oculta si no hay puntuación
        Positioned(
          top: 15,
          right: 15,
          child: stars == '0' || stars == '0.0'
              ? const Card(
                  color: Colors.amber,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Sin Valorar',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ))
              : Stack(
                  alignment: Alignment.center,
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 60,
                    ),
                    Text(
                      stars,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
        )
      ],
    ),
  );
}
