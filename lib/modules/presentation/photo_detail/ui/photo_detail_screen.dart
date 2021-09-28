import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:photo_booth/modules/domain/photos/entity/photo_entity.dart';

/// Detailed full screen photo
class PhotoDetailScreen extends StatelessWidget {
  final Photo photo;

  const PhotoDetailScreen({Key? key, required this.photo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: SafeArea(
        child: Stack(
          children: [
            Center(
              child: InteractiveViewer(
                minScale: 0.5,
                maxScale: 2,
                child: Image.memory(
                  base64Decode(photo.image),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              top: 24,
              left: 16,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close_rounded,
                    color: Colors.white,
                    size: 36,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
