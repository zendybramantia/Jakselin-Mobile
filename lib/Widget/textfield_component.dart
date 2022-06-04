import 'package:flutter/material.dart';
import 'package:jakselin/constants.dart';

class TextFieldComponent extends StatefulWidget {
  const TextFieldComponent({
    Key? key,
    required this.size,
    required this.title,
    this.controller,
  }) : super(key: key);

  final TextEditingController? controller;
  final String title;
  final Size size;

  @override
  State<TextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.blue,
      width: widget.size.width * 0.75,
      child: Flex(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        direction: Axis.horizontal,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
          Flexible(
            flex: 1,
            child: SizedBox(
              width: widget.size.width * 0.54,
              height: 34,
              child: TextFormField(
                controller: widget.controller,
                cursorColor: Colors.redAccent,
                decoration: const InputDecoration(
                  // enabledBorder: InputBorder.none,
                  // focusedBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
                  // hintText: 'What do people call you?',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimariColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimariColor),
                  ),
                ),
                onSaved: (String? value) {
                  // This optional block of code can be used to run
                  // code when the user saves the form.
                },
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
