import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/initial_screen.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App de Livros',
      home: InitialScreen(),
    );
  }
}
