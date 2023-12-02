import 'package:get/get.dart';
import '../models/book.dart';

class FavoritesController extends GetxController {
  RxList<Book> favorites = <Book>[].obs;

  void addOrRemoveFavorite(Book book) {
    if (favorites.contains(book)) {
      favorites.remove(book);
    } else {
      favorites.add(book);
    }
  }

  bool isFavorite(Book book) {
    return favorites.contains(book);
  }
}
