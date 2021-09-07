import 'dart:convert';

GaleriModel galeriModelfromJson(String str) =>
    GaleriModel.fromJson(json.decode(str));

class GaleriModel {
  bool resp;
  String msj;
  List information;

  GaleriModel(
      {required this.resp, required this.msj, required this.information});

  factory GaleriModel.fromJson(Map<String, dynamic> json) => GaleriModel(
        msj: json["msj"],
        resp: json["resp"],
        information: (json["information"]),
      );
}

class InformationGaleri {
  String url;

  InformationGaleri({required this.url});

  factory InformationGaleri.fromJson(Map<String, dynamic> json) =>
      InformationGaleri(url: json["foto"]);
}
