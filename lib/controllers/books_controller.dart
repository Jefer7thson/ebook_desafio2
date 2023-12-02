import 'package:dio/dio.dart';
import 'package:ebook_desafio2/models/book.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class BooksController extends GetxController {
  RxList<Book> books = <Book>[].obs;
  RxList<Book> favorites = <Book>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    final String apiUrl = 'https://escribo.com/books.json';

    try {
      final response = await Dio().get(apiUrl);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data as List<dynamic>;

        final List<Book> fetchedBooks = data.map((item) {
          return Book(
            id: item['id'] as int? ?? 0,
            title: item['title'] as String? ?? '',
            author: item['author'] as String? ?? '',
            coverUrl: item['cover_url'] as String? ?? '',
            downloadUrl: item['download_url'] as String? ?? '',
            fileUrl: '', content: '', // Defina um valor inicial vazio para o campo fileUrl
          );
        }).toList();

        books.assignAll(fetchedBooks);
      } else {
        print('Erro na solicitação: ${response.statusCode}');
      }
    } catch (error, stacktrace) {
      print('Erro: $error');
      print('Stacktrace: $stacktrace');
    }
  }

  Future<void> downloadEpub(Book book) async {
    try {
      final response = await Dio().get(book.downloadUrl, options: Options(responseType: ResponseType.bytes));

      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/${book.title}.epub';
      final file = File(filePath);
      await file.writeAsBytes(response.data!);

      // Atualiza o campo fileUrl do livro com o caminho do arquivo baixado
      book.fileUrl = filePath;

      // Atualiza a lista de livros para refletir o novo fileUrl
      books.refresh();
    } catch (error, stacktrace) {
      print('Erro ao baixar o arquivo EPUB: $error');
      print('Stacktrace: $stacktrace');
      throw error;
    }
  }
}
