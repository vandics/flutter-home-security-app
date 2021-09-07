import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:michael_app/models/galerimodel.dart';

class GaleriController {
  var server = 'https://projectkitaid.com/data_gambar.php';
  GaleriModel? data;

  Future<GaleriModel?> getDataPhoto() async {
    try {
      final resp = await http.get(
        Uri.parse('$server'),
        headers: {
          "content-type": "application/x-www-form-urlencoded",
        },
      );
      data = GaleriModel.fromJson(jsonDecode(resp.body));
    } catch (e) {
      data = GaleriModel(
        resp: false,
        msj: 'tidak dapat data foto',
        information: [],
      );
    }

    return data;
  }
}

final galeriController = GaleriController();
