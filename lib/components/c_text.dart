import 'package:flutter/material.dart';

class CText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  
  const CText({
    Key? key, 
    required this.text, 
    this.size = 14, 
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: size, color: color),
    );
  }
}
