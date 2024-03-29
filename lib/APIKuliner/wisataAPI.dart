import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jakselin/constants.dart';
import 'package:jakselin/models/wisata.dart';

Future<List<WisataInfo>> getWisataCategory(String id) async {
  var response = await http.get(Uri.parse("$apiUrl/api/category/$id"));

  if (response.statusCode != 200) {
    throw "Gagal fetching data";
  }
  var data = jsonDecode(response.body);
  List body = data["wisatas"];
  List<WisataInfo> finalList = [];

  for (var wisatas in body) {
    finalList.add(WisataInfo(
        id: wisatas["id"],
        category_id: wisatas["category_id"],
        nama_tempat: wisatas["nama_tempat"],
        alamat: wisatas["alamat"],
        deskripsi: wisatas["deskripsi"],
        gambar: wisatas["gambar"]));
  }

  // print(final);
  return finalList;
}

Future<List<WisataInfo>> getWisataAll() async {
  var response = await http.get(Uri.parse("$apiUrl/api/kuliner"));

  if (response.statusCode != 200) {
    throw "Gagal fetching data";
  }
  var data = jsonDecode(response.body);
  List body = data["wisatas"];
  List<WisataInfo> finalList = [];

  for (var wisatas in body) {
    finalList.add(WisataInfo(
        id: wisatas["id"],
        category_id: wisatas["category_id"],
        nama_tempat: wisatas["nama_tempat"],
        alamat: wisatas["alamat"],
        deskripsi: wisatas["deskripsi"],
        gambar: wisatas["gambar"]));
  }

  // print(final);
  return finalList;
}

Future<List<WisataInfo>> searchWisata(String search) async {
  var response =
      await http.get(Uri.parse("$apiUrl/api/kuliner?search=$search"));

  if (response.statusCode != 200) {
    throw "Gagal fetching data";
  }
  var data = jsonDecode(response.body);
  List body = data["wisatas"];
  List<WisataInfo> finalList = [];

  for (var wisatas in body) {
    finalList.add(WisataInfo(
      id: wisatas["id"],
      category_id: wisatas["category_id"],
      nama_tempat: wisatas["nama_tempat"],
      alamat: wisatas["alamat"],
      deskripsi: wisatas["deskripsi"],
      gambar: wisatas["gambar"],
    ));
  }

  // print(final);
  return finalList;
}

Future getWisataComment(String catergory) async {
  var response = await http.get(Uri.parse("$apiUrl/api/wisata/$catergory"));
  if (response.statusCode != 200) {
    throw "Gagal Fetching Data Comment";
  }
  var data = jsonDecode(response.body);
  var comments = data["comments"];
  List<WisataComment> finalList = [];
  for (var comment in comments) {
    // print(comment["body"]);
    finalList.add(
        WisataComment(comment: comment["body"], user_id: comment["user_id"]));
  }
  return finalList;
  // print(comments[0]["body"]);
}
