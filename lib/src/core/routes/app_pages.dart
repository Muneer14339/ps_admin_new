import 'package:flutter/material.dart';
import '../../features/train/session/presentation/view/session_start_view_updated.dart';
import '../../features/train/stage/features/aimsync/presentation/view/aimsync.dart';
import '../../features/training_new/presentation/widgets/components/ble_list.dart';
import '../../features/training_new/presentation/widgets/components/choose_wifi_ble.dart';
import '../../features/training_new/presentation/widgets/components/drill_list.dart';
import '../../features/training_new/presentation/widgets/components/loadout_list.dart';
import '../../features/training_new/presentation/widgets/components/user_alerts.dart';
import '../../features/training_new/presentation/widgets/components/wifi_list.dart';
import '../../features/training_new/presentation/widgets/pages/active_view.dart';
import '../../features/training_new/presentation/widgets/pages/pre_view.dart';
import '../../features/training_new/presentation/widgets/pages/setup_view.dart';
import '../../features/training_new/presentation/widgets/view/training_layout_view.dart';
import 'app_routes.dart';

class AppPages {
  static Map<String, WidgetBuilder> routes = {
    AppRoutes.trainingLayout: (_) => const TrainingLayoutView(),
    AppRoutes.setupView: (_) => const SessionSetupView(),
    AppRoutes.activeView: (_) => const SessionActiveView(),
    AppRoutes.previewView: (_) => const SessionPreviewView(),
    AppRoutes.chooseWifiBle: (_) => const ChooseWifiBle(),
    AppRoutes.wifiList: (_) => const WifiList(),
    AppRoutes.bleList: (_) => const BleList(),
    AppRoutes.loadoutList: (_) => const LoadoutList(),
    AppRoutes.drillList: (_) => const DrillList(),
    AppRoutes.userAlert: (_) => const UserAlert(),
  };


  /// A helper to remove transitions (instant navigation)
  static PageRouteBuilder _noTransitionRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
      pageBuilder: (_, __, ___) => page,
    );
  }

  /// The route generator function for MaterialApp
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    print("ROute Name :*************************");
    print(settings.name);
    switch (settings.name) {
      case AppRoutes.trainingLayout:
        return _noTransitionRoute(const TrainingLayoutView(), settings);

      case AppRoutes.setupView:
        return _noTransitionRoute(const SessionSetupView(), settings);

      case AppRoutes.activeView:
        return _noTransitionRoute(const SessionActiveView(), settings);

      case AppRoutes.previewView:
        return _noTransitionRoute(const SessionPreviewView(), settings);

      case AppRoutes.chooseWifiBle:
        return _noTransitionRoute(const ChooseWifiBle(), settings);

      case AppRoutes.wifiList:
        return _noTransitionRoute(const WifiList(), settings);

      case AppRoutes.bleList:
        return _noTransitionRoute(const BleList(), settings);

      case AppRoutes.loadoutList:
        return _noTransitionRoute(const LoadoutList(), settings);

      case AppRoutes.drillList:
        return _noTransitionRoute(const DrillList(), settings);

      case AppRoutes.userAlert:
        return _noTransitionRoute(const UserAlert(), settings);

      default:
        print("ROute Name :*************************");
        print(settings.name);
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 - Page Not Found')),
          ),
        );
    }
  }
}


