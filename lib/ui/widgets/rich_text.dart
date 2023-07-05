import 'package:flutter/material.dart';

class CustomRichTextWidget extends StatelessWidget {
  final String title;
  final String text;

  const CustomRichTextWidget(
      {super.key, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            text: '$title:  ',
          ),
          TextSpan(
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              text: text),
        ],
      ),
    );
  }
}
