import 'package:flutter/material.dart';
import '../models/colors.dart';
import '../models/wisataKuliner.dart';

class RecommendationCard extends StatelessWidget {
  final WisataInfo wisataInfo;
  final VoidCallback press;

  const RecommendationCard({
    Key? key,
    required this.wisataInfo,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 5,
        child: Container(
          height: 300,
          width: 200,
          decoration: BoxDecoration(
              color: whiteClr, borderRadius: BorderRadius.circular(20)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(wisataInfo.gambar))),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
              child: Text(wisataInfo.nama,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w400)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(wisataInfo.alamat,
                  style: const TextStyle(color: greyClr)),
            )
          ]),
        ),
      ),
    );
  }
}
