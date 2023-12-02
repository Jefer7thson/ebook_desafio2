import 'package:flutter/material.dart';

class FavoriteIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isFavorite;

  FavoriteIcon({required this.onPressed, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : null,
      ),
      onPressed: onPressed,
    );
  }
}
