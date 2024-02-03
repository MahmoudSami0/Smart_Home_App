import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {Key? key,
      required this.text,
      this.color = Colors.black,
      this.fontSize = 18,
      this.isBold = false,  this.textAlign = TextAlign.start,  this.maxLines = 1})
      : super(key: key);

  final bool isBold;
  final String text;
  final double fontSize;
  final Color color;
  final TextAlign textAlign;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines ,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: color,

        fontSize: fontSize,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
