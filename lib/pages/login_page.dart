import 'package:flutter/material.dart';
import 'package:hernan_rodriguez_masterd/componets/my_textfield.dart';
import 'package:hernan_rodriguez_masterd/data/user_shared_preferences.dart';
import '../componets/my_button.dart';
import '../widgets/login/login_header.dart';
import 'menu_principal.dart';

// Página de inicio de sesión
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = TextEditingController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    checkUserAndNavigate();
  }

  // Verifica si un usuario ha iniciado sesión previamente y navega a la página principal
  Future<void> checkUserAndNavigate() async {
    String? storedUsername = await UserNameSharedPreferences.getUsername();
    if (storedUsername != null) {
      navigateToMenuPrincipal(storedUsername);
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  // Inicia sesión con un nombre de usuario
  Future<void> signUserIn() async {
    String username = loginController.text.trim();
    if (username.isNotEmpty) {
      await UserNameSharedPreferences.saveUsername(username);
      navigateToMenuPrincipal(username);
      loginController.clear();
    } else {
      loginController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ingresa tu nombre. No puede estar vacío.'),
          showCloseIcon: true,
        ),
      );
    }
  }

  // Navega a la página principal
  void navigateToMenuPrincipal(String username) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => MenuPrincipal(username: username),
      ),
      (route) => false,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$username ha iniciado sesión',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green[900],
        showCloseIcon: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const IconAndTextHeader(
                      title: 'Bienvenido',
                      subtitle: 'Inicia sesión para continuar',
                    ),
                    MyTextField(
                      controller: loginController,
                      hintText: 'Escribe tu nombre',
                      headerText: 'Nombre',
                    ),
                    MyButton(
                      onTap: signUserIn,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
