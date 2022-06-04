import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.press,
    required this.text,
  }) : super(key: key);
  final VoidCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        primary: const Color(0xffF0585B),
      ),
      onPressed: press,
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
