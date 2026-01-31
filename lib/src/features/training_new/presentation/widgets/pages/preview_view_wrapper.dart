import 'package:flutter/material.dart';
import '../../../../../core/app config/device_config.dart';
import '../pages/pre_view.dart';
import 'preview_view_mobile.dart';

class SessionPreviewViewWrapper extends StatelessWidget {
  const SessionPreviewViewWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return DeviceConfig.isMobile(context)
        ? const SessionPreviewViewMobile()
        : const SessionPreviewView();
  }
}