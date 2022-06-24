import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
    required this.iconLink,
  }) : super(key: key);

  final String iconLink;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: CircleAvatar(
        backgroundImage: AssetImage(iconLink),
        radius: 70,
      ),
    );
  }
}
