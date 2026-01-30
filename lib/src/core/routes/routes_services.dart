import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton // <= IMPORTANT: ensure a single instance across the app
class RoutesService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState _navOrThrow() {
    final nav = navigatorKey.currentState;
    if (nav == null) {
      throw StateError(
          'NavigatorState is null. Did you attach RoutesService.navigatorKey to MaterialApp '
              'and call navigate after runApp()?'
      );
    }
    return nav;
  }

  Future<T?> navigateTo<T extends Object?>(
      String routeName, {
        Object? arguments,
      }) async {
    assert(routeName.isNotEmpty, 'routeName must not be empty');
    // If called too early, wait one frame to let MaterialApp mount.
    if (navigatorKey.currentState == null) {
      await WidgetsBinding.instance.endOfFrame;
    }
    return _navOrThrow().pushNamed<T>(routeName, arguments: arguments);
  }

  bool canPop() => navigatorKey.currentState?.canPop() ?? false;

  void goBack<T extends Object?>([T? result]) {
    final nav = navigatorKey.currentState;
    if (nav?.canPop() ?? false) {
      nav!.pop<T>(result);
    }
  }
}
