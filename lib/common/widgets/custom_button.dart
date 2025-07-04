// lib/common/widgets/custom_button.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final double borderWidth;

  /// Corner radius
  final double borderRadius;

  /// Fixed width; defaults to full width
  final double buttonWidth;
  final double buttonHeight;

  /// Font size for the button text
  final double fontSize;

  /// Font family for the button text
  final String fontFamily;

  /// Font weight for the button text
  final FontWeight fontWeight;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.primaryColor,
    this.textColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.borderWidth = 0,
    this.borderRadius = 30,
    this.buttonWidth = double.infinity,
    this.fontSize = 16,
    this.fontFamily = 'Poppins',
    this.fontWeight = FontWeight.bold,
    this.buttonHeight = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: buttonHeight,
        width: buttonWidth,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor, width: borderWidth),
        ),
        child: Text(
          text,
          style: GoogleFonts.getFont(
            fontFamily,
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
