class Book {
  final int id;
  final String title;
  final String author;
  final String coverUrl;
  final String downloadUrl;
  late final String fileUrl;
  final String content; // Adicione este campo

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.downloadUrl,
    required this.fileUrl,
    required this.content,
  });
}
