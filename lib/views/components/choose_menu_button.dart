import 'package:flutter/material.dart';
import 'package:plant_app/views/components/c_text.dart';

class ChooseMenuButton extends StatelessWidget {
  final String text;
  final int index;
  final bool isActive;
  final Function() onTap;

  const ChooseMenuButton({
    Key? key,
    required this.text,
    required this.index,
    required this.isActive,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: isActive ? Colors.green.shade800 : Colors.white70,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.green.shade800),
        ),
        elevation: 0,
      ),
      child: CText(
        text: text,
        color: isActive ? Colors.white : Colors.green.shade800,
        size: 14,
        weight: FontWeight.w500,
      ),
    );
  }
}
