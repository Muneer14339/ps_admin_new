import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/features/train/session/presentation/bloc/session_bloc/session_bloc.dart';
import 'package:pa_sreens/src/features/train/session/presentation/widgets/summary_table_item.dart';

import '../../../../training_new/presentation/widgets/components/loadout_list.dart';

const double fsHeading = 16.0;
const double fsSubheading = 14.0;
const double fsBody = 12.0;

class PerformanceSessionPage extends StatelessWidget {
   const PerformanceSessionPage({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SessionBloc, SessionState>(
      builder: (context, state) {
        if (state is ShootState) {
          final perfItems = <MapEntry<String,String>>[
            MapEntry('Number of Shots Scheduled', '${state.sessionModel.numberOfShots ?? ''}'),
            MapEntry('Total Shots Fired',        '${state.sessionModel.playedShoots ?? ''}'),
            MapEntry('Number of Missing Shots', '${state.sessionModel.listShots?.where((shot) => shot.shootScore == 0).length ?? 0?? ''}',),
            MapEntry('Total Score',              '${state.sessionModel.totalScores ?? ''}'),
            MapEntry('Highest Score',            '${state.sessionModel.highestScore ?? ''}'),
            MapEntry('Lowest Score',             '${state.sessionModel.lowestScore ?? ''}'),
            MapEntry('Average Score',            state.sessionModel.averageScore?.toStringAsFixed(2) ?? ''),
            MapEntry('Total Time',      '${state.sessionModel.totalTime?.toStringAsFixed(2)??""}”'),
            MapEntry('Quickest Split Time',     state.sessionModel.lowestSplitTimeString==null?"N/A" : '${double.parse((state.sessionModel.lowestSplitTimeString??"")).toStringAsFixed(2)}”'),
          ];
          // MapEntry('Session ID',           '${state.sessionModel.sessionId}'),

          final sessionItems = <MapEntry<String,String>>[
            MapEntry('Target Type',          'PulseAim Target'),

            // MapEntry('Firearm',             '${state.sessionModel.stageEntity?.firearm?.type}, ${state.sessionModel.stageEntity?.firearm?.brand}'),
            // MapEntry('Ammunition Type',      '${state.sessionModel.stageEntity?.firearm?.ammoType}'),
            // MapEntry('Weapon Type',          '${state.sessionModel.stageEntity?.firearm?.type}'),
            MapEntry('Firearm',             '${armoryFirearmA?.type??'None'}, ${armoryFirearmA?.brand??''}'),
            MapEntry('Ammunition Type',      armoryAmmunitionA?.brand ??'None'),
            MapEntry('Caliber',          armoryAmmunitionA?.caliber ??'None'),


            MapEntry('AimSync Mount Loc.',   '${state.sessionModel.stageEntity?.mountLocation}'),
            MapEntry('Training Mode',        'Practice'),
            MapEntry('Dominant Hand',        'Left'),
            MapEntry('Sensitivity',          '${state.sessionModel.stageEntity?.drill?.drill?.fireType}'),
            MapEntry('Venue',                '${state.sessionModel.stageEntity?.venue}'),
            MapEntry('Distance',             '${state.sessionModel.stageEntity?.distance}'),
            MapEntry('Lighting Condition',   '${state.sessionModel.stageEntity?.venue}'),
            MapEntry('Scoring Mode',         '${state.sessionModel.stageEntity?.mode?.name}'),
          ];
          return Padding(
            padding: EdgeInsets.all(16.r),
            child: Row(
              children: [
                Expanded(
                  child: _InfoCard(
                    icon: Icons.receipt,
                    title: 'Session Parameters',
                    items: sessionItems,
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: _InfoCard(
                    icon: Icons.bar_chart,
                    title: 'Performance Summary',
                    items: perfItems,
                  ),
                ),
                // Session Parameters Card

              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );

  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<MapEntry<String,String>> items;
   const _InfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGry,
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 15.h),
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.orange, size: fsHeading.sp),
              SizedBox(width: 8.w),
              Text(
                title,
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: fsHeading.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          ...items.map((e) => Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        e.key,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: fsSubheading.sp,
                        ),
                      ),
                    ),
                    Text(
                      e.value,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: fsBody.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Divider(color: AppColors.white.withOpacity(0.3), height: 1.h),
                SizedBox(height: 9.h),
              ],
            ),
          )),
        ],
      ),
    );
  }
}