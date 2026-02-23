import 'package:flutter/material.dart';

class AuthRoute<T> extends PageRouteBuilder<T> {
  AuthRoute({required WidgetBuilder builder})
      : super(
    pageBuilder: (context, _, __) => builder(context),
    transitionDuration: Duration.zero,
    reverseTransitionDuration: Duration.zero,
  );
}