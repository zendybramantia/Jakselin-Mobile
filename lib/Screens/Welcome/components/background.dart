import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(alignment: Alignment.center, children: <Widget>[
      Positioned(
        top: size.height * 0.14,
        left: size.width * 0.15,
        child: const Text(
          'Selamat Datang di',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      Positioned(
        top: size.height * 0.17,
        child: Image.asset("assets/images/LandingPage/Jakselin-2.png",
            width: size.width * 0.9),
      ),
      Positioned(
          bottom: 0,
          child: SizedBox(
            width: size.width,
            child: Image.asset(
              "assets/images/LandingPage/Vision.png",
              scale: size.width * 0.001,
            ),
          )),
      Positioned(
          right: size.width * 0.1, bottom: size.height * 0.1, child: child),
    ]);
  }
}
