/*
 * Created by Hernán Rodríguez
 * Copyright (c) 2023
 */

import 'package:shared_preferences/shared_preferences.dart';

// Clase para manejar el almacenamiento de SharedPreferences para el nombre de usuario
class UserNameSharedPreferences {
  // Método para obtener el nombre de usuario almacenado en SharedPreferences
  static Future<String?> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  // Método para guardar el nombre de usuario en SharedPreferences
  static Future<void> saveUsername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
  }

  // Método para eliminar el nombre de usuario de SharedPreferences
  static Future<void> removeUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
  }
}
