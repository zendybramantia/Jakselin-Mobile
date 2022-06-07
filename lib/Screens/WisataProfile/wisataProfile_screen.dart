import 'package:flutter/material.dart';
import 'package:jakselin/models/wisata.dart';
import '../../../models/colors.dart';

class WisataProfileScreen extends StatefulWidget {
  final WisataInfo wisataInfo;

  const WisataProfileScreen({Key? key, required this.wisataInfo})
      : super(key: key);

  @override
  State<WisataProfileScreen> createState() => _WisataProfileScreenState();
}

class _WisataProfileScreenState extends State<WisataProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
      body: Stack(
        children: [
          Image.network(
            "http://127.0.0.1:8000/${widget.wisataInfo.gambar}",
            width: double.infinity,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.5,
          ),
          SafeArea(
              child: Column(
            children: [
              // Back Button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(100),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                                color: whiteClr, shape: BoxShape.circle),
                            child: const Icon(
                              Icons.arrow_back,
                              color: blackClr,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              Expanded(
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: whiteClr,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 10.0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.wisataInfo.nama_tempat,
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w600)),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0.0),
                              child: Row(
                                children: const [
                                  Icon(Icons.location_on,
                                      color: primaryClr, size: 27),
                                  Text("Alamat",
                                      style: TextStyle(
                                          color: blackClr,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.wisataInfo.alamat,
                                style: const TextStyle(
                                    color: greyClr, fontSize: 15),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0.0),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.flag_circle_sharp,
                                    color: primaryClr,
                                    size: 27,
                                  ),
                                  Text("Detail Tempat",
                                      style: TextStyle(
                                          color: blackClr,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.wisataInfo.deskripsi,
                                style: const TextStyle(
                                    color: greyClr, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
              )
            ],
          ))
        ],
      ),
    );
  }
}
