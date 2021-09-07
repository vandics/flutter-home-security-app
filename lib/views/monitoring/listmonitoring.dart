class MenuItemMonitoring {
  final String icon, textsensor;

  MenuItemMonitoring({required this.icon, required this.textsensor});
}

List<MenuItemMonitoring> menu = [
  MenuItemMonitoring(icon: 'assets/images/CO.png', textsensor: 'Sensor CO'),
  MenuItemMonitoring(
      icon: 'assets/images/CO2.png', textsensor: 'Sensor CO\u00B2'),
  MenuItemMonitoring(icon: 'assets/images/fire.png', textsensor: 'Sensor Api'),
  MenuItemMonitoring(
      icon: 'assets/images/temp.png', textsensor: 'Sensor Temperatur'),
  MenuItemMonitoring(
      icon: 'assets/images/current.png', textsensor: 'Sensor Arus'),
  MenuItemMonitoring(
      icon: 'assets/images/volt.png', textsensor: 'Sensor Tegangan'),
  MenuItemMonitoring(icon: 'assets/images/move.png', textsensor: 'Sensor Gerak')
];
