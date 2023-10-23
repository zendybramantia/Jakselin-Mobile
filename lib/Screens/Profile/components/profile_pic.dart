import 'package:flutter/material.dart';
import 'package:jakselin/constants.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
    required this.avatar,
  }) : super(key: key);

  final String avatar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: CircleAvatar(
        backgroundImage: NetworkImage("$apiUrl/${avatar}"),
        radius: 70,
      ),
    );
  }
}
