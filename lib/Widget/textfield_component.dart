import 'package:flutter/material.dart';
import 'package:jakselin/constants.dart';

class TextFieldComponent extends StatefulWidget {
  const TextFieldComponent({
    Key? key,
    required this.size,
    required this.title,
    this.controller,
    required this.isPassword,
  }) : super(key: key);

  final TextEditingController? controller;
  final String title;
  final Size size;
  final bool isPassword;

  @override
  State<TextFieldComponent> createState() => _TextFieldComponentState();
}

class _TextFieldComponentState extends State<TextFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width * 0.75,
      height: 50,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
        obscureText: widget.isPassword,
        controller: widget.controller,
        cursorColor: Colors.redAccent,
        // initialValue: 'Input text',
        decoration: InputDecoration(
          labelText: widget.title,
          labelStyle: const TextStyle(
            color: kPrimariColor,
          ),
          helperText: null,
          // suffixIcon: Icon(
          //   Icons.check_circle,
          // ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kPrimariColor),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kPrimariColor),
          ),
        ),
      ),
    );
    //     SizedBox(
    //   // color: Colors.blue,
    //   width: widget.size.width * 0.75,
    //   child: Flex(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     direction: Axis.horizontal,
    //     children: [
    //       Text(
    //         widget.title,
    //         style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
    //       ),
    //       Flexible(
    //         flex: 1,
    //         child: SizedBox(
    //           width: widget.size.width * 0.54,
    //           height: 34,
    //           child: TextFormField(
    //             obscureText: widget.isPassword,
    //             controller: widget.controller,
    //             cursorColor: Colors.redAccent,
    //             decoration: const InputDecoration(
    //               // enabledBorder: InputBorder.none,
    //               // focusedBorder: InputBorder.none,
    //               contentPadding:
    //                   EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
    //               // hintText: 'What do people call you?',
    //               border: OutlineInputBorder(),
    //               focusedBorder: OutlineInputBorder(
    //                 borderSide: BorderSide(color: kPrimariColor),
    //               ),
    //               enabledBorder: OutlineInputBorder(
    //                 borderSide: BorderSide(color: kPrimariColor),
    //               ),
    //             ),
    //             onSaved: (String? value) {
    //               // This optional block of code can be used to run
    //               // code when the user saves the form.
    //             },
    //             validator: (String? value) {
    //               return (value != null && value.contains('@'))
    //                   ? 'Do not use the @ char.'
    //                   : null;
    //             },
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
