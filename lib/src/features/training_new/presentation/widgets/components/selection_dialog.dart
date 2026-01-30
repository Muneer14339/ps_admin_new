import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';

class SelectionDialog<T> extends StatefulWidget {
  final String title;
  final List<T> items;
  final String Function(T) titleBuilder;
  final String Function(T)? subtitleBuilder;
  final IconData? icon; // default icon
  final IconData Function(T)? iconBuilder;
  final T? initiallySelected;
  final void Function(T) onSelect;

  const SelectionDialog({
    super.key,
    required this.title,
    required this.items,
    required this.titleBuilder,
    this.subtitleBuilder,
    this.icon,
    this.iconBuilder,
    this.initiallySelected,
    required this.onSelect,
  });

  @override
  State<SelectionDialog<T>> createState() => _SelectionDialogState<T>();
}

class _SelectionDialogState<T> extends State<SelectionDialog<T>> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = _findInitialSelectedIndex();
  }

  int _findInitialSelectedIndex() {
    if (widget.initiallySelected == null) return -1;
    
    // Try direct object comparison first
    final directIndex = widget.items.indexOf(widget.initiallySelected as T);
    if (directIndex != -1) return directIndex;
    
    // Fallback to title comparison
    return widget.items.indexWhere(
      (item) => widget.titleBuilder(item) == widget.titleBuilder(widget.initiallySelected!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppTheme.background(context),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary(context),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: AppTheme.textSecondary(context)),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const Divider(height: 24),

              // List of items
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: List.generate(widget.items.length, (i) {
                    final isSelected = _selectedIndex == i;
                    final item = widget.items[i];

                    return GestureDetector(
                      onTap: () => setState(() => _selectedIndex = i),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppTheme.primary(context).withOpacity(0.2)
                              : AppTheme.background(context),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isSelected
                                ? AppTheme.primary(context)
                                : AppTheme.primary(context).withOpacity(0.2),
                          ),
                          boxShadow: [
                            if (isSelected)
                              const BoxShadow(
                                color: Colors.black12,
                                blurRadius: 8,
                                offset: Offset(0, 3),
                              ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              widget.iconBuilder != null
                                  ? widget.iconBuilder!(item)
                                  : widget.icon ?? Icons.circle,
                              size: 28,
                              color: AppTheme.primary(context),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.titleBuilder(item),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppTheme.textPrimary(context),
                                    ),
                                  ),
                                  if (widget.subtitleBuilder != null) ...[
                                    const SizedBox(height: 4),
                                    Text(
                                      widget.subtitleBuilder!(item),
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: AppTheme.textSecondary(context),
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                            if (isSelected)
                              Icon(
                                Icons.check_circle,
                                color: AppTheme.primary(context),
                                size: 24,
                              ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),

              const SizedBox(height: 20),

              // Actions
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: TextButton.styleFrom(
                      foregroundColor: AppTheme.textSecondary(context),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _selectedIndex != -1 
                        ? () => _handleSelection(context)
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedIndex != -1 
                          ? AppTheme.primary(context)
                          : Colors.grey,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Select",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleSelection(BuildContext context) {
    if (_selectedIndex == -1) {
      _showErrorSnackbar(context, "No Selection", "Please choose an option first.");
      return;
    }

    final selectedItem = widget.items[_selectedIndex];
    
    // Call onSelect first, then close the dialog
    widget.onSelect(selectedItem);
    Navigator.of(context).pop();
  }

  void _showErrorSnackbar(BuildContext context, String title, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Text(message),
          ],
        ),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}