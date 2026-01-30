import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet }

class DeviceConfig {
  static DeviceType getDeviceType(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide < 600 ? DeviceType.mobile : DeviceType.tablet;
  }

  static bool isMobile(BuildContext context) => getDeviceType(context) == DeviceType.mobile;
  static bool isTablet(BuildContext context) => getDeviceType(context) == DeviceType.tablet;
}