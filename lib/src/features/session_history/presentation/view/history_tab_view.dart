// lib/src/features/session_history/presentation/view/history_tab_view.dart
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/app config/device_config.dart';
import '../../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../../core/services/locator/locator.dart';
import '../../../../core/theme/theme_data/theme_data.dart';
import '../../../user_dashboard/pages/placeholder_tabs.dart';
import '../bloc/session_history_bloc.dart';
import '../widgets/history_card_view.dart';

class HistoryTabWidget extends StatefulWidget {
  const HistoryTabWidget({super.key});

  @override
  State<HistoryTabWidget> createState() => _HistoryTabWidgetState();
}

class _HistoryTabWidgetState extends State<HistoryTabWidget> {
  @override
  void initState() {
    super.initState();
    slSessionHistoryBloc.add(SessionHistoryEvent.getAllSessions());
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = DeviceConfig.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: AppTheme.paddingLarge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('History', style: TextStyle(
                color: AppTheme.primary(context),
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              )),
              SizedBox(height: AppTheme.spacingSmall),
              Text(
                'See past sessions and results.',
                style: AppTheme.labelMedium(context),
              ),
            ],
          ),
        ),
        Expanded(
          child: BlocProvider.value(
            value: slSessionHistoryBloc,
            child: BlocBuilder<SessionHistoryBloc, SessionHistoryState>(
              builder: (context, state) {
                final sessionsToShow = state.session.length > 3 ? 3 : state.session.length;
                if (state.session.isEmpty) {
                  return _buildEmptyHistory(context);
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    slSessionHistoryBloc.add(SessionHistoryEvent.getAllSessions());
                  },
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppTheme.spacingLarge,
                      vertical: AppTheme.spacingMedium,
                    ),
                    itemCount: sessionsToShow + 1,
                    itemBuilder: (context, index) {
                      if (index == sessionsToShow) {
                        return Padding(
                          padding: EdgeInsets.only(
                            top: AppTheme.spacingLarge,
                            bottom: AppTheme.spacingXLarge,
                          ),
                          child: _buildShoQCard(context),
                        );
                      }

                      final session = state.session[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: AppTheme.spacingMedium),
                        child: SessionCard(session: session),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShoQCard(BuildContext context) {
    final isMobile = DeviceConfig.isMobile(context);
    return Align(
      alignment: Alignment.center,
      child: FractionallySizedBox(
        widthFactor: isMobile ? 1 : 1,
        child: Container(
          padding: AppTheme.paddingLarge,
          decoration: BoxDecoration(
            color: AppTheme.primary(context).withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppTheme.radiusXLarge),
            border: Border.all(color: AppTheme.primary(context).withOpacity(0.3)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.description, color: AppTheme.primary(context), size: AppTheme.iconXLarge * 1.5),
                  SizedBox(width: AppTheme.spacingLarge),
                  Expanded(child: _buildContent(context)),
                ],
              ),
              SizedBox(height: AppTheme.spacingLarge),
              SizedBox(
                width: double.infinity,
                child: _buildButton(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Continue in ShoQ Journal', style: AppTheme.titleLarge(context)),
        SizedBox(height: AppTheme.spacingSmall),
        Text(
          'ShoQ Journal is where long-term trends, coach feedback, and AI performance analysis live.',
          style: AppTheme.bodySmall(context).copyWith(color: AppTheme.textSecondary(context)),
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        const packageName = 'com.pa.shoq';
        bool isInstalled = await LaunchApp.isAppInstalled(androidPackageName: packageName);

        if (isInstalled) {
          await LaunchApp.openApp(androidPackageName: packageName);
        } else {
          final storeUri = Uri.parse('https://play.google.com/store/apps/details?id=$packageName');
          await launchUrl(storeUri, mode: LaunchMode.externalApplication);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primary(context),
        padding: EdgeInsets.symmetric(
          horizontal: AppTheme.spacingLarge,
          vertical: AppTheme.spacingMedium,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('View Full Performance History', style: TextStyle(color: Colors.white)),
          SizedBox(width: AppTheme.spacingSmall),
          Icon(Icons.arrow_forward, color: Colors.white, size: AppTheme.iconSmall),
        ],
      ),
    );
  }

  Widget _buildEmptyHistory(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppTheme.paddingXXLarge,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.history_outlined,
              size: AppTheme.iconXLarge * 2,
              color: AppTheme.textSecondary(context),
            ),
            SizedBox(height: AppTheme.spacingLarge),
            Text(
              'No training history yet.',
              style: AppTheme.bodyMedium(context).copyWith(
                color: AppTheme.textSecondary(context),
              ),
            ),
            SizedBox(height: AppTheme.spacingSmall),
            Text(
              'Complete training sessions to see your progress here.',
              style: AppTheme.bodySmall(context).copyWith(
                color: AppTheme.textSecondary(context),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}