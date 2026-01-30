import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/theme/font/app_fonts.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../../../armory/domain/entities/armory_ammunition.dart';
import '../../../../armory/domain/entities/armory_firearm.dart';
import '../../../../armory/domain/entities/armory_loadout.dart';
import '../../../../armory/presentation/widgets/common/tappable_item_wrapper.dart';
import '../../../data/models/session_model.dart';
import '../../bloc/training_bloc.dart';
import '../../bloc/training_event.dart';
import '../components/loadout_list.dart';

class LoadoutItemCardTraining extends StatelessWidget {
  final ArmoryLoadout loadout;
  final ArmoryFirearm? firearm;
  final ArmoryAmmunition? ammunition;
  final String userId;
  final bool isSelected;

  const LoadoutItemCardTraining({
    super.key,
    required this.loadout,
    this.firearm,
    this.ammunition,
    required this.userId, required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final dateStr = '${loadout.dateAdded.day}/${loadout.dateAdded.month}/${loadout.dateAdded.year}';

    return CommonItemCardTraining(
      item: loadout,
      isSelected:isSelected,
      title: loadout.name,
      firearm: firearm,
      ammunition: ammunition,
      details: [
        if (firearm != null)
          CardDetailRowTraining(
            icon: 'assets/icons/armory_icons/firearm.png',
            text: '${firearm!.make} ${firearm!.model}',
          ),
        if (ammunition != null)
          CardDetailRowTraining(
            icon: 'assets/icons/armory_icons/ammo.png',
            text: '${ammunition!.caliber} ${ammunition!.bullet}',
            badge: '${ammunition!.quantity} rds',
            date: dateStr,
          ),
      ],
    );
  }
}





class CommonItemCardTraining extends StatelessWidget {
  final dynamic item;
  final String title;
  final String? subtitle;
  final List<CardDetailRowTraining> details;
  final VoidCallback? onTap;
  final ArmoryFirearm? firearm;
  final ArmoryAmmunition? ammunition;
  final bool isSelected;

  const CommonItemCardTraining({
    super.key,
    required this.item,
    required this.title,
    this.subtitle,
    required this.details,
    this.onTap,
    this.firearm,
    this.ammunition, required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TappableItemWrapper(
      item: item,
      onTap: onTap,
      firearm: firearm,
      ammunition: ammunition,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10,top: 10,right: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected
              ? AppTheme.primary(context).withOpacity(0.2)
              : AppTheme.background(context),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected
                ? AppTheme.primary(context)
                : AppTheme.primary(context).withOpacity(0.2),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTheme.titleMedium(context).copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (subtitle != null) const SizedBox(height: 6),
                  ...details,
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                    loadoutArm = item;
                    armoryFirearmA = firearm;
                    armoryAmmunitionA = ammunition;
                    _selectLoadout(
                        context,
                        LoadoutModel(
                            name: item.name, details: item.notes ?? 'detail'));
              },
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                minimumSize: Size.zero,
                // fixedSize: Size(50.w, 36.h),
                backgroundColor: AppTheme.primary(context),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              child: Text(
                'Select',
                style: TextStyle(
                    color: AppTheme.textPrimary(context),
                    fontSize: 12.sp,
                    fontFamily: AppFontFamily.bold),
              ),
            ),

          ],
        ),
      ),
    );
  }
  void _selectLoadout(BuildContext context, LoadoutModel loadout , ) {
    // Dispatch event to BLoC
    context.read<TrainingBloc>().add(SelectLoadoutEvent(loadout));

    // Optional: Navigate back or show success message
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // You can navigate back or show a success message
      Navigator.of(context).pop();
    });
  }

}

// Rest remains same...
class CardDetailRowTraining extends StatelessWidget {
  final String icon;
  final String text;
  final String? badge;
  final String? date;

  const CardDetailRowTraining({
    super.key,
    required this.icon,
    required this.text,
    this.badge,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        children: [
          Image.asset(
            icon,
            color: AppTheme.primary(context),
            width: 28,
            height: 28,
          ),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              text,
              style: AppTheme.labelMedium(context).copyWith(fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (badge != null) ...[
            const SizedBox(width: 4),
            Text('•', style: AppTheme.labelMedium(context).copyWith(fontSize: 12, color: AppTheme.textSecondary(context).withOpacity(0.5))),
            const SizedBox(width: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: AppTheme.primary(context).withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                badge!,
                style: AppTheme.labelSmall(context).copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.primary(context),
                ),
              ),
            ),
          ],
          if (date != null) ...[
            const SizedBox(width: 4),
            Text('•', style: AppTheme.labelMedium(context).copyWith(fontSize: 12, color: AppTheme.textSecondary(context).withOpacity(0.5))),
            const SizedBox(width: 4),
            Text(
              date!,
              style: AppTheme.labelMedium(context).copyWith(fontSize: 11, color: AppTheme.textSecondary(context)),
            ),
          ],
        ],
      ),
    );
  }
}