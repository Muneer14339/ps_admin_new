
class WifiDeviceModel {
  final String id;
  final String name;
  final String subtitle;
  final int signal;

  WifiDeviceModel({
    String? id,
    required this.name,
    required this.subtitle,
    this.signal = 2,
  }) : id = id ?? 'wifi_${name.hashCode}';
}
