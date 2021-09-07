import 'dart:convert';

MonitoringModel monitoringModelFromJson(String str) =>
    MonitoringModel.fromJson(json.decode(str));

class MonitoringModel {
  bool resp;
  String msj;
  Information information;

  MonitoringModel(
      {required this.resp, required this.msj, required this.information});

  factory MonitoringModel.fromJson(Map<String, dynamic> json) =>
      MonitoringModel(
        resp: json["resp"],
        msj: json["msj"],
        information: Information.fromJson(json["information"]),
      );
}

class Information {
  String voltage, current, co, co2, temp, flame, switchh;

  Information(
      {required this.voltage,
      required this.current,
      required this.co,
      required this.co2,
      required this.temp,
      required this.flame,
      required this.switchh});

  factory Information.fromJson(Map<String, dynamic> json) => Information(
      switchh: json["switch"],
      co2: json["CO2"],
      co: json["CO"],
      current: json["Current"],
      flame: json["flame"],
      temp: json["temp"],
      voltage: json["Voltage"]);
}
