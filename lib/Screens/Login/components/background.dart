import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.size,
    required this.child,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: SizedBox(
                width: size.width,
                child: Image.asset(
                  "assets/images/LoginPage/Chill in the park.png",
                  scale: size.width * 0.001,
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.14,
              child: Image.asset(
                'assets/images/LoginPage/Jakselin-1.png',
                scale: size.width * 0.002,
              ),
            ),
          ],
        ),
        child,
      ],
    );
  }
}
