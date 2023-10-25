/*
 * Created by Hernán Rodríguez
 * Copyright (c) 2023
 */

import 'package:flutter/material.dart';

// Widget para un encabezado con un ícono y texto
class IconAndTextHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const IconAndTextHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Hero(
          tag: 'iconHeader',
          child: Image.asset(
            'assets/images/iconHeader.png',
            height: 120,
            width: 120,
          ),
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 50, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: FittedBox(
            child: Text(
              subtitle,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
