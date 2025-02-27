import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final Icon icon;
  final void Function()? onPressed;

  const BottomButton({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon, //
          const SizedBox(height: 4),
          Text(title,
              style: const TextStyle(
                color: Colors.indigo,
                fontSize: 12,
              )),
        ],
      ),
    );
  }
}
