import 'package:flutter/material.dart';
import 'package:jakselin/Screens/Home/home_screen.dart';
import 'package:jakselin/Screens/Profile/profile.dart';
import 'package:jakselin/Screens/profiletest.dart';
import 'package:jakselin/models/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List pages = const [HomeScreen(), ProfileScreen()];

  int currentIndex = 0;
  void OnTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: whiteClr,
          onTap: OnTap,
          currentIndex: currentIndex,
          selectedItemColor: primaryClr,
          unselectedItemColor: Colors.grey.withOpacity(0.7),
          showUnselectedLabels: false,
          iconSize: 30,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
          ]),
    );
  }
}
