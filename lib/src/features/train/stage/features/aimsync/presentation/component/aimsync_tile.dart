import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/widgets/modified_container.dart';

import '../../../../../../../core/theme/theme_data/theme_data.dart';

class AimsyncTile extends StatefulWidget {
  const AimsyncTile(
      {required this.text,
      required this.callBack,
      required this.initialValue,
      super.key, required this.limit});
  final String text;
  final int limit;
  final int initialValue;
  final void Function(int) callBack;

  @override
  State<AimsyncTile> createState() => _AimsyncTileState();
}

class _AimsyncTileState extends State<AimsyncTile> {
  late int value;
  @override
  Widget build(BuildContext context) {
    return ModifiedContainer(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      color: AppTheme.primary(context).withOpacity(0.2),
      borderRadius: 12,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.text,
              style: TextStyle(
                  color: AppTheme.textPrimary(context),
                  fontFamily: AppFontFamily.bold,
                  fontSize: 16.sp)),
          const Spacer(),
          GestureDetector(
            onTap: () {
              if (value > 1) {
                value = value - 1;
                widget.callBack(value);
                setState(() {});
              }
            },
            child: CircleAvatar(
                radius: 18,
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(
                  Icons.remove,
                  color: AppColors.white,
                )),
          ),
          ModifiedContainer(
            borderColor: Theme.of(context).primaryColor,
            borderRadius: 100,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            width: 40,
            height: 40,
            child: Center(
                child: Text('$value',
                    style: TextStyle(
                        color: AppTheme.textPrimary(context),
                        fontFamily: AppFontFamily.bold,
                        fontSize: 16.sp))),
          ),
          GestureDetector(
            onTap: () {
              if (value <= widget.limit) {
                value = value + 1;
                widget.callBack(value);
                setState(() {});
              }
            },
            child: CircleAvatar(
                radius: 18,
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(Icons.add, color: AppColors.white)),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    value = widget.initialValue;
    super.initState();
  }
}
