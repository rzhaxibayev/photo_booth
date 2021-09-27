import 'package:flutter/material.dart';

/// List of saved photos
class PhotosScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PhotosScreenState();
}

class _PhotosScreenState extends State<PhotosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Photos'),
      ),
      body: Center(
        child: Text('Photos screen'),
      ),
    );
  }
}
