import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ebook_desafio2/controllers/books_controller.dart';
import 'package:ebook_desafio2/screens/bookshelf_screen.dart';

class InitialScreen extends StatelessWidget {
  final BooksController booksController = Get.put(BooksController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF1B9DFF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch, 
          children: [
           
            Image.asset(
              'assets/escribo.png', 
              height: 200, 
              width: 100, 
            ),
            SizedBox(height: 20), 
            ElevatedButton(
              onPressed: () async {
                await booksController.fetchBooks();
                Get.to(() => BookshelfScreen());
              },
              child: Text('Ir para a Estante Virtual'),
            ),
          ],
        ),
      ),
    );
  }
}
