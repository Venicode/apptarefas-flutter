
import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {

  final int dificultyLevel;

  const Difficulty({
    required this.dificultyLevel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
          color: (dificultyLevel >= 1) ? Colors.lightGreen : Colors.lightGreen[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (dificultyLevel >= 2) ? Colors.lightGreen : Colors.lightGreen[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (dificultyLevel >= 3) ? Colors.lightGreen : Colors.lightGreen[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (dificultyLevel >= 4) ? Colors.lightGreen : Colors.lightGreen[100],
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (dificultyLevel >= 5) ? Colors.lightGreen : Colors.lightGreen[100],
        ),
      ],
    );
  }
}