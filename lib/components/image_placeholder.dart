
import 'package:flutter/material.dart';

class ImagePlaceholders extends StatelessWidget {
  final String? imagePath;
  const ImagePlaceholders({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        clipBehavior: Clip.hardEdge,
        child: Image.asset(
          imagePath!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
