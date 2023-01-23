import 'package:flutter/material.dart';

class SharaInput extends StatelessWidget {
  const SharaInput(this.hint, {super.key});

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            fontFamily: 'Hellix',
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
