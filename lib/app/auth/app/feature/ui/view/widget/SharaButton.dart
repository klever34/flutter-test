import 'package:flutter/material.dart';

class SharaButton extends StatelessWidget {
  const SharaButton({
    super.key,
    required this.buttonType,
    required this.title,
    required this.showIcon,
    required this.onPress,
  });

  final String buttonType;
  final String title;
  final bool showIcon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPress(),
      style: ElevatedButton.styleFrom(
        elevation: 10,
        textStyle: const TextStyle(color: Colors.black),
        backgroundColor: buttonType == 'inverted'
            ? const Color(0xFFECECEC)
            : const Color(0xFF000000),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              color: buttonType == 'inverted'
                  ? const Color(0xFF5C5C5C)
                  : const Color(0xFFFFFFFF),
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: 'Hellix',
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          if (showIcon)
            const Icon(
              Icons.arrow_forward,
              size: 16,
              color: Colors.black,
            ),
        ],
      ),
    );
  }
}
