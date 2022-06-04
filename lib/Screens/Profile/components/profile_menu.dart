import 'package:flutter/material.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.menu,
    required this.value,
    required this.icon,
  }) : super(key: key);

  final String menu, value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffF4F4FA),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  color: Color(0xffF0585B),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Text(
                  menu,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )),
                Text(menu),
              ],
            ),
          )),
    );
  }
}
