
import 'package:flutter/material.dart';

import '../theme/color/app_colors_new.dart';
import '../theme/font/app_fonts.dart';
import '../theme/theme_data/theme_data.dart';

class  GenericDialogCard extends StatelessWidget {
  const GenericDialogCard({super.key,
    required this.title,
    required this.content,
    this.icon,
    required this.okLabel,
    this.onOk,
  });

  final String title;
  final String content;
  final Widget? icon;
  final String okLabel;
  final VoidCallback? onOk;

  @override
  Widget build(BuildContext context) {
    // Colors from your theme
    final bg = AppTheme.background(context);
    final textPrimary = AppTheme.textPrimary(context);
    const textSecondary = Color(0xFFB0B3BA);
    TextSpan parseText(String text) {
      List<TextSpan> spans = [];
      RegExp exp = RegExp(r'(\*\*(.*?)\*\*)'); // Detects **bold text**
      Iterable<RegExpMatch> matches = exp.allMatches(text);

      int lastIndex = 0;
      for (RegExpMatch match in matches) {
        // Add normal text before bold match
        if (match.start > lastIndex) {
          spans.add(TextSpan(text: text.substring(lastIndex, match.start)));
        }
        // Add bold text
        spans.add(TextSpan(
          text: match.group(2), // Extracts the bold text inside ** **
          style: TextStyle(fontWeight: FontWeight.bold,color: AppTheme.textPrimary(context),),
        ));
        lastIndex = match.end;
      }

      // Add remaining text after the last match
      if (lastIndex < text.length) {
        spans.add(TextSpan(text: text.substring(lastIndex)));
      }

      return TextSpan(
          style: TextStyle(fontSize: 14, color: AppTheme.textPrimary(context), height: 1.6,),
          children: spans);
    }

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 560, // look good on tablets too
        maxHeight: MediaQuery.of(context).size.height * 0.60,
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 28, 24, 20),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(28),
          boxShadow: const [
            BoxShadow(
              blurRadius: 24, offset: Offset(0, 12), color: Color(0x66000000),
            ),
          ],
          border: const Border(
            top: BorderSide(width: 2, color: Color(0x33F6C86E)), // subtle top accent
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon badge (optional)
            if (icon != null)
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF2A1D1D), Color(0xFF1A1212)],
                  ),
                  border: Border.all(color: const Color(0x33FFFFFF)),
                ),
                alignment: Alignment.center,
                child: icon,
              ),
            if (icon != null) const SizedBox(height: 18),

            // Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textPrimary,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                height: 1.2,
                fontFamily: AppFontFamily.bold,
              ),
            ),
            const SizedBox(height: 12),

            // Body (scrolls only when needed)
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 8),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: parseText(content), // your existing parser
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Gradient OK button
            _GradientButton(
              label: okLabel,
              onTap: () {
                Navigator.of(context).pop();
                onOk?.call();
              },
            ),
          ],
        ),
      ),
    );
  }

}

class _GradientButton extends StatelessWidget {
  const _GradientButton({required this.label, this.onTap});
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 160, minHeight: 48),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFF6B04D), Color(0xFFE77B1A)],
              ),
              boxShadow: const [
                BoxShadow(blurRadius: 12, offset: Offset(0, 6), color: Color(0x55000000)),
              ],
            ),
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                  fontFamily: AppFontFamily.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}