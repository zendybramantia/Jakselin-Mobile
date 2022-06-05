import 'package:flutter/material.dart';
import 'package:jakselin/Widget/textfield_component.dart';
import 'package:jakselin/Screens/Login/login_screen.dart';
import 'package:jakselin/Screens/Register/components/background.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      size: size,
      child: Padding(
        padding: EdgeInsets.only(bottom: size.height * 0.12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'DAFTAR',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFieldComponent(size: size, title: 'Nama', isPassword: false),
            const SizedBox(
              height: 10,
            ),
            TextFieldComponent(size: size, title: 'Email', isPassword: false),
            const SizedBox(
              height: 10,
            ),
            TextFieldComponent(size: size, title: 'No. Hp', isPassword: false),
            const SizedBox(
              height: 10,
            ),
            TextFieldComponent(size: size, title: 'Username', isPassword: false),
            const SizedBox(
              height: 10,
            ),
            TextFieldComponent(size: size, title: 'Password', isPassword: false),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                primary: const Color(0xffF0585B),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: const Text('Daftar',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'sudah punya akun?',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  width: 5,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const LoginScreen();
                        },
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(20, 20),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    alignment: Alignment.centerLeft,
                  ),
                  child: const Text(
                    'masuk disini',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
