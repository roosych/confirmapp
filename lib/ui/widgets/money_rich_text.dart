import 'package:flutter/material.dart';

class MoneyRichTextWidget extends StatelessWidget {
  final String value;
  final String symbol;
  final double valueFontSize;
  final double currencyFontSize;

  const MoneyRichTextWidget(
      {super.key,
      required this.value,
      required this.symbol,
      required this.valueFontSize, required this.currencyFontSize});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: valueFontSize),
            text: '$value ',
          ),
          TextSpan(
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: currencyFontSize),
              text: symbol),
        ],
      ),
    );
  }
}
