import 'package:flutter/material.dart';
import '../../../Widget/category_card.dart';
import '../../../Widget/recommendation_card.dart';
import '../../../models/colors.dart';
import '../../../models/wisataKuliner.dart';
import '../../WisataProfile/wisataProfile_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteClr,
      body: SafeArea(
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
                  bottom: BorderSide(width: 0.3, color: whiteClr),
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

            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 13),
              child: Row(
                children: const [
                  Text(
                    "Selamat Datang !",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),

            //Search Bar
            const SizedBox(
              height: 30,
            ),
            Material(
              borderRadius: BorderRadius.circular(100),
              elevation: 5,
              child: Container(
                width: 370,
                decoration: BoxDecoration(
                    color: whiteClr, borderRadius: BorderRadius.circular(100)),
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
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 13),
              child: Row(
                children: const [
                  Text(
                    "Category",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 13),
              child: Container(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: [
                        CategoryCard(
                          press: () {},
                          title: "Cafe",
                        ),
                        CategoryCard(
                          press: () {},
                          title: "Cepat Saji",
                        ),
                        CategoryCard(
                          press: () {},
                          title: "Fine Dining",
                        ),
                        CategoryCard(
                          press: () {},
                          title: "Kaki Lima",
                        ),
                        CategoryCard(
                          press: () {},
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
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 13),
              child: Row(
                children: const [
                  Text(
                    "Reccomendation",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Container(
                height: 350,
                child: ListView.builder(
                    itemCount: wisatas.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            RecommendationCard(
                                wisataInfo: wisatas[index],
                                press: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              WisataProfileScreen(
                                                  wisataInfo: wisatas[index])));
                                }),
                          ],
                        ),
                      );
                    }))
          ],
        ),
      )),
    );
  }
}
