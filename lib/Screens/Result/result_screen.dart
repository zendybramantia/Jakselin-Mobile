import 'package:flutter/material.dart';
import 'package:jakselin/APIKuliner/wisataAPI.dart';
import 'package:jakselin/Screens/WisataProfile/wisataProfile_screen.dart';
import 'package:jakselin/Widget/result_card.dart';
import 'package:jakselin/models/wisata.dart';

class WisataResult extends StatefulWidget {
  final String idCategory;
  const WisataResult({Key? key, required this.idCategory}) : super(key: key);

  @override
  State<WisataResult> createState() => _WisataResultState();
}

class _WisataResultState extends State<WisataResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jakselin")),
      body: Container(
        padding: EdgeInsets.all(50),
        child: FutureBuilder(
            future: getWisataCategory(widget.idCategory),
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
                    height: double.infinity,
                    child: ListView.builder(
                        itemCount: data.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                ResultCard(
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
            }),
      ),
    );
  }
}
