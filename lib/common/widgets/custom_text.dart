import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final String fontFamily;
  final TextAlign textAlign; // new

  const CustomText({
    Key? key,
    required this.text,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.fontFamily = 'Poppins',
    this.textAlign = TextAlign.start, // default alignment
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = GoogleFonts.getFont(
      fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );

    return Text(
      text,
      style: style,
      textAlign: textAlign, // apply it here
    );
  }
}
