// estante_virtual_screen.dart
import 'package:flutter/material.dart';
import 'package:ebook_desafio2/controllers/books_controller.dart';
import 'package:ebook_desafio2/controllers/favorites_controller.dart';
import 'package:ebook_desafio2/screens/favorites_screen.dart';
import 'package:ebook_desafio2/screens/book_details_screen.dart';  // Importe a nova tela
import 'package:ebook_desafio2/widgets/book_item.dart';
import 'package:get/get.dart';

class EstanteVirtualScreen extends StatelessWidget {
  final BooksController booksController = BooksController();

  @override
  Widget build(BuildContext context) {
    booksController.fetchBooks();

    return Scaffold(
      appBar: AppBar(
        title: Text('Estante Virtual'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              // Navegar para a tela de favoritos
              Get.to(() => FavoritesScreen());
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: booksController.books.length,
              itemBuilder: (context, index) {
                final book = booksController.books[index];

                return BookItem(
                  book: book,
                  onTap: () async {
                    // Navegar para a tela de detalhes do livro
                    Get.to(() => BookDetailsScreen(book: book));
                  },
                  onDownload: () async {
                    // Adicione lógica para fazer o download do livro.
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Download do livro: ${book.title}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
