import 'package:flutter/material.dart';

class CustomBackgroundImage extends StatelessWidget {
  final Widget child;

  const CustomBackgroundImage({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background_gradient_image.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        color: Colors.black.withOpacity(0.2),
        child: child,
      ),
    );
  }
}
