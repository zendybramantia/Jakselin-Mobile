import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jakselin/models/wisata.dart';

Future<List<WisataInfo>> getWisataCategory(String id) async {
  var response = await http
      .get(Uri.parse("http://jakselin.herokuapp.com/api/category/$id"));

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
  var response =
      await http.get(Uri.parse("http://jakselin.herokuapp.com/api/kuliner"));

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
  var response = await http.get(
      Uri.parse("http://jakselin.herokuapp.com/api/kuliner?search=$search"));

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
