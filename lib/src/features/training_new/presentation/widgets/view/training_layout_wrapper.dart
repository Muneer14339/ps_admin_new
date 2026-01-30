import 'package:flutter/material.dart';
import '../../../../../core/app config/device_config.dart';
import 'training_layout_view.dart';
import 'training_layout_view_mobile.dart';

class TrainingLayoutWrapper extends StatelessWidget {
  const TrainingLayoutWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return DeviceConfig.isMobile(context)
        ? const TrainingLayoutViewMobile()
        : const TrainingLayoutView();
  }
}