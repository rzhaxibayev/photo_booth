import 'package:flutter/material.dart';

class HomeActionButton extends StatelessWidget {
  final String title;
  final Function? onPressed;

  const HomeActionButton({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed?.call();
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.blueAccent,
        minimumSize: Size(200, 56),
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
