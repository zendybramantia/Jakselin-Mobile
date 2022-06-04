import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 115,
      width: 115,
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/Profile-Icon.png'),
        radius: 70,
      ),
    );
  }
}
