import 'package:flutter/material.dart';
import 'package:quizapp/configs/themes/app_colors.dart';

class LouncherButton extends StatelessWidget {
  const LouncherButton({
    Key? key,
    required this.icon,
    required this.size,
    required this.label,
 
    required this.onPressed,
    this.padding = 0.0,
    this.isPadding = false,
  }) : super(key: key);
  final IconData icon;

  final double? size;
  final double padding;
  final String label;
  final VoidCallback onPressed;
  final bool isPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton.icon(
            onPressed: onPressed,
            icon: Icon(
              icon,
              size: size,
           
            ),
            label: const Text('')),
        Text(
          label,
          // style: const TextStyle(color: onSurfaceTextColor, fontSize: 14),
        ),
      ],
    );
  }
}
