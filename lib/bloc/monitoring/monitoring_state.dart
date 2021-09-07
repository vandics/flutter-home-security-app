part of 'monitoring_bloc.dart';

class MonitoringState {
  List monitoring;

  MonitoringState(
      {this.monitoring = const ['0', '0', '0', '0', '0', '0', '0']});

  MonitoringState copyWith({required List monitoring}) =>
      MonitoringState(monitoring: monitoring);
}
