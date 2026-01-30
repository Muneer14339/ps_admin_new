import 'package:flutter/material.dart';

AppBar appBarCustom(
    {required BuildContext ctx, String? title, bool? hideBack}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    leading: hideBack == true
        ? const SizedBox.shrink()
        : IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.pop(ctx);
            },
          ),
    title: Text(title ?? '', style: Theme.of(ctx).textTheme.headlineMedium),
    centerTitle: true,
  );
}
