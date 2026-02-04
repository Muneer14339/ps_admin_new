import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'dart:io';

import '../../../../core/app config/device_config.dart';
import '../../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../../core/theme/color/app_colors_new.dart';
import '../../../../core/theme/theme_data/theme_data.dart';
import '../../../../core/theme/font/app_fonts.dart';
import '../../../../core/widgets/modified_container.dart';
import '../../../train/session/data/model/save_session_model.dart';
import '../../../armory/data/datasources/armory_local_repository_impl.dart';
import '../../../armory/domain/entities/armory_loadout.dart';
import '../../../armory/domain/entities/armory_firearm.dart';
import '../../../armory/domain/entities/armory_ammunition.dart';
import '../../../../core/services/sqflite_service/database_helper.dart';
import '../../../../core/services/locator/locator.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SessionDetailView extends StatefulWidget {
  final SaveSessionModel session;

  const SessionDetailView({
    super.key,
    required this.session,
  });

  @override
  State<SessionDetailView> createState() => _SessionDetailViewState();
}

class _SessionDetailViewState extends State<SessionDetailView> {
  ArmoryLoadout? loadout;
  ArmoryFirearm? firearm;
  ArmoryAmmunition? ammunition;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadArmoryData();
  }

  Future<void> _loadArmoryData() async {
    try {
      final userId = locator<LocalStorageService>().userId!;
      print('=== SessionDetailView: _loadArmoryData START ===');
      print('userId: $userId');
      print('session.loadoutId: ${widget.session.loadoutId}');
      print('session.firearmId: ${widget.session.firearmId}');
      print('session.ammunitionId: ${widget.session.ammunitionId}');

      if (userId == null || userId.isEmpty) {
        print('userId is null or empty, returning');
        setState(() {
          isLoading = false;
        });
        return;
      }

      final armoryDataSource = ArmoryLocalDataSourceImpl(
        dbHelper: locator<DatabaseHelper>(),
      );

      if (widget.session.loadoutId != null) {
        print('Fetching loadout with ID: ${widget.session.loadoutId}');
        loadout = await armoryDataSource.getLoadoutById(userId, widget.session.loadoutId!);
        print('Loadout fetched: ${loadout?.name ?? 'NULL'}');
      }
      if (widget.session.firearmId != null) {
        print('Fetching firearm with ID: ${widget.session.firearmId}');
        firearm = await armoryDataSource.getFirearmById(userId, widget.session.firearmId!);
        print('Firearm fetched: ${firearm?.brand ?? 'NULL'}');
      }
      if (widget.session.ammunitionId != null) {
        print('Fetching ammunition with ID: ${widget.session.ammunitionId}');
        ammunition = await armoryDataSource.getAmmunitionById(userId, widget.session.ammunitionId!);
        print('Ammunition fetched: ${ammunition?.brand ?? 'NULL'}');
      }

      print('Final state - Loadout: ${loadout?.name}, Firearm: ${firearm?.brand}, Ammunition: ${ammunition?.brand}');
      print('=== SessionDetailView: _loadArmoryData END ===');

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print('ERROR in _loadArmoryData: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.bg_gry,
        appBar: AppBar(
          backgroundColor: AppColors.bg_gry,
          title: Text(
            'Session #${widget.session.sessionId ?? 'N/A'}',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 18.sp,
              fontFamily: AppFontFamily.bold,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Column(
          children: [
            // Tab Bar
            ModifiedContainer(
              margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              height: 35.h,
              borderRadius: 6.r,
              color: AppColors.white.withOpacity(0.07),
              child: TabBar(
                tabAlignment: TabAlignment.fill,
                dividerColor: Colors.transparent,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                indicator: BoxDecoration(
                  color: AppColors.kPrimaryColor,
                  borderRadius: BorderRadius.circular(2.h),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    child: Text(
                      'Shot Count',
                      style: TextStyle(
                        color: AppColors.white,
                        fontFamily: AppFontFamily.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Session Summary',
                      style: TextStyle(
                        color: AppColors.white,
                        fontFamily: AppFontFamily.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Session Album',
                      style: TextStyle(
                        color: AppColors.white,
                        fontFamily: AppFontFamily.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Tab Views
            Expanded(
              child: TabBarView(
                children: [
                  DeviceConfig.isMobile(context) ? _buildShotCountTabMobile() : _buildShotCountTab(),
                  DeviceConfig.isMobile(context) ? _buildSessionSummaryTabMobile() : _buildSessionSummaryTab(),
                  DeviceConfig.isMobile(context) ? _buildSessionAlbumTabMobile() : _buildSessionAlbumTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Tab 1: Shot Count (using custom implementation for history data)
  Widget _buildShotCountTab() {
    final shots = widget.session.shotsList;
    if (shots == null || shots.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image_not_supported,
              color: AppColors.white.withOpacity(0.3),
              size: 48.sp,
            ),
            Gap(8.h),
            Text(
              'No shot details available',
              style: TextStyle(
                color: AppColors.white.withOpacity(0.5),
                fontSize: 14.sp,
              ),
            ),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '🎯 Shooting Performance Analysis',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.orange,
            ),
          ),
          Gap(12.h),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
            clipBehavior: Clip.antiAlias,
            child: DataTable(
              dividerThickness: 0.5,
              headingRowColor: WidgetStateProperty.resolveWith<Color?>(
                (states) => AppColors.lightGry,
              ),
              dataRowColor: WidgetStateProperty.resolveWith<Color?>(
                (states) => AppColors.lightGry,
              ),
              dataTextStyle: TextStyle(
                fontFamily: AppFontFamily.regular,
                color: AppColors.white,
                fontSize: 14.h,
              ),
              columns: [
                DataColumn(
                  label: Padding(
                    padding: EdgeInsets.fromLTRB(5.w, 6.h, 0, 6.h),
                    child: Text(
                      'Shot #',
                      style: TextStyle(
                        fontFamily: AppFontFamily.bold,
                        color: AppColors.orange,
                        fontSize: 12.sp,
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
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                DataColumn(
                  numeric: true,
                  label: Padding(
                    padding: EdgeInsets.fromLTRB(0, 6.h, 5.w, 6.h),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Split Time',
                        style: TextStyle(
                          fontFamily: AppFontFamily.bold,
                          color: AppColors.orange,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                DataColumn(
                  numeric: true,
                  label: Padding(
                    padding: EdgeInsets.fromLTRB(0, 6.h, 5.w, 6.h),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Direction',
                        style: TextStyle(
                          fontFamily: AppFontFamily.bold,
                          color: AppColors.orange,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
              rows: shots.map((shot) {
                return DataRow(
                  cells: [
                    DataCell(
                      Padding(
                        padding: EdgeInsets.fromLTRB(5.w, 6.h, 6.w, 6.h),
                        child: Text(
                          '${shot.shootNumber ?? ''}',
                          style: TextStyle(
                            fontFamily: AppFontFamily.regular,
                            color: AppColors.white,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.h),
                        child: Center(
                          child: Text(
                            '${shot.shootScore ?? ''}',
                            style: TextStyle(
                              fontFamily: AppFontFamily.regular,
                              color: AppColors.white,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 6.h, 5.w, 6.h),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            shot.shootNumber == 1
                                ? '--'
                                : shot.splitTime != null
                                    ? '${(shot.splitTime! / 1000).toStringAsFixed(2)}"'
                                    : '--',
                            style: TextStyle(
                              fontFamily: AppFontFamily.regular,
                              color: AppColors.white,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    DataCell(
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 6.h, 5.w, 6.h),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            shot.shotDirection ?? '',
                            style: TextStyle(
                              fontFamily: AppFontFamily.regular,
                              color: AppColors.white,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  // Tab 2: Session Summary
  Widget _buildSessionSummaryTab() {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(color: AppColors.kPrimaryColor),
      );
    }

    final stage = widget.session.saveStageEntity;

    // Calculate statistics
    final totalShots = widget.session.playedShots ?? 0;
    final missingShots = widget.session.missingShots ?? 0;
    final shots = widget.session.shotsList ?? [];

    // Calculate scores
    int totalScore = 0;
    int highestScore = 0;
    int lowestScore = shots.isNotEmpty ? (shots.first.shootScore ?? 0) : 0;
    double averageScore = 0;

    for (var shot in shots) {
      final score = shot.shootScore ?? 0;
      totalScore += score;
      if (score > highestScore) highestScore = score;
      if (score < lowestScore) lowestScore = score;
    }

    if (shots.isNotEmpty) {
      averageScore = totalScore / shots.length;
    }

    // Calculate split times
    int totalSplitTimeMs = 0;
    int? lowestSplitTimeMs;

    for (var shot in shots) {
      if (shot.splitTime != null) {
        totalSplitTimeMs += shot.splitTime!;
        if (lowestSplitTimeMs == null || shot.splitTime! < lowestSplitTimeMs) {
          lowestSplitTimeMs = shot.splitTime;
        }
      }
    }

    final sessionItems = <MapEntry<String, String>>[
      MapEntry('Target Type', 'PulseAim Target'),
      // Display armory data from IDs
      if (loadout != null)
        MapEntry('Loadout', loadout!.name),
      if (firearm != null)
        MapEntry('Firearm', '${firearm!.type ?? ''}, ${firearm!.brand}'),
      if (ammunition != null)
        MapEntry('Ammunition', '${ammunition!.brand} ${ammunition!.caliber}'),
      // Fallback to stage entity data
      // if (firearm == null && stage?.firearm?.brand != null)
      //   MapEntry('Firearm', '${stage!.firearm!.type ?? ''}, ${stage.firearm!.brand}'),
      if (stage?.mountLocation != null)
        MapEntry('AimSync Mount Loc.', '${stage!.mountLocation}'),
      MapEntry('Training Mode', 'Practice'),
      if (stage?.dominantHand != null)
        MapEntry('Dominant Hand', '${stage!.dominantHand}'),
      if (stage?.venue != null)
        MapEntry('Venue', '${stage!.venue}'),
      if (stage?.distance != null)
        MapEntry('Distance', '${stage!.distance}'),
      if (stage?.mode?.name != null)
        MapEntry('Scoring Mode', '${stage!.mode!.name}'),
    ];

    final perfItems = <MapEntry<String, String>>[
      MapEntry('Total Shots Fired', '$totalShots'),
      MapEntry('Number of Missing Shots', '${shots.where((shot) => shot.shootScore == 0).length ?? 0?? ''}',),
      // MapEntry('Number of Missing Shots', '$missingShots'),
      MapEntry('Total Score', '$totalScore'),
      MapEntry('Highest Score', '$highestScore'),
      MapEntry('Lowest Score', '$lowestScore'),
      MapEntry('Average Score', averageScore.toStringAsFixed(2)),
      MapEntry('Total Time', '${(totalSplitTimeMs / 1000).toStringAsFixed(2)}"'),
      if (lowestSplitTimeMs != null)
        MapEntry('Quickest Split Time', '${(lowestSplitTimeMs / 1000).toStringAsFixed(2)}"'),
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
        ],
      ),
    );
  }

  // Tab 3: Session Album
  Widget _buildSessionAlbumTab() {
    final shots = widget.session.shotsList;
    if (shots == null || shots.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.photo_library,
              color: AppColors.white.withOpacity(0.3),
              size: 80.sp,
            ),
            Gap(16.h),
            Text(
              'No images available',
              style: TextStyle(
                color: AppColors.white.withOpacity(0.5),
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      );
    }

    // Filter shots with images
    final shotsWithImages = shots.where((shot) =>
      shot.shootImagePath != null && shot.shootImagePath!.isNotEmpty
    ).toList();

    if (shotsWithImages.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.photo_library,
              color: AppColors.white.withOpacity(0.3),
              size: 80.sp,
            ),
            Gap(16.h),
            Text(
              'No images available',
              style: TextStyle(
                color: AppColors.white.withOpacity(0.5),
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(8.h),
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                color: AppColors.lightGry,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Spacer(),
                  Text(
                    'Session #${widget.session.sessionId ?? ''}',
                    style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                    ),
                  ),
                  Gap(8.w),
                ],
              ),
            ),
            Gap(16.h),
            Wrap(
              children: List.generate(
                shotsWithImages.length,
                (i) => ModifiedContainer(
                  padding: EdgeInsets.all(4.0),
                  margin: EdgeInsets.all(5.0),
                  borderRadius: 12,
                  color: AppColors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => _showShotDetailDialog(context, shotsWithImages[i], i),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          child: Image.file(
                            fit: BoxFit.cover,
                            File(shotsWithImages[i].shootImagePath ?? ''),
                            width: 160.h,
                            height: 160.h,
                          ),
                        ),
                      ),
                      Gap(4.h),
                      Text(
                        shotsWithImages[i].shootScore == 0
                            ? 'Shot ${shotsWithImages[i].shootNumber ?? i + 1} is outside from rings,\nso score is 0'
                            : 'Shot#${shotsWithImages[i].shootNumber ?? i + 1}  Score: ${shotsWithImages[i].shootScore}',
                        style: TextStyle(
                          color: shotsWithImages[i].shootScore == 0
                              ? AppColors.kRedColor
                              : AppColors.black,
                          fontSize: 12.sp,
                          fontFamily: AppFontFamily.regular,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // For Mobile
// Shot Count Tab - Mobile
  Widget _buildShotCountTabMobile() {
    final shots = widget.session.shotsList;
    if (shots == null || shots.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image_not_supported, color: AppColors.white.withOpacity(0.3), size: 48.sp),
            Gap(8.h),
            Text('No shot details available', style: TextStyle(color: AppColors.white.withOpacity(0.5), fontSize: 14.sp)),
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('🎯 Performance', style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: AppColors.orange)),
          Gap(12.h),
          Expanded(
            child: SingleChildScrollView(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  width: double.infinity,
                  child: DataTable(
                    columnSpacing: 15.w,
                    headingRowHeight: 40.h,
                    dataRowHeight: 35.h,
                    dividerThickness: 0.5,
                    headingRowColor: WidgetStateProperty.all(AppColors.lightGry),
                    dataRowColor: WidgetStateProperty.all(AppColors.lightGry),
                    dataTextStyle: TextStyle(fontFamily: AppFontFamily.regular, color: AppColors.white, fontSize: 11.sp),
                    columns: [
                      DataColumn(label: Text('Shot', style: TextStyle(fontFamily: AppFontFamily.bold, color: AppColors.orange, fontSize: 12.sp))),
                      DataColumn(label: Text('Score', style: TextStyle(fontFamily: AppFontFamily.bold, color: AppColors.orange, fontSize: 12.sp))),
                      DataColumn(label: Text('Split', style: TextStyle(fontFamily: AppFontFamily.bold, color: AppColors.orange, fontSize: 12.sp))),
                      DataColumn(label: Text('Direction', style: TextStyle(fontFamily: AppFontFamily.bold, color: AppColors.orange, fontSize: 12.sp))),
                    ],
                    rows: shots.map((shot) {
                      return DataRow(
                        cells: [
                          DataCell(Text('${shot.shootNumber ?? ''}')),
                          DataCell(Text('${shot.shootScore ?? ''}')),
                          DataCell(Text(shot.shootNumber == 1 ? '--' : shot.splitTime != null ? '${(shot.splitTime! / 1000).toStringAsFixed(2)}"' : '--')),
                          DataCell(Text(shot.shotDirection ?? '')),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
// Session Summary Tab - Mobile
  Widget _buildSessionSummaryTabMobile() {
    if (isLoading) {
      return Center(child: CircularProgressIndicator(color: AppColors.kPrimaryColor));
    }

    final stage = widget.session.saveStageEntity;
    final totalShots = widget.session.playedShots ?? 0;
    final shots = widget.session.shotsList ?? [];

    int totalScore = 0;
    int highestScore = 0;
    int lowestScore = shots.isNotEmpty ? (shots.first.shootScore ?? 0) : 0;
    double averageScore = 0;

    for (var shot in shots) {
      final score = shot.shootScore ?? 0;
      totalScore += score;
      if (score > highestScore) highestScore = score;
      if (score < lowestScore) lowestScore = score;
    }

    if (shots.isNotEmpty) {
      averageScore = totalScore / shots.length;
    }

    int totalSplitTimeMs = 0;
    int? lowestSplitTimeMs;

    for (var shot in shots) {
      if (shot.splitTime != null) {
        totalSplitTimeMs += shot.splitTime!;
        if (lowestSplitTimeMs == null || shot.splitTime! < lowestSplitTimeMs) {
          lowestSplitTimeMs = shot.splitTime;
        }
      }
    }

    final sessionItems = <MapEntry<String, String>>[
      MapEntry('Target Type', 'PulseAim Target'),
      if (loadout != null) MapEntry('Loadout', loadout!.name),
      if (firearm != null) MapEntry('Firearm', '${firearm!.type ?? ''}, ${firearm!.brand}'),
      if (ammunition != null) MapEntry('Ammunition', '${ammunition!.brand} ${ammunition!.caliber}'),
      if (stage?.mountLocation != null) MapEntry('AimSync Mount', '${stage!.mountLocation}'),
      MapEntry('Training Mode', 'Practice'),
      if (stage?.dominantHand != null) MapEntry('Hand', '${stage!.dominantHand}'),
      if (stage?.venue != null) MapEntry('Venue', '${stage!.venue}'),
      if (stage?.distance != null) MapEntry('Distance', '${stage!.distance}'),
      if (stage?.mode?.name != null) MapEntry('Scoring', '${stage!.mode!.name}'),
    ];

    final perfItems = <MapEntry<String, String>>[
      MapEntry('Total Shots', '$totalShots'),
      MapEntry('Missing', '${shots.where((s) => s.shootScore == 0).length}'),
      MapEntry('Total Score', '$totalScore'),
      MapEntry('Highest', '$highestScore'),
      MapEntry('Lowest', '$lowestScore'),
      MapEntry('Average', averageScore.toStringAsFixed(2)),
      MapEntry('Total Time', '${(totalSplitTimeMs / 1000).toStringAsFixed(2)}"'),
      if (lowestSplitTimeMs != null) MapEntry('Quick Split', '${(lowestSplitTimeMs / 1000).toStringAsFixed(2)}"'),
    ];

    return SingleChildScrollView(
      padding: EdgeInsets.all(12.w),
      child: Column(
        children: [
          _InfoCard(icon: Icons.receipt, title: 'Session Parameters', items: sessionItems),
          SizedBox(height: 12.h),
          _InfoCard(icon: Icons.bar_chart, title: 'Performance Summary', items: perfItems),
        ],
      ),
    );
  }

// Session Album Tab - Mobile
  Widget _buildSessionAlbumTabMobile() {
    final shots = widget.session.shotsList;
    if (shots == null || shots.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.photo_library, color: AppColors.white.withOpacity(0.3), size: 80.sp),
            Gap(16.h),
            Text('No images available', style: TextStyle(color: AppColors.white.withOpacity(0.5), fontSize: 16.sp)),
          ],
        ),
      );
    }

    final shotsWithImages = shots.where((shot) => shot.shootImagePath != null && shot.shootImagePath!.isNotEmpty).toList();

    if (shotsWithImages.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.photo_library, color: AppColors.white.withOpacity(0.3), size: 80.sp),
            Gap(16.h),
            Text('No images available', style: TextStyle(color: AppColors.white.withOpacity(0.5), fontSize: 16.sp)),
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.all(12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(color: AppColors.lightGry, borderRadius: BorderRadius.circular(8.r)),
            child: Text('Session #${widget.session.sessionId ?? ''}', style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w700, fontSize: 14.sp)),
          ),
          Gap(12.h),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 8.h,
                childAspectRatio: 0.85,
              ),
              itemCount: shotsWithImages.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () => _showShotDetailDialog(context, shotsWithImages[i], i),
                  child: Container(
                    decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(8.r)),
                    padding: EdgeInsets.all(6.w),
                    child: Column(
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6.r),
                            child: Image.file(File(shotsWithImages[i].shootImagePath ?? ''), fit: BoxFit.cover, width: double.infinity),
                          ),
                        ),
                        Gap(4.h),
                        Text(
                          'Shot#${shotsWithImages[i].shootNumber ?? i + 1}  ${shotsWithImages[i].shootScore ?? 0}',
                          style: TextStyle(color: shotsWithImages[i].shootScore == 0 ? AppColors.kRedColor : AppColors.black, fontSize: 11.sp),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showShotDetailDialog(BuildContext context, SaveShootModel shot, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShotDetailFullScreen(
          shot: shot,
          shotNumber: shot.shootNumber ?? index + 1,
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<MapEntry<String, String>> items;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = DeviceConfig.isMobile(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightGry,
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 15.h),
      child: ListView(
        shrinkWrap: isMobile,
        physics: isMobile ? NeverScrollableScrollPhysics() : null,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.orange, size: 16.sp),
              SizedBox(width: 8.w),
              Text(
                title,
                style: TextStyle(
                  color: Colors.orange,
                  fontSize: 16.sp,
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
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                    Text(
                      e.value,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
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


// Full-screen shot detail view
class ShotDetailFullScreen extends StatelessWidget {
  final SaveShootModel shot;
  final int shotNumber;

  const ShotDetailFullScreen({
    super.key,
    required this.shot,
    required this.shotNumber,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = DeviceConfig.isMobile(context);
    return Scaffold(
      backgroundColor: AppColors.bg_gry,
      appBar: AppBar(
        backgroundColor: AppColors.lightGry,
        title: Text(
          'Shot #$shotNumber',
          style: TextStyle(
            color: AppColors.kPrimaryColor,
            fontSize: 18.sp,
            fontFamily: AppFontFamily.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: isMobile
          ? Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: AppColors.bg_gry,
              child: Center(
                child: shot.shootImagePath != null && shot.shootImagePath!.isNotEmpty
                    ? _buildFullImage(shot.shootImagePath!)
                    : _buildNoImagePlaceholder(),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: AppColors.lightGry,
            padding: EdgeInsets.all(20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Shot Details',
                  style: TextStyle(
                    color: AppColors.kPrimaryColor,
                    fontSize: 18.sp,
                    fontFamily: AppFontFamily.bold,
                  ),
                ),
                Gap(16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: _buildDetailRowMobile('Shot Number', '#$shotNumber')),
                    SizedBox(width: 16.w),
                    Expanded(child: _buildDetailRowMobile('Score', shot.shootScore?.toString() ?? 'N/A')),
                    if (shot.splitTime != null) ...[
                      SizedBox(width: 16.w),
                      Expanded(child: _buildDetailRowMobile('Split Time', _formatSplitTime(shot.splitTime!))),
                    ],
                  ],
                ),
                Gap(16.h),
              ],
            ),
          ),
        ],
      )
          :Row(
        children: [
          // Image on the left (60%)
          Expanded(
            flex: 3,
            child: Container(
              color: AppColors.bg_gry,
              child: Center(
                child: shot.shootImagePath != null && shot.shootImagePath!.isNotEmpty
                    ? _buildFullImage(shot.shootImagePath!)
                    : _buildNoImagePlaceholder(),
              ),
            ),
          ),
          // Details on the right (40%)
          Expanded(
            flex: 2,
            child: Container(
              color: AppColors.lightGry,
              padding: EdgeInsets.all(24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shot Details',
                    style: TextStyle(
                      color: AppColors.kPrimaryColor,
                      fontSize: 20.sp,
                      fontFamily: AppFontFamily.bold,
                    ),
                  ),
                  Gap(24.h),
                  _buildDetailRow('Shot Number', '#$shotNumber'),
                  Gap(16.h),
                  _buildDetailRow('Score', shot.shootScore?.toString() ?? 'N/A'),
                  if (shot.splitTime != null) ...[
                    Gap(16.h),
                    _buildDetailRow('Split Time', _formatSplitTime(shot.splitTime!)),
                  ],
                  Gap(24.h),
                  Divider(color: AppColors.white.withOpacity(0.2)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFullImage(String imagePath) {
    final file = File(imagePath);
    if (file.existsSync()) {
      return InteractiveViewer(
        minScale: 0.5,
        maxScale: 4.0,
        child: Image.file(
          file,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return _buildNoImagePlaceholder();
          },
        ),
      );
    } else {
      return _buildNoImagePlaceholder();
    }
  }

  Widget _buildNoImagePlaceholder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.image_not_supported,
          color: AppColors.white.withOpacity(0.3),
          size: 80.sp,
        ),
        Gap(16.h),
        Text(
          'No image available',
          style: TextStyle(
            color: AppColors.white.withOpacity(0.5),
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.white.withOpacity(0.7),
            fontSize: 14.sp,
          ),
        ),
        Gap(8.h),
        Text(
          value,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18.sp,
            fontFamily: AppFontFamily.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildDetailRowMobile(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.white.withOpacity(0.7),
            fontSize: 11.sp,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Gap(4.h),
        Text(
          value,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 16.sp,
            fontFamily: AppFontFamily.bold,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  String _formatSplitTime(int milliseconds) {
    final seconds = milliseconds / 1000;
    return '${seconds.toStringAsFixed(2)}s';
  }
}
