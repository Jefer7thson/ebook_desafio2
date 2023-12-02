import 'package:flutter/material.dart';
import 'package:ebook_desafio2/models/book.dart';

class BookItem extends StatelessWidget {
  final Book book;
  final VoidCallback onTap;
  final VoidCallback onDownload;

  BookItem({
    required this.book,
    required this.onTap,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(book.coverUrl),
            SizedBox(height: 4),
            Text(
              book.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              book.author,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onDownload,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                ),
                child: Text('Download'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
