import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/utils/utils.dart';
import 'package:pa_sreens/src/core/widgets/smart_drop_down.dart';
import 'package:pa_sreens/src/features/profile/presentation/widgets/app_settings_tile.dart';

class SettingsDropdown extends StatefulWidget {
  final List<Widget> items;
  final String title;
  final String text;
  final String leadingIcon;
  final Widget? stageWidget;
  final String? selectedValue;
  final OverlayPortalController overlayController;

  const SettingsDropdown(
      {super.key,
      required this.items,
      this.stageWidget,
      this.selectedValue,
      required this.text,
      required this.title,
      required this.overlayController,
      required this.leadingIcon});

  @override
  State<SettingsDropdown> createState() => _SettingsDropdownState();
}

class _SettingsDropdownState extends State<SettingsDropdown> {
  String? text;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SmartDropdown(
      itemLength: widget.items.length,
      isStage: false,
      isProf: true,
      controller: widget.overlayController,
      buttonBuilder: (context, onTap, isOpen) {
        return AppSettingsTile(
          title: widget.title,
          text: widget.text,
          leadingIcon: widget.leadingIcon,
          onTap: onTap,
          trailing:
              const Icon(Icons.arrow_forward_ios_rounded, size: arrowIconSize),
        );
      },
      menuBuilder: (context, toggleDropDown, width) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.w),
          child: MenuWidget(
            width: width,
            items: widget.items,
            selectedItem: widget
                .selectedValue, // this needs to update too with the button
          ),
        );
      },
    );
  }
}

class MenuWidget extends StatefulWidget {
  const MenuWidget({
    super.key,
    this.width,
    required this.items,
    required this.selectedItem,
    this.hint,
    this.showSearch = false,
  });

  final double? width;
  final List<Widget> items;

  final String? selectedItem;
  final String? hint;
  final bool showSearch;

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: EdgeInsets.fromLTRB(6.w, 6.h, 6.w, 0),
      decoration: ShapeDecoration(
        color: Theme.of(context).cardColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(6), bottomRight: Radius.circular(6)),
        ),
        shadows: const [
          // BoxShadow(
          //   color: Color.fromARGB(33, 0, 0, 0),
          //   blurRadius: 5,
          //   offset: Offset(0, 5),
          //   spreadRadius: 5,
          // ),
        ],
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 200.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Scrollbar(
                child: ListView(
                  shrinkWrap: true,
                  children: widget.items,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
