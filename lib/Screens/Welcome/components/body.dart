import 'package:flutter/material.dart';
import 'package:jakselin/Screens/Login/login_screen.dart';
import 'package:jakselin/Screens/Welcome/components/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: FlatButton(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            color: const Color(0xffF39A97),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const LoginScreen();
              }));
            },
            child: const Text("Lanjut", style: TextStyle(fontSize: 20)),
          ),
        )
      ]),
    );
  }
}
