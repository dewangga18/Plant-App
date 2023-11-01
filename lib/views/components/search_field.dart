import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.focus,
    required this.closeTap,
    required this.onChanged,
  });

  final FocusNode focus;
  final Function() closeTap;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focus,
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 10),
        hintText: 'Search',
        prefixIcon: Icon(
          Icons.search,
          color: Colors.green.shade800,
        ),
        suffixIcon: IconButton(
          onPressed: closeTap,
          splashRadius: 18,
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.green.shade800),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.green.shade800),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.green.shade800),
        ),
      ),
    );
  }
}
