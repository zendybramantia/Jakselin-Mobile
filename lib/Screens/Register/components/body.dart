import 'package:flutter/material.dart';
import 'package:jakselin/Screens/Login/components/textfield_component.dart';
import 'package:jakselin/Screens/Login/login_screen.dart';
import 'package:jakselin/Screens/Register/components/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

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
            TextFieldComponent(size: size, title: 'Nama'),
            const SizedBox(
              height: 10,
            ),
            TextFieldComponent(size: size, title: 'Email'),
            const SizedBox(
              height: 10,
            ),
            TextFieldComponent(size: size, title: 'No. Hp'),
            const SizedBox(
              height: 10,
            ),
            TextFieldComponent(size: size, title: 'Username'),
            const SizedBox(
              height: 10,
            ),
            TextFieldComponent(size: size, title: 'Password'),
            const SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: FlatButton(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                color: const Color(0xffF0585B),
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
                child: const Text(
                  "Daftar",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
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
                    'Masuk disini',
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
