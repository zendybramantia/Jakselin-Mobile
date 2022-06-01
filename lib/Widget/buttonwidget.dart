import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.title,
    required this.color,
    required this.namedRoute,
  }) : super(key: key);

  final String namedRoute;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        primary: color,
      ),
      onPressed: () {
        Navigator.pushNamed(context, namedRoute);
      },
      child: Text(title,
          style: const TextStyle(fontSize: 20, color: Colors.white)),
    );
  }
}
