import 'package:ebook_desafio2/models/book.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/books_controller.dart';
import '../controllers/favorites_controller.dart';

class ReaderScreen extends StatelessWidget {
  final BooksController booksController = Get.find();
  final FavoritesController favoritesController = Get.find();
  final Book book;

  ReaderScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Center(
        child: Text('Conteúdo do livro aqui'),
      ),
    );
  }
}
