import 'package:flutter/cupertino.dart';

class AppGradients {
  static const LinearGradient darkGreyToBlack = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [

      Color(0xFF6E6E6E),
      Color(0xFF1A1A1A),
    ],
    stops: [0.0, 1.0],
  );
  static const LinearGradient blackToDarkGray = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF1A1A1A),
      Color(0xFF6E6E6E),

    ],
    stops: [0.0, 1.0],
  );
}
