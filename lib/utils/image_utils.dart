import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

/// opens default camera from device and takes photo
void taketPhoto(
  BuildContext context,
  ImagePicker picker, {
  Function(String)? onCaptured,
}) async {
  try {
    final image = await picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.rear,
        imageQuality: 80);
    if (image != null) {
      final bytes = await image.readAsBytes();
      final base64Image = base64Encode(bytes);
      onCaptured?.call(base64Image);
    }
  } catch (exception) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Something wrong')));
  }
}
