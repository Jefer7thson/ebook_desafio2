// favorites_screen.dart
import 'package:flutter/material.dart';
import 'package:ebook_desafio2/controllers/favorites_controller.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  final FavoritesController favoritesController = Get.put(FavoritesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Favoritos'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: favoritesController.favorites.length,
          itemBuilder: (context, index) {
            final book = favoritesController.favorites[index];
            return ListTile(
              title: Text(book.title),
              // Outros detalhes do livro conforme necessário
            );
          },
        ),
      ),
    );
  }
}
