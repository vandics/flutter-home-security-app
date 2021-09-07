import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:michael_app/controller/monitoringcontroller.dart';
part 'monitoring_state.dart';
part 'monitoring_event.dart';

class MonitroingBloc extends Bloc<MonitoringEvent, MonitoringState> {
  MonitroingBloc() : super(MonitoringState(monitoring: []));

  List monitoringData = [];

  @override
  Stream<MonitoringState> mapEventToState(MonitoringEvent event) async* {
    if (event is UpdateMonitoringEvent) {
      monitoringData.clear();
      final resp = await monitoringController.getDataMonitoring();
      print(resp!.msj);

      if (resp.resp == true) {
        String voltage = "${resp.information.voltage} volt";
        String current = "${resp.information.current} mA";
        String co = "${resp.information.co} ppm";
        String co2 = "${resp.information.co2} ppm";
        String flame = "${resp.information.flame}";
        //      resp.information.flame == '1' ? 'Ada asap' : 'Tidak ada asap';
        String switchh = resp.information.switchh == '1'
            ? 'Jendela tutup'
            : 'Jendela terbuka';
        String temp = "${resp.information.temp} \u2103";

        monitoringData = [co, co2, flame, temp, current, voltage, switchh];
      } else {
        monitoringData = [];
      }

      yield state.copyWith(monitoring: monitoringData);
    }
  }
}
