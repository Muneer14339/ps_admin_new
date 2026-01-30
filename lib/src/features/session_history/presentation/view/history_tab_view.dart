import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../../core/services/locator/locator.dart';
import '../../../../core/services/session_sync_service.dart';
import '../../../../core/theme/theme_data/theme_data.dart';
import '../../../armory/presentation/bloc/armory_bloc.dart';
import '../../../armory/presentation/bloc/armory_event.dart';
import '../../../armory/presentation/bloc/armory_state.dart';
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
    // TODO: implement initState
    slSessionHistoryBloc.add(SessionHistoryEvent.getAllSessions());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final userId = locator<LocalStorageService>().userId!;

    return Container(
      padding: AppTheme.paddingLarge,
      decoration: AppTheme.cardDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('History', style: AppTheme.titleLarge(context)),
          const SizedBox(height: 4),
          Text(
            'See past sessions and results.',
            style: AppTheme.labelMedium(context),
          ),
          // _buildSyncButtons(context, userId!),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     IconButton(
          //         onPressed: () async {
          //           if (userId == null) {
          //             print('No logged-in user.');
          //             return;
          //           }
          //
          //           // 1) Load all sessions for this user
          //           final rows =
          //               await SessionDbHelper().getSessionsByUid(userId);
          //           if (rows.isEmpty) {
          //             print('No sessions found.');
          //             return;
          //           }
          //
          //           int success = 0, failed = 0;
          //           int index = 0;
          //
          //           // 2) Process sequentially with a normal for-in loop + await
          //           for (final row in rows) {
          //             index++;
          //
          //             final session = row['session'] as SaveSessionModel?;
          //             if (session == null) {
          //               print(
          //                   'Row $index has no session object — skipping.');
          //               continue;
          //             }
          //
          //             final paths = session.shotsList ?? const <String>[];
          //             if (paths.isEmpty) {
          //               print(
          //                   'Session ${session.sessionId} has no images — skipping.');
          //               continue;
          //             }
          //
          //             print('[$index/${rows.length}] Uploading session ${session.sessionId}…');
          //
          //             try {
          //               await uploader.uploadFromPaths(
          //                 userId: userId,
          //                 sessionId: session.sessionId.toString(),
          //                 imagePaths: session.shotsList!,
          //                 // batch handled internally (batchSize)
          //                 batchSize: session.shotsList!.length,
          //                 onSendProgress: (sent, total) {
          //                   if (total > 0) {
          //                     final pct =
          //                         (sent / total * 100).toStringAsFixed(1);
          //                     print(
          //                         '  -> Session ${session.sessionId}: $pct%');
          //                   }
          //                 },
          //                 // IMPORTANT: pass the CURRENT session's details, not the entire list
          //                 dataNew: detailsToJsonString(row),
          //                 // or: dataNew: jsonEncode(session.toJson()),
          //               );
          //
          //               success++;
          //               print(
          //                   '  ✓ Session ${session.sessionId} uploaded.');
          //             } catch (e, st) {
          //               failed++;
          //               print(
          //                   '  ✗ Upload failed for session ${session.sessionId}: $e\n$st');
          //               // optionally continue; don’t abort the rest
          //             }
          //
          //             // (Optional) Gentle throttle between calls to avoid server bursts
          //             await Future.delayed(
          //                 const Duration(milliseconds: 200));
          //           }
          //
          //           print(
          //               'All done. Success=$success, Failed=$failed, Total=${rows.length}');
          //         },
          //         icon: Icon(
          //           Icons.backup,
          //           color: AppTheme.primary(context),
          //           size: 30,
          //         ))
          //   ],
          // ),
          SizedBox(height: AppTheme.spacingLarge),
          // _buildHistoryStats(context),
          // SizedBox(height: AppTheme.spacingLarge),

          BlocProvider.value(
            value: slSessionHistoryBloc,
            child: BlocBuilder<SessionHistoryBloc, SessionHistoryState>(
                builder: (context, state) {
                  return
                    state.session.isNotEmpty?
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          slSessionHistoryBloc.add(SessionHistoryEvent.getAllSessions());
                        },
                        child: GridView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(16),

                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 3,
                          ),
                          itemCount: state.session.length,
                          itemBuilder: (context, index) {
                            final session = state.session[index];
                            return SessionCard(
                              session: session,
                              onDelete: () {
                              },
                            );
                          },
                        ),
                      ),
                    )
                        : _buildEmptyHistory(context);

                }),
          ),

        ],
      ),
    );
  }




  // Widget _buildSyncButtons(BuildContext context, String userId) {
  //   return BlocConsumer<ArmoryBloc, ArmoryState>(
  //     listener: (context, state) {
  //       if (state is SyncCompleted) {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //               content: Text(state.message),
  //               backgroundColor: AppTheme.success(context)),
  //         );
  //       } else if (state is ArmoryError) {
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //               content: Text(state.message),
  //               backgroundColor: AppTheme.error(context)),
  //         );
  //       }
  //     },
  //     builder: (context, state) {
  //       final isLoading = state is SyncInProgress;
  //
  //       return Row(
  //         children: [
  //           Expanded(
  //             child: ElevatedButton.icon(
  //               onPressed: isLoading
  //                   ? null
  //                   : () async {
  //                 context
  //                     .read<ArmoryBloc>()
  //                     .add(SyncLocalToRemoteEvent(userId: userId));
  //
  //                 // Trigger session sync using the SessionSyncService
  //                 final sessionSyncService = locator<SessionSyncService>();
  //                 await sessionSyncService.syncSessionsToRemote(userId);
  //               },
  //               icon:
  //               Icon(Icons.cloud_upload_outlined, size: AppTheme.iconSmall),
  //               label: Text(isLoading ? 'Syncing...' : 'Upload'),
  //             ),
  //           ),
  //           const SizedBox(width: 12),
  //           Expanded(
  //             child: OutlinedButton.icon(
  //               onPressed: isLoading
  //                   ? null
  //                   : () {
  //                 context
  //                     .read<ArmoryBloc>()
  //                     .add(SyncRemoteToLocalEvent(userId: userId));
  //               },
  //               icon: Icon(Icons.cloud_download_outlined,
  //                   size: AppTheme.iconSmall),
  //               label: Text(isLoading ? 'Syncing...' : 'Restore'),
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }


  Widget _buildHistoryStats(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _buildStatCard(context, 'Sessions', '0')),
        const SizedBox(width: 12),
        Expanded(child: _buildStatCard(context, 'Rounds', '0')),
        const SizedBox(width: 12),
        Expanded(child: _buildStatCard(context, 'Average', '0.0')),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.surfaceVariant(context),
        border: Border.all(color: AppTheme.border(context)),
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: AppTheme.headingMedium(context).copyWith(
              color: AppTheme.secondary(context),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: AppTheme.labelSmall(context),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyHistory(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Icon(
            Icons.history_outlined,
            size: 48,
            color: AppTheme.textSecondary(context),
          ),
          const SizedBox(height: 12),
          Text(
            'No training history yet.',
            style: AppTheme.bodyMedium(context).copyWith(
              color: AppTheme.textSecondary(context),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Complete training sessions to see your progress here.',
            style: AppTheme.bodySmall(context).copyWith(
              color: AppTheme.textSecondary(context),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}