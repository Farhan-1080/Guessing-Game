import 'package:color_guessing_game/Guessing.dart';
import 'package:flutter/material.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Guessing(),
      debugShowCheckedModeBanner: false,
    );
  }
}
