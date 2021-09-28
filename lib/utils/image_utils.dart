import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

/// opens default camera from device and takes photo
void taketPhoto(
  BuildContext context,
  ImagePicker picker, {
  Function(String, String)? onCaptured,
}) async {
  try {
    final image = await picker.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);
    if (image != null) {
      final bytes = await image.readAsBytes();
      final compressedBytes = await FlutterImageCompress.compressWithList(bytes,
          quality: 50, minWidth: 400);

      final base64Image = base64Encode(bytes);
      final compressedBase64Image = base64Encode(compressedBytes);
      onCaptured?.call(base64Image, compressedBase64Image);
    }
  } catch (exception) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Something wrong')));
  }
}
