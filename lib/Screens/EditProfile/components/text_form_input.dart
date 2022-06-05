import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:jakselin/constants.dart';

class TextFormInput extends StatelessWidget {
  const TextFormInput({
    Key? key,
    required this.label,
    required this.isPassword,
  }) : super(key: key);

  final String label;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        obscureText: isPassword,
        cursorColor: Theme.of(context).cursorColor,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kPrimariColor),
          ),
        ),
      ),
    );
  }
}
