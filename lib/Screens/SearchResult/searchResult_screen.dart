import 'package:flutter/material.dart';
import 'package:jakselin/APIKuliner/wisataAPI.dart';
import 'package:jakselin/Screens/WisataProfile/wisataProfile_screen.dart';
import 'package:jakselin/Widget/result_card.dart';
import 'package:jakselin/models/wisata.dart';

class SearchResult extends StatefulWidget {
  final String search;
  const SearchResult({Key? key, required this.search}) : super(key: key);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Search Result",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: FutureBuilder(
            future: searchWisata(widget.search),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Error when fetching data"),
                );
              }
              if (snapshot.hasData) {
                List<WisataInfo> data = snapshot.data as List<WisataInfo>;

                if (data.isEmpty) {
                  return const Center(
                      child: Text("Wisata Kuliner Yang Kamu Cari Tidak Ada"));
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
