import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final Icon icon;

  const BottomButton({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
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
