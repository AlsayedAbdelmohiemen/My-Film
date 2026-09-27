import 'package:flutter/material.dart';

class Logo extends StatelessWidget {

  final double height;

  const Logo({

    required this.height,
  })  : assert(height > 0, 'height should be greater than 0'),
        super();

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Image.asset(
      'assets/images/logo.png',
      color: Colors.white,
      height: height*3,
    );
  }
}