import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
    required this.size,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: size.height * 0.085,
              child: Image.asset(
                'assets/images/RegisterPage/Vector.png',
                width: size.width,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Image.asset(
                "assets/images/RegisterPage/Traveling in a minivan with suitcases on the roof.png",
                width: size.width,
              ),
            ),
          ],
        ),
        child,
      ],
    );
  }
}
