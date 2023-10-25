/*
 * Created by Hernán Rodríguez
 * Copyright (c) 2023
 */

import 'package:flutter/material.dart';
import '../../fetch/fetch_data_movie.dart';
import 'menu_movie_card.dart';

// Widget para mostrar una lista de películas basadas en una categoría
FutureBuilder<List<dynamic>> movieList(String category) {
  return FutureBuilder<List<dynamic>>(
    future: fetchMovies(category),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        // Muestra un indicador de carga mientras se obtienen los datos
        return const Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        // Muestra un mensaje de error si hay un problema al cargar las películas
        return Center(child: Text('Error al cargar películas $category'));
      } else {
        // Muestra una lista de tarjetas de películas cuando los datos están disponibles
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: snapshot.data?.length ?? 0,
          itemBuilder: (context, index) {
            // Utiliza el widget movieCard para representar cada película
            return movieCard(snapshot.data![index], context);
          },
        );
      }
    },
  );
}
