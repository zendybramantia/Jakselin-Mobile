import 'package:flutter/material.dart';
import '../models/colors.dart';

class SearchButton extends StatelessWidget {
  final VoidCallback press;
  const SearchButton({
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: press,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: primaryClr,
            child: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}



// class SearchButton extends StatelessWidget {
//   final VoidCallback press;
//   const SearchButton({Key? key, required this.press}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Padding(
//       padding: const EdgeInsets.only(right: 10),
//       child: InkWell(
//         onTap: press,
//         child: Padding(
//           padding: EdgeInsets.all(8.0),
//           child: CircleAvatar(
//             backgroundColor: primaryClr,
//             child: Icon(Icons.search),
//           ),
//         ),
//       ),
//     );
//   }
// }
