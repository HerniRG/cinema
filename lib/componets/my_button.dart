import 'package:flutter/material.dart';

// Definición de la clase MyButton
class MyButton extends StatelessWidget {
  final Function()? onTap;

  // Constructor de MyButton con un evento onTap
  const MyButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // Detecta el toque (tap) en el widget
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'Iniciar Usuario',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
