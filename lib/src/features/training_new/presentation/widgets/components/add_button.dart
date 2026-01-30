import 'package:flutter/material.dart';

import '../../../../../core/theme/theme_data/theme_data.dart';


class AddButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;


  const AddButton({
    super.key,
    required this.onPressed,
    this.text = 'Add',
   
  });

  @override
  Widget build(BuildContext context) {

    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.add, size: 20),
      label: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppTheme.textPrimary(context),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primary(context),
        foregroundColor: AppTheme.textPrimary(context),
        elevation: 2,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}