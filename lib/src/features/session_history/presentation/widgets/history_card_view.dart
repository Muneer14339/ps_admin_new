// lib/src/features/session_history/presentation/widgets/history_card_view.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/app config/device_config.dart';
import '../../../../core/theme/theme_data/theme_data.dart';
import '../../../train/session/data/model/save_session_model.dart';

class SessionCard extends StatelessWidget {
  final SaveSessionModel session;

  const SessionCard({
    super.key,
    required this.session,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppTheme.paddingLarge,
      decoration: BoxDecoration(
        color: AppTheme.surface(context),
        borderRadius: BorderRadius.circular(AppTheme.radiusXLarge),
        border: Border.all(
          color: AppTheme.primary(context).withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLeftSection(context),
              Expanded(child: SizedBox(width: AppTheme.spacingMedium)),
              _buildRightSection(context),
            ],
          ),
          SizedBox(height: AppTheme.spacingLarge),
          _buildBottomSection(context),
        ],
      ),
    );
  }

  Widget _buildLeftSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: AppTheme.paddingMedium,
          decoration: BoxDecoration(
            color: AppTheme.primary(context).withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
            border: Border.all(
              color: AppTheme.primary(context).withOpacity(0.3),
            ),
          ),
          child: Icon(
            Icons.schedule,
            color: AppTheme.primary(context),
            size: AppTheme.iconLarge,
          ),
        ),
        SizedBox(height: AppTheme.spacingSmall),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppTheme.spacingMedium,
            vertical: AppTheme.spacingXSmall,
          ),
          decoration: BoxDecoration(
            color: AppTheme.primary(context),
            borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
          ),
          child: Column(
            children: [
              Text(
                '${session.playedShots ?? 0}',
                style: AppTheme.labelSmall(context).copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'SHOTS',
                style: AppTheme.labelSmall(context).copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRightSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          padding: AppTheme.paddingMedium,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
            border: Border.all(
              color: AppTheme.primary(context),
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Text(
                _calculateTotalScore().toString(),
                style: AppTheme.headingMedium(context).copyWith(
                  color: AppTheme.primary(context),
                  height: 1,
                ),
              ),
              SizedBox(height: AppTheme.spacingXSmall),
              Text(
                'TOTAL SCORE',
                style: AppTheme.labelSmall(context).copyWith(
                  color: AppTheme.textSecondary(context),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: AppTheme.spacingSmall),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppTheme.spacingMedium,
            vertical: AppTheme.spacingXSmall,
          ),
          decoration: BoxDecoration(
            color: AppTheme.primary(context),
            borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
          ),
          child: Column(
            children: [
              Text(
                _getQuickestSplit(),
                style: AppTheme.labelSmall(context).copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'QUICKEST SPLIT',
                style: AppTheme.labelSmall(context).copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomSection(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _buildInfoColumn(
            context,
            label: 'SESSION NAME',
            value: session.sessionName ??'Practice Drill',
          ),
        ),
        SizedBox(width: AppTheme.spacingMedium),
        Expanded(
          child: _buildInfoColumn(
            context,
            label: 'DRILL NAME',
            value: session.saveStageEntity?.drill?.drill?.name ?? 'No drill',
          ),
        ),
        SizedBox(width: AppTheme.spacingMedium),
        Expanded(
          child: _buildInfoColumn(
            context,
            label: 'DATE & TIME',
            value: _formatDateTime(session.dateTime),
          ),
        ),
      ],
    );
  }

  Widget _buildInfoColumn(BuildContext context, {required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTheme.labelSmall(context).copyWith(
            color: AppTheme.textSecondary(context),
          ),
        ),
        SizedBox(height: AppTheme.spacingXSmall),
        Text(
          value,
          style: AppTheme.bodyMedium(context).copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  String _formatDateTime(String? dateTime) {
    if (dateTime == null || dateTime.isEmpty) return 'No date';

    try {
      final date = DateTime.parse(dateTime);
      return DateFormat('MMM dd, yyyy · h:mm a').format(date);
    } catch (e) {
      try {
        final date = DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateTime);
        return DateFormat('MMM dd, yyyy · h:mm a').format(date);
      } catch (e) {
        return dateTime;
      }
    }
  }

  int _calculateTotalScore() {
    if (session.shotsList == null || session.shotsList!.isEmpty) return 0;
    return session.shotsList!.fold<int>(
      0,
          (sum, shot) => sum + (shot.shootScore ?? 0),
    );
  }

  String _getQuickestSplit() {
    if (session.shotsList == null || session.shotsList!.isEmpty) return '0.0"';

    final splits = session.shotsList!
        .where((shot) => shot.splitTime != null && shot.splitTime! > 0)
        .map((shot) => shot.splitTime!)
        .toList();

    if (splits.isEmpty) return '0.0"';

    final quickest = splits.reduce((a, b) => a < b ? a : b);
    return '${(quickest / 100).toStringAsFixed(1)}"';
  }
}