// lib/user_dashboard/pages/placeholder_tabs.dart
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/services/locator/locator.dart';
import '../../../core/theme/theme_data/theme_data.dart';
import '../../auth_new/authentication/presentation/bloc/auth_bloc.dart';
import '../../profile/presentation/blocs/profile_bloc/profile_bloc.dart';
import '../../session_history/presentation/bloc/session_history_bloc.dart';
import '../../train/session/data/model/save_session_model.dart';
import 'dart:io';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as p;
import 'package:http_parser/http_parser.dart';

var slSessionHistoryBloc = locator<SessionHistoryBloc>();

class HomeTabWidget extends StatelessWidget {
  const HomeTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: AppTheme.paddingLarge,
        decoration: AppTheme.cardDecoration(context),
        child: const ComingSoonWidget());
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SingleChildScrollView(
  //     padding: AppTheme.paddingLarge,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         _buildQuickActionsCard(context),
  //         SizedBox(height: AppTheme.spacingXLarge),
  //         _buildRecentItemsCard(context),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildQuickActionsCard(BuildContext context) {
      return Container(
      padding: AppTheme.paddingLarge,
      decoration: AppTheme.cardDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Quick Actions', style: AppTheme.titleLarge(context)),
          const SizedBox(height: 4),
          Text(
            'Quick actions and recent items.',
            style: AppTheme.labelMedium(context),
          ),
          SizedBox(height: AppTheme.spacingLarge),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildActionButton(
                  context, 'Open Armory', Icons.radio_button_unchecked),
              _buildActionButton(
                  context, 'Start Training', Icons.flash_on_outlined),
              _buildActionButton(
                  context, 'View History', Icons.analytics_outlined),
              _buildActionButton(
                  context, 'Manage Profile', Icons.account_circle_outlined),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecentItemsCard(BuildContext context) {
    return Container(
      padding: AppTheme.paddingLarge,
      decoration: AppTheme.cardDecoration(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Recently Added', style: AppTheme.titleLarge(context)),
          SizedBox(height: AppTheme.spacingLarge),
          _buildEmptyState(context),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, String label, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: AppTheme.iconSmall),
      label: Text(label),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 48,
            color: AppTheme.textSecondary(context),
          ),
          const SizedBox(height: 12),
          Text(
            'Nothing added yet.',
            style: AppTheme.bodyMedium(context).copyWith(
              color: AppTheme.textSecondary(context),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Start by adding items to your armory.',
            style: AppTheme.bodySmall(context).copyWith(
              color: AppTheme.textSecondary(context),
            ),
          ),
        ],
      ),
    );
  }

}

class TrainingTabWidget extends StatelessWidget {
  const TrainingTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppTheme.paddingLarge,
      child: Column(
        children: [
          Container(
            padding: AppTheme.paddingLarge,
            decoration: AppTheme.cardDecoration(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Training', style: AppTheme.titleLarge(context)),
                const SizedBox(height: 4),
                Text(
                  'Connect Bluetooth camera/sensors and start a session.',
                  style: AppTheme.labelMedium(context),
                ),
                SizedBox(height: AppTheme.spacingLarge),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _buildFeatureButton(
                        context, 'Connect Camera', Icons.camera_alt_outlined),
                    _buildFeatureButton(
                        context, 'Connect Sensors', Icons.sensors_outlined),
                  ],
                ),
                SizedBox(height: AppTheme.spacingLarge),
                _buildComingSoonBanner(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureButton(
      BuildContext context, String label, IconData icon) {
    return ElevatedButton.icon(
      onPressed: null,
      icon: Icon(icon, size: AppTheme.iconSmall),
      label: Text(label),
    );
  }

  Widget _buildComingSoonBanner(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.secondary(context).withOpacity(0.1),
        border: Border.all(color: AppTheme.secondary(context).withOpacity(0.2)),
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
      ),
      child: Column(
        children: [
          Icon(
            Icons.construction_outlined,
            size: 32,
            color: AppTheme.secondary(context),
          ),
          const SizedBox(height: 8),
          Text(
            'Coming Soon',
            style: AppTheme.titleMedium(context).copyWith(
              color: AppTheme.secondary(context),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Training features are under development.',
            style: AppTheme.bodySmall(context).copyWith(
              color: AppTheme.textSecondary(context),
            ),
          ),
        ],
      ),
    );
  }
}



class ProfileTabWidget extends StatelessWidget {
  const ProfileTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        print('🎯 [UI-BlocListener] State changed: ${state.runtimeType}');

        if (state is DeleteUserSuccess) {
          print('🟢 [UI-BlocListener] DeleteUserSuccess received - Response: ${state.response}');
          // Dismiss any existing snackbars first
          ScaffoldMessenger.of(context).clearSnackBars();
          print('🟢 [UI-BlocListener] Cleared previous snackbars');
          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Account deleted successfully'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
          print('🟢 [UI-BlocListener] Triggering logout event');
          // Logout user after account deletion
          context.read<AuthBloc>().add(const AuthEventLogout());
        } else if (state is DeleteUserError) {
          print('🔴 [UI-BlocListener] DeleteUserError received - Error: ${state.error}');
          // Dismiss any existing snackbars first
          ScaffoldMessenger.of(context).clearSnackBars();
          print('🔴 [UI-BlocListener] Cleared previous snackbars');
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
            ),
          );
        } else if (state is DeleteUserLoading) {
          print('🟡 [UI-BlocListener] DeleteUserLoading received - Showing loading indicator');
          // Show loading indicator
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Row(
                children: [
                  SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                  SizedBox(width: 16),
                  Text('Deleting account...'),
                ],
              ),
              duration: Duration(seconds: 30),
            ),
          );
        }
      },
      child: SingleChildScrollView(
        padding: AppTheme.paddingLarge,
        child: Column(
          children: [
            Container(
              padding: AppTheme.paddingLarge,
              decoration: AppTheme.cardDecoration(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Profile', style: AppTheme.titleLarge(context)),
                      Spacer(),
                      IconButton(
                        icon: Icon(
                          Icons.logout,
                          color: AppTheme.primary(context),
                          size: AppTheme.iconMedium,
                        ),
                        onPressed: () {
                          context.read<AuthBloc>().add(const AuthEventLogout());
                        },
                      ),
                    ],
                  ),
                  Text(
                    'Account and preferences.',
                    style: AppTheme.labelMedium(context),
                  ),
                  SizedBox(height: AppTheme.spacingMedium),
                  // _buildLegalLinks(context),
                  SizedBox(height: AppTheme.spacingLarge),
                  _buildProfileSettings(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSettings(BuildContext context) {
    return Column(
      children: [
        // _buildSettingTile(
        //   context,
        //   'Account Settings',
        //   'Manage your account details',
        //   Icons.account_circle_outlined,
        // ),
        // _buildSettingTile(
        //   context,
        //   'App Preferences',
        //   'Customize your app experience',
        //   Icons.settings_outlined,
        // ),
        _buildSettingTile(
          context,
          'Data & Privacy',
          'View our Privacy Policy',
          Icons.security_outlined,
          onTap: () async {
            final uri = Uri.parse('https://www.pulseaim.com/privacy-policy.html');
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            }
          }
        ),
        _buildSettingTile(
          context,
          'Terms of Use',
          'View Terms of Use',
          Icons.help_outline,
          onTap: () async {
            final uri = Uri.parse('https://www.pulseaim.com/terms-of-use.html');
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            }
          }
        ),

        _buildSettingTile(
          context,
          'Delete Account',
          'Delete your all the data(armory and sessions history)',
          Icons.account_circle_outlined,
          onTap: () async {
            print('🔵 [UI-DeleteButton] Delete Account button tapped - Showing confirmation dialog');
            final result = await showDialog<bool>(
              context: context,
              builder: (ctx) => AlertDialog(
                title: const Text('Delete Account'),
                content: const Text(
                    'Are you sure you want to delete your account? This will delete all your data including armory and session history. This action cannot be undone.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      print('🔵 [UI-DeleteButton] User cancelled deletion');
                      Navigator.of(ctx).pop(false);
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      print('🔵 [UI-DeleteButton] User confirmed deletion');
                      Navigator.of(ctx).pop(true);
                    },
                    child: const Text('Delete', style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
            );
            print('🔵 [UI-DeleteButton] Dialog result: $result');
            if (result == true && context.mounted) {
              print('🔵 [UI-DeleteButton] Dispatching DeleteUserEvent to ProfileBloc');
              context.read<ProfileBloc>().add(DeleteUserEvent());
              print('🔵 [UI-DeleteButton] DeleteUserEvent dispatched');
            }
          },
        ),
        const SizedBox(height: 16),
        _buildComingSoonBanner(context),
      ],
    );
  }

  Widget _buildSettingTile(
      BuildContext context, String title, String subtitle, IconData icon,
      {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.surfaceVariant(context),
        border: Border.all(color: AppTheme.border(context)),
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppTheme.surface(context),
              borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
            ),
            child: Icon(
              icon,
              size: AppTheme.iconMedium,
              color: AppTheme.textPrimary(context),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTheme.titleMedium(context),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: AppTheme.labelSmall(context),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right,
            color: AppTheme.textSecondary(context),
            size: AppTheme.iconMedium,
          ),
        ],
      ),
    ));
  }

  Widget _buildComingSoonBanner(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.secondary(context).withOpacity(0.1),
        border: Border.all(color: AppTheme.secondary(context).withOpacity(0.2)),
        borderRadius: BorderRadius.circular(AppTheme.radiusMedium),
      ),
      child: Column(
        children: [
          Icon(
            Icons.person_outline,
            size: 32,
            color: AppTheme.secondary(context),
          ),
          const SizedBox(height: 8),
          Text(
            'Profile Features Coming Soon',
            style: AppTheme.titleMedium(context).copyWith(
              color: AppTheme.secondary(context),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Advanced profile management is under development.',
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

class SessionImagesUploader {
  static const String baseUrl = 'http://93.127.217.36:5018';
  static const String resource = '/public/session-images';

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 60),
      // Accept 2xx
      validateStatus: (code) => code != null && code >= 200 && code < 300,
    ),
  );

  /// Uploads local image files found at [imagePaths] to the endpoint as repeated `images` fields.
  /// Splits into batches to avoid huge multipart bodies.
  Future<void> uploadFromPaths({
    required String userId,
    required String sessionId,
    required String dataNew,
    required List<SaveShootModel> imagePaths,
    int batchSize = 8,
    void Function(int sent, int total)? onSendProgress,
  }) async {
    if (imagePaths.isEmpty) {
      throw ArgumentError('imagePaths is empty');
    }

    // Filter + report missing files early
    final missing = <String>[];
    final existing = <String>[];
    for (final path in imagePaths) {
      if (await File(path.shootImagePath!).exists()) {
        existing.add(path.shootImagePath!);
      } else {
        missing.add(path.shootImagePath!);
      }
    }
    if (missing.isNotEmpty) {
      // Not fatal—continue with existing
      // ignore: avoid_print
      print('Skipped missing files (${missing.length}): $missing');
    }
    if (existing.isEmpty) {
      throw StateError(
          'No valid files to upload after filtering missing paths.');
    }

    // Chunk into batches
    for (int i = 0; i < existing.length; i += batchSize) {
      final chunk = existing.sublist(
        i,
        (i + batchSize > existing.length) ? existing.length : i + batchSize,
      );

      final form = FormData();
      form.fields
        ..add(MapEntry('user_id', userId))
        ..add(MapEntry('session_id', sessionId))
        ..add(MapEntry('details', dataNew));

      for (final filePath in chunk) {
        final filename = p.basename(filePath);
        final mime = lookupMimeType(filePath) ?? 'application/octet-stream';
        final mediaType = MediaType.parse(mime);

        final mf = await MultipartFile.fromFile(
          filePath,
          filename: filename,
          contentType: mediaType,
        );

        // Repeated field name "images"
        form.files.add(MapEntry('images', mf));
      }

      final resp = await _dio.post(
        resource,
        data: form,
        options: Options(contentType: 'multipart/form-data'),
        onSendProgress: onSendProgress ??
            (sent, total) {
              if (total > 0) {
                final pct = (sent / total * 100).toStringAsFixed(1);
                // ignore: avoid_print
                print(
                    'Batch ${i ~/ batchSize + 1}: $pct% ($sent/$total bytes)');
              }
            },
      );

      // ignore: avoid_print
      print(
          'Batch ${i ~/ batchSize + 1} status: ${resp.statusCode} ${resp.statusMessage}');
      // ignore: avoid_print
      print('Response: ${resp.data}');
    }
  }
}


class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.hourglass_empty_rounded,
            size: 56,
            color: AppTheme.textSecondary(context),
          ),
          SizedBox(height: AppTheme.spacingMedium),
          Text(
            'Coming Soon',
            style: AppTheme.titleLarge(context),
          ),
          SizedBox(height: AppTheme.spacingSmall),
          Text(
            'This feature is under development',
            style: AppTheme.bodySmall(context).copyWith(
              color: AppTheme.textSecondary(context),
            ),
          ),
        ],
      ),
    );
  }
}
