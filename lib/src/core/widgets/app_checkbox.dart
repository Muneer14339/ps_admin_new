import 'package:flutter/material.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';

class AppCheckBox extends StatefulWidget {
  const AppCheckBox({
    this.scale,
    required this.valuee,
    required this.onChanged,
    this.horizontalVisualDensity,
    this.isCheckBox,
    super.key,
  });

  final bool valuee;
  final void Function(bool) onChanged;
  final double? scale;
  final double? horizontalVisualDensity;
  final bool? isCheckBox;

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  ValueNotifier<bool> valueListenable = ValueNotifier<bool>(false);
  @override
  void initState() {
    valueListenable = ValueNotifier<bool>(widget.valuee);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant AppCheckBox oldWidget) {
    // TODO: implement didUpdateWidget
    valueListenable = ValueNotifier<bool>(widget.valuee);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: valueListenable,
        builder: (context, value, child) {
          return Transform.scale(
              scale: widget.scale ?? 1.4,
              child: widget.isCheckBox == true
                  ? Checkbox(
                      value: value,
                      fillColor: WidgetStateColor.resolveWith(
                        (states) {
                          if (states.contains(WidgetState.selected)) {
                            return AppColors.kPrimaryColor;
                          }
                          return AppColors.white.withOpacity(0.8);
                        },
                      ),
                      visualDensity: VisualDensity(
                        vertical: -4,
                        horizontal: widget.horizontalVisualDensity ?? 0,
                      ),
                      checkColor: Colors.white,
                      side: BorderSide(
                          color: WidgetStateColor.resolveWith(
                            (states) {
                              if (states.contains(WidgetState.selected)) {
                                return Theme.of(context).primaryColor;
                              }
                              return Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.3);
                            },
                          ),
                          width: 0.5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      onChanged: (value) {
                        valueListenable.value = value ?? false;
                        widget.onChanged(value ?? false);
                      },
                    )
                  : Checkbox(
                      value: value,
                      fillColor: WidgetStateColor.resolveWith(
                        (states) {
                          if (states.contains(WidgetState.selected)) {
                            return Theme.of(context).primaryColor;
                          }
                          return AppColors.white;
                        },
                      ),
                      visualDensity: VisualDensity(
                        vertical: -4,
                        horizontal: widget.horizontalVisualDensity ?? 0,
                      ),
                      side: const BorderSide(color: Colors.black, width: 0.5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onChanged: (value) {
                        widget.onChanged(value ?? false);
                      },
                    ));
        });
  }
}
