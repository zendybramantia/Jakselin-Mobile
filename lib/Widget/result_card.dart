import 'package:flutter/material.dart';
import 'package:jakselin/models/colors.dart';
import 'package:jakselin/models/wisata.dart';

class ResultCard extends StatelessWidget {
  final WisataInfo wisataInfo;
  final VoidCallback press;

  const ResultCard({Key? key, required this.wisataInfo, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: press,
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 5,
        child: Center(
          child: Container(
            height: size.height * 0.43,
            width: 300,
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
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            "http://127.0.0.1:8000/${wisataInfo.gambar}"))),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                child: Text(wisataInfo.nama_tempat,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(wisataInfo.alamat,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: const TextStyle(color: greyClr)),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
