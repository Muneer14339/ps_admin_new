import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/utils/utils.dart';
import 'package:pa_sreens/src/features/train/session/presentation/bloc/session_bloc/session_bloc.dart';
import 'package:pa_sreens/src/features/train/session/presentation/component/shot_q_review.dart';
import '../../../../training_new/presentation/widgets/components/loadout_list.dart';
import '../../data/model/session_model.dart';

const double fsHeading = 16.0;
const double fsSubheading = 14.0;
const double fsBody = 12.0;


class PerShotAnalysisTab extends StatelessWidget {
  const PerShotAnalysisTab({super.key});


  String getBadgeEmoji(int score, List<ShootModel>? listShots) {
    // 1. If this particular score is zero, bail out immediately.
    if (score == 0) {
      return '';
    }

    // 2. Build a list of all scores (including zeros) so we can compute ranks,
    //    but zero‐scores will never match this early return.
    final scores = listShots
        ?.map((shot) => {
      'score': shot.shootScore ?? 0,
      'index': listShots.indexOf(shot),
    })
        .toList() ??
        [];

    if (scores.isEmpty) {
      return '';
    }

    // 3. Sort descending by score.
    scores.sort((a, b) => (b['score'] as int).compareTo(a['score'] as int));

    // 4. Assign ranks, giving tied scores the same rank.
    int rank = -1;
    int currentRank = 0;
    for (var i = 0; i < scores.length; i++) {
      final currScore = scores[i]['score'] as int;
      if (i > 0 && currScore != (scores[i - 1]['score'] as int)) {
        currentRank++;
      }
      if (currScore == score) {
        rank = currentRank;
        break;
      }
    }

    // 5. Only the top 3 positive scores get medals.
    switch (rank) {
      case 0:
        return ' 🥇';
      case 1:
        return ' 🥈';
      case 2:
        return ' 🥉';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionBloc, SessionState>(
      builder: (context, state) {
        if (state is ShootState) {
          print("ooooooooooo");
          print(state.sessionModel.listShots?.length);
          List<ShootModel> filtered = state.sessionModel.listShots == null
              ? []
              : state.sessionModel.listShots!
                  .where((s) => !(state.sessionModel.listShots!
                              .where((x) => x.shootNumber == s.shootNumber)
                              .length >
                          1 &&
                      (s.splitTime?.isEmpty ?? true)))
                  .toList();
          return Padding(
            padding: EdgeInsets.all(16.r),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 2.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "🎯 Shooting Performance Analysis",
                                style: TextStyle(
                                  fontSize: fsHeading.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.orange,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 6.h),

                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12.r), // rounded corners
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: DataTable(
                              dividerThickness: 0.5,
                              headingRowColor: WidgetStateProperty.resolveWith<Color?>(
                                (states) => AppColors
                                    .lightGry, // background for all data rows
                              ),
                              dataRowColor: WidgetStateProperty.resolveWith<Color?>(
                                (states) => AppColors
                                    .lightGry, // background for all data rows
                              ),
                              dataTextStyle: TextStyle(
                                // default text style for all cells
                                fontFamily: AppFontFamily.regular,
                                color: AppColors.white,
                                fontSize: 14.h,
                              ),
                              columns: [
                                DataColumn(
                                  label: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(5.w, 6.h, 0, 6.h),
                                    child: Text(
                                      'Shot #',
                                      style: TextStyle(
                                        fontFamily: AppFontFamily.bold,
                                        color: AppColors.orange,
                                        fontSize: fsBody.sp,
                                      ),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 6.h),
                                    child: Center(
                                      child: Text(
                                        'Score',
                                        style: TextStyle(
                                          fontFamily: AppFontFamily.bold,
                                          color: AppColors.orange,
                                          fontSize: fsBody.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  numeric: true,
                                  label: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(0, 6.h, 5.w, 6.h),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'Split Time',
                                        style: TextStyle(
                                          fontFamily: AppFontFamily.bold,
                                          color: AppColors.orange,
                                          fontSize: fsBody.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  numeric: true,
                                  label: Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(0, 6.h, 5.w, 6.h),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'Direction',
                                        style: TextStyle(
                                          fontFamily: AppFontFamily.bold,
                                          color: AppColors.orange,
                                          fontSize: fsBody.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                if (state.sessionModel.stageEntity?.drill?.drill
                                        ?.partTimeType ==
                                    'for-each')
                                  DataColumn(
                                    numeric: true,
                                    label: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(0, 6.h, 5.w, 6.h),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'Pat Time',
                                          style: TextStyle(
                                            fontFamily: AppFontFamily.bold,
                                            color: AppColors.orange,
                                            fontSize: fsBody.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                              rows: (filtered ?? []).map((ShootModel shot) {
                                // final isLowest =
                                //     state.sessionModel.lowestSplitTime ==
                                //         miliSecondsToSecsSplitTime(
                                //             shot.splitTimeInt ?? 1);
                                // final isHighest =
                                //     state.sessionModel.highestSplitTime ==
                                //         miliSecondsToSecsSplitTime(
                                //             shot.splitTimeInt ?? 1);
                                return DataRow(
                                  cells: [
                                    DataCell(
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            5.w, 6.h, 6.w, 6.h),
                                        child: Row(
                                          children: [
                                            Text(
                                              '${shot.shootNumber ?? ''}',
                                              style: TextStyle(
                                                fontFamily: AppFontFamily.regular,
                                                color: AppColors.white,
                                                fontSize: fsBody.sp,
                                              ),
                                            ),
                                            // if (isLowest &&
                                            //     (state.sessionModel.listShots
                                            //                 ?.length ??
                                            //             0) >
                                            //         2)
                                            //   Padding(
                                            //     padding:
                                            //         EdgeInsets.only(left: 4.w),
                                            //     child: Image.asset(
                                            //       'assets/icons/shoot_max.png',
                                            //       width: 15,
                                            //     ),
                                            //   ),
                                            // if (isHighest &&
                                            //     (state.sessionModel.listShots
                                            //                 ?.length ??
                                            //             0) >
                                            //         2)
                                            //   Padding(
                                            //     padding:
                                            //         EdgeInsets.only(left: 4.w),
                                            //     child: Image.asset(
                                            //       'assets/icons/shoot_min.png',
                                            //       width: 15,
                                            //     ),
                                            //   ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 6.h),
                                        child: Center(
                                          child: Text(
                                            '${shot.shootScore ?? ''}${getBadgeEmoji(shot.shootScore ?? 0, state.sessionModel.listShots)}',
                                            style: TextStyle(
                                              fontFamily: AppFontFamily.regular,
                                              color: AppColors.white,
                                              fontSize: fsBody.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 6.h, 5.w, 6.h),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            shot.shootNumber==1?'--':'${shot.splitTime ?? ''}”',
                                            style: TextStyle(
                                              fontFamily: AppFontFamily.regular,
                                              color: AppColors.white,
                                              fontSize: fsBody.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 6.h, 5.w, 6.h),
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            shot.shotDirection ?? '',
                                            style: TextStyle(
                                              fontFamily: AppFontFamily.regular,
                                              color: AppColors.white,
                                              fontSize: fsBody.sp,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (state.sessionModel.stageEntity?.drill?.drill?.partTimeType == 'for-each')
                                      DataCell(
                                        Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              0, 6.h, 5.w, 6.h),
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              convertMillisecondsToTime(
                                                  shot.parTime ?? 10),
                                              style: TextStyle(
                                                fontFamily: AppFontFamily.regular,
                                                color: AppColors.white,
                                                fontSize: fsBody.sp,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  ],
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _InfoCard(
                          title: '📋 Session Parameters',
                          rows:  [
                        // ArmoryLoadout? loadoutArm;
                        // ArmoryFirearm? armoryFirearmA;
                        // ArmoryAmmunition? armoryAmmunitionA;
                            // ['Firearm', '${state.sessionModel.stageEntity?.firearm?.type??'None'}, ${state.sessionModel.stageEntity?.firearm?.brand??''}'],
                            // ['Ammunition Type', (state.sessionModel.stageEntity?.firearm?.ammoType??'none')],
                            // ['Weapon Type', (state.sessionModel.stageEntity?.firearm?.type??'none')],
                            ['Firearm', '${armoryFirearmA?.type??'None'}, ${armoryFirearmA?.brand??''}'],
                            ['Ammunition Type', (armoryAmmunitionA?.brand ??'None')],
                            ['Caliber', (armoryAmmunitionA?.caliber ??'None')],
                            ['Weapon Type', (state.sessionModel.stageEntity?.firearm?.type??'none')],
                            ['Distance', (state.sessionModel.stageEntity?.distance ??'none')],
                          ],
                        ),
                        SizedBox(height: 16.h),
                        _InfoCard(
                          title: '📊 Session Stats',
                          rows:  [
                            ['Total Scores', ("${state.sessionModel.totalScores ??'none'}")],
                            ['Scheduled Shots',("${state.sessionModel.numberOfShots ?? ''}")],
                            ['Fired Shots', ("${state.sessionModel.playedShoots ?? ''}")],
                            ['Total Shots', ("${state.sessionModel.numberOfShots ?? ''}")],
                          ],
                        ),
                        SizedBox(height: 16.h),

                        _InfoCard(
                          title: '📈 Performance Metrics',
                          rows:  [
                            ['Average Score', state.sessionModel.averageScore?.toStringAsFixed(2) ?? ''],
                            ['Best Score', '${state.sessionModel.highestScore ?? ''}'],
                            ['Average Split Time', '${state.sessionModel.averageSplitTime?.toStringAsFixed(2)??''}"'],
                            ['Best Split Time', '${double.parse((state.sessionModel.lowestSplitTimeString??"1.1")).toStringAsFixed(2)}”'],
                          ],
                        ),
                        SizedBox(height: 32.h),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  static String _directionLabel(IconData icon) {
    switch (icon.codePoint) {
      case 0xe57a:
        return 'NE'; // north_east
      case 0xe55e:
        return 'E'; // arrow_forward
      case 0xe600:
        return 'SE'; // south_east
      case 0xe53d:
        return 'S'; // south
      case 0xe55f:
        return 'N'; // north
      case 0xe3f3:
        return 'Center'; // lens
      default:
        return '';
    }
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final List<List<String>> rows;

  const _InfoCard({required this.title, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: r8Decoration,
      // color: AppColors.lightGry,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: fsHeading.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.orange,
              ),
            ),
            if (rows.isNotEmpty) ...[
              Divider(color: Colors.white24),
              ...rows.map((r) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(r[0],
                          style: TextStyle(
                              fontSize: fsBody.sp, color: Colors.white70)),
                      Text(r[1],
                          style: TextStyle(
                              fontSize: fsBody.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white)),
                    ],
                  ),
                );
              }),
            ],
          ],
        ),
      ),
    );
  }
}
