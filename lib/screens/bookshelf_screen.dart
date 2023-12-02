import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ebook_desafio2/controllers/books_controller.dart';
import 'package:ebook_desafio2/widgets/book_item.dart';

class BookshelfScreen extends StatelessWidget {
  final BooksController booksController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estante Virtual'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Obx(() => Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: booksController.books.map((book) {
              return BookItem(book: book, onTap: () {}, onDownload: () {});
            }).toList(),
          )),
        ),
      ),
    );
  }
}
