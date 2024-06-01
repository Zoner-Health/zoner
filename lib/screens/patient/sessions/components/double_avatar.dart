import 'package:flutter/material.dart';

class DoubleAvatar extends StatelessWidget {
  final String imagePath1;
  final String imagePath2;
  final Color? strokeColor;
  const DoubleAvatar(
      {super.key,
      required this.imagePath1,
      required this.imagePath2,
      this.strokeColor});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          child: CircleAvatar(
            backgroundImage: AssetImage(imagePath1),
            radius: 48,
          ),
        ),
        Positioned(
          top: 0,
          left: 64,
          child: CircleAvatar(
            backgroundImage: AssetImage(imagePath2),
            radius: 48,
          ),
        ),
      ],
    );
  }
}
