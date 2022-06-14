import 'package:flutter/material.dart';
import 'package:jakselin/APIKuliner/wisataAPI.dart';
import 'package:jakselin/Screens/Result/result_screen.dart';
import 'package:jakselin/models/wisata.dart';
import '../../../Widget/category_card.dart';
import '../../../Widget/recommendation_card.dart';
import '../../../models/colors.dart';

import '../../WisataProfile/wisataProfile_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Future wisataList = getWisataAll();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteClr,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          child: Column(
            children: [
              //App bar
              Container(
                padding: const EdgeInsets.all(13),
                height: 65,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.3, color: blackClr),
                  ),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/images/WisataKuliner/jakselin_logo.png",
                      height: 95,
                      width: 95,
                    ),
                    const Icon(
                      Icons.settings_outlined,
                      size: 25.0,
                      color: Color.fromARGB(255, 92, 92, 92),
                    )
                  ],
                ),
              ),

              //Search Bar
              const SizedBox(
                height: 5,
              ),
              Material(
                borderRadius: BorderRadius.circular(100),
                elevation: 5,
                child: Container(
                  width: 370,
                  decoration: BoxDecoration(
                      color: whiteClr,
                      borderRadius: BorderRadius.circular(100)),
                  child: TextFormField(
                      decoration: const InputDecoration(
                    hintText: "Cari tempat wisata kuliner...",
                    prefixIcon: Icon(Icons.search),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  )),
                ),
              ),

              //Category
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 13),
                child: Row(
                  children: const [
                    Text(
                      "Category",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 13),
                child: Container(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Row(
                        children: [
                          CategoryCard(
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WisataResult(
                                            idCategory: "1",
                                          )));
                            },
                            title: "Cepat Saji",
                          ),
                          CategoryCard(
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WisataResult(
                                            idCategory: "2",
                                          )));
                            },
                            title: "Cafe",
                          ),
                          CategoryCard(
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WisataResult(
                                            idCategory: "3",
                                          )));
                            },
                            title: "Fine Dining",
                          ),
                          CategoryCard(
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WisataResult(
                                            idCategory: "4",
                                          )));
                            },
                            title: "Kaki Lima",
                          ),
                          CategoryCard(
                            press: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WisataResult(
                                            idCategory: "5",
                                          )));
                            },
                            title: "Bakery",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              //Reccomendation
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 13),
                child: Row(
                  children: const [
                    Text(
                      "Reccomendation",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              FutureBuilder(
                  future: wisataList,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("Error when fetching data"),
                      );
                    }
                    if (snapshot.hasData) {
                      List<WisataInfo> data = snapshot.data as List<WisataInfo>;
                      if (data.isEmpty) {
                        return const Center(child: Text("Data is empty"));
                      }
                      return Container(
                          height: 350,
                          child: ListView.builder(
                              itemCount: data.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      RecommendationCard(
                                          wisataInfo: data[index],
                                          press: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        WisataProfileScreen(
                                                            wisataInfo:
                                                                data[index])));
                                          }),
                                    ],
                                  ),
                                );
                              }));
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  })
            ],
          ),
        )),
      ),
    );
    ;
  }
}
