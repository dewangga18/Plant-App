import 'package:flutter/material.dart';

class CText extends StatelessWidget {
  final String text;
  final double size;
  final double? wordSpacing, letterSpacing;
  final Color color;
  final FontWeight? weight;
  final TextOverflow? overflow;
  final bool softWrap;

  const CText({
    Key? key,
    required this.text,
    this.size = 14,
    this.color = Colors.black,
    this.weight,
    this.softWrap = true,
    this.overflow,
    this.wordSpacing,
    this.letterSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: weight,
        wordSpacing: wordSpacing,
        letterSpacing: letterSpacing,
      ),
      softWrap: softWrap,
      overflow: overflow,
    );
  }
}
