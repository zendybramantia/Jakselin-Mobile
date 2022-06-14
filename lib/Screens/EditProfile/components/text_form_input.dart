import 'package:flutter/material.dart';
import 'package:jakselin/constants.dart';

class TextFormInput extends StatelessWidget {
  const TextFormInput({
    Key? key,
    required this.label,
    required this.isPassword,
    this.control,
  }) : super(key: key);

  final String label;
  final bool isPassword;
  final TextEditingController? control;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: control,
        obscureText: isPassword,
        cursorColor: Theme.of(context).cursorColor,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 53, 52, 52),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kPrimariColor),
          ),
        ),
      ),
    );
  }
}
