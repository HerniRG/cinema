/*
 * Created by Hernán Rodríguez
 * Copyright (c) 2023
 */

import 'dart:convert';
import 'package:http/http.dart' as http;

// Función para buscar películas en una categoría específica
Future<List<dynamic>> fetchMovies(String category) async {
  const apiKey = 'TuApiKey';
  const language = 'es-ES';
  const page = 1;

  // Construye la URL de la API
  final url = Uri.parse(
      'https://api.themoviedb.org/3/movie/$category?language=$language&page=$page&api_key=$apiKey');

  // Realiza una solicitud HTTP GET
  final response = await http.get(url);

  // Comprueba si la respuesta es exitosa (código de estado 200)
  if (response.statusCode == 200) {
    // Decodifica la respuesta JSON
    final data = json.decode(response.body);

    // Comprueba si existen resultados de películas en los datos
    if (data['results'] != null) {
      return data['results'];
    }
  }

  // Si no hay datos válidos, retorna una lista vacía
  return [];
}
