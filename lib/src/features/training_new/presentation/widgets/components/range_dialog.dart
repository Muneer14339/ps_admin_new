import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../bloc/training_bloc.dart';
import '../../bloc/training_event.dart';

class RangeDialog extends StatelessWidget {
  final String? initiallySelected;

  const RangeDialog({super.key, this.initiallySelected});

  @override
  Widget build(BuildContext context) {
    final ranges = <String>[
      'Oak Ridge Range',
      'Precision Shooting Center',
      'Metro Gun Club',
      'Blue Mountain Range',
    ];

    return AlertDialog(
      title:  Text('Select Range',              style: TextStyle(fontSize: 16.sp , color:  AppTheme.primary(context))),
      backgroundColor: AppTheme.background(context),
      content: SizedBox(
        width: double.maxFinite,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: ranges.length,
          itemBuilder: (ctx, i) {
            final r = ranges[i];
            final selected = r == initiallySelected;
            return ListTile(
              leading:  Icon(Icons.map_outlined,color: AppTheme.textPrimary(context),),
              title: Text(r,
                  style: TextStyle(
                      fontSize: 12.sp, color: AppTheme.textPrimary(context))),
              trailing: selected ?  Icon(Icons.check,color: AppTheme.textPrimary(context),) : null,
              onTap: () {
                // Use rootNavigator to guarantee we pop the dialog route,
                // even if there are nested Navigators.
                context.read<TrainingBloc>().add(SelectRangeEvent(r));

                Navigator.of(context, rootNavigator: true).pop(r);
              },
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context, rootNavigator: true).pop(null),
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
