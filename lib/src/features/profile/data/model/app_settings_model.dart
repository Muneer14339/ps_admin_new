class AppSettingsModel {
  bool? isLightTheme;
  bool? pushNotifications;
  bool? backgroundUpdated;
  String? region;
  String? dateFormat;
  String? timeFormat;
  String? distance;
  String? bluetooth;
  String? wifi;

  AppSettingsModel(
      {this.isLightTheme,
      this.pushNotifications,
      this.backgroundUpdated,
      this.region,
      this.dateFormat,
      this.timeFormat,
      this.distance,
      this.bluetooth,
      this.wifi});
}
