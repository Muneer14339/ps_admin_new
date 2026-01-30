// session_card.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/color/app_colors_new.dart';
import '../../../train/session/data/model/save_session_model.dart';
import '../view/session_detail_view.dart';

class SessionCard extends StatelessWidget {
  final SaveSessionModel session;
  final VoidCallback? onDelete;

  const SessionCard({
    super.key,
    required this.session,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: AppColors.lightGry,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SessionDetailView(session: session),
            ),
          );
        },
        onLongPress: onDelete,
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Session #${session.sessionId ?? 'N/A'}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.kPrimaryColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.kPrimaryColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${session.playedShots ?? 0} shots',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: AppColors.kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Drill Name
                  Text(
                    session.saveStageEntity?.drill?.drill?.name ?? 'No drill',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const Spacer(),

                  // Session Date and Arrow
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          _formatDate(session.dateTime),
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.white.withOpacity(0.6),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: AppColors.kPrimaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Delete button
            // if (onDelete != null)
            //   Positioned(
            //     top: 4,
            //     right: 4,
            //     child: IconButton(
            //       icon: const Icon(Icons.close, size: 18),
            //       onPressed: onDelete,
            //       padding: EdgeInsets.zero,
            //       constraints: const BoxConstraints(),
            //       color: Colors.grey[600],
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }

  String _formatDate(String? dateTime) {
    if (dateTime == null || dateTime.isEmpty) return 'No date';

    try {
      final date = DateTime.parse(dateTime);
      return DateFormat('MMM dd, yyyy').format(date);
    } catch (e) {
      // If parsing fails, try the format we're using
      try {
        final date = DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateTime);
        return DateFormat('MMM dd, yyyy').format(date);
      } catch (e) {
        return dateTime;
      }
    }
  }
}