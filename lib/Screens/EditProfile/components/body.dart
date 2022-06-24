import "package:flutter/material.dart";
import 'package:jakselin/Screens/EditProfile/components/text_form_input.dart';
import 'package:jakselin/api/userapi.dart';
import 'package:jakselin/constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.id}) : super(key: key);
  final String id;
  @override
  Widget build(BuildContext context) {
    // String id = "3";
    TextEditingController nama = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController nohp = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 16,
          ),
          Text(id),
          TextFormInput(
              label: "Username", isPassword: false, control: username),
          TextFormInput(label: "Name", isPassword: false, control: nama),
          TextFormInput(label: "Email", isPassword: false, control: email),
          TextFormInput(label: "Phone", isPassword: false, control: nohp),
          TextFormInput(label: "Password", isPassword: true, control: password),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              primary: kPrimariColor,
            ),
            onPressed: () {
              updateUser(id, nama.text, email.text, username.text,
                  password.text, nohp.text, context);
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
