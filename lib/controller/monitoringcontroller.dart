import 'dart:convert';
import 'package:michael_app/models/monitoringmodel.dart';
import 'package:http/http.dart' as http;

class MonitoringController {
  var server = 'https://projectkitaid.com/data.php';
  MonitoringModel? data;

  Future<MonitoringModel?> getDataMonitoring() async {
    try {
      final resp = await http.get(
        Uri.parse('$server'),
        headers: {
          "content-type": "application/x-www-form-urlencoded",
        },
      );

      data = MonitoringModel.fromJson(jsonDecode(resp.body));
    } catch (e) {
      data = MonitoringModel(
        resp: false,
        msj: 'Tidak ada',
        information: Information(
          voltage: '0',
          current: '0',
          co: '0',
          co2: '0',
          temp: '0',
          flame: '0',
          switchh: '0',
        ),
      );
    }

    return data;
  }
}

final monitoringController = MonitoringController();
