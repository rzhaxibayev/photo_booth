import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:photo_booth/modules/domain/photos/entity/photo_entity.dart';

class PhotoItemWidget extends StatelessWidget {
  final Photo? photo;

  const PhotoItemWidget({Key? key, required this.photo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              colorFilter: ColorFilter.mode(
                Colors.black.withAlpha(10),
                BlendMode.luminosity,
              ),
              image: Image.memory(
                base64Decode(photo?.image ?? ''),
                width: MediaQuery.of(context).size.width,
              ).image,
              fit: BoxFit.cover),
        ),
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                photo?.fullName ?? 'No name',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                photo?.date ?? '',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
