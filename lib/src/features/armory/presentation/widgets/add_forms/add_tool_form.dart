// lib/armory/presentation/widgets/add_forms/add_tool_form.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../../domain/entities/armory_tool.dart';
import '../../../domain/entities/dropdown_option.dart';
import '../../bloc/armory_bloc.dart';
import '../../bloc/armory_event.dart';
import '../../bloc/armory_state.dart';
import '../common/armory_constants.dart';
import '../common/dialog_widgets.dart';

class AddToolForm extends StatefulWidget {
  final String userId;
  final ArmoryTool? editItem;  // ADD

  const AddToolForm({super.key, required this.userId, this.editItem});  // UPDATE

  @override
  State<AddToolForm> createState() => _AddToolFormState();
}


class _AddToolFormState extends State<AddToolForm> {
  final _formKey = GlobalKey<FormState>();
  final _controllers = <String, TextEditingController>{};
  String? _category;

  bool get _isEditMode => widget.editItem != null;  // ADD

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    if (_isEditMode) {  // ADD
      _populateEditData();
    }
  }

  // ADD this method
  void _populateEditData() {
    final tool = widget.editItem!;

    _category = tool.category;
    _controllers['name']?.text = tool.name ?? '';
    _controllers['quantity']?.text = tool.quantity.toString();
    _controllers['notes']?.text = tool.notes ?? '';

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
  }
  void _initializeControllers() {
    final fields = ['name', 'quantity', 'notes'];
    for (final field in fields) {
      _controllers[field] = TextEditingController();
    }

    _controllers['quantity']?.text = '1';
  }

  @override
  void dispose() {
    _controllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ArmoryBloc, ArmoryState>(
      listener: (context, state) {
        if (state is ArmoryActionSuccess) {
          context.read<ArmoryBloc>().add(const HideFormEvent());
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(_isEditMode)
            DialogWidgets.buildHeader(
              context: context,
              title: 'Edit Tool',
              onClose: () {
                context.read<ArmoryBloc>().add(const HideFormEvent());
                Navigator.pop(context);
              },
            ),
          Flexible(child: _buildForm()),
          BlocBuilder<ArmoryBloc, ArmoryState>(
            builder: (context, state) {
              return _buildActions(state);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActions(ArmoryState state) {
    return Container(
      padding: const EdgeInsets.all(ArmoryConstants.dialogPadding),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppTheme.border(context))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              context.read<ArmoryBloc>().add(const HideFormEvent());
              if(_isEditMode)
              {
                Navigator.pop(context);
              }
            },
            child: const Text('Cancel'),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: state is ArmoryLoadingAction ? null : _saveTool,
            child: state is ArmoryLoadingAction
                ? SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppTheme.textPrimary(context),
              ),
            )
                : const Text('Save Tool'),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(ArmoryConstants.dialogPadding),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            DialogWidgets.buildTextField(
              context: context,
              label: 'Name *',
              controller: _controllers['name']!,
              isRequired: true,
              maxLength: 30,
              hintText: 'e.g., Wheeler FAT Wrench',
              enabled: !_isEditMode,  // ADD this line
            ),
            const SizedBox(height: ArmoryConstants.fieldSpacing),
            DialogWidgets.buildResponsiveRow(context, [
              DialogWidgets.buildDropdownField(
                context: context,
                label: 'Category',
                value: _category,
                options: const [
                  DropdownOption(value: 'cleaning', label: 'Cleaning'),
                  DropdownOption(value: 'maintenance', label: 'Maintenance'),
                  DropdownOption(value: 'measurement', label: 'Measurement'),
                  DropdownOption(value: 'reloading', label: 'Reloading'),
                  DropdownOption(value: 'safety', label: 'Safety'),
                ],
                onChanged: (value) => setState(() => _category = value),
              ),
              DialogWidgets.buildTextField(
                context: context,
                label: 'Quantity',
                controller: _controllers['quantity']!,
                keyboardType: TextInputType.number,
              ),
            ]),
            const SizedBox(height: ArmoryConstants.fieldSpacing),
            DialogWidgets.buildTextField(
              context: context,
              label: 'Notes',
              controller: _controllers['notes']!,
              maxLines: 3,
              maxLength: 200,
              hintText: 'Details about this tool',
            ),
          ],
        ),
      ),
    );
  }

  void _saveTool() {
    if (!_formKey.currentState!.validate()) return;

    final tool = ArmoryTool(
      id: _isEditMode ? widget.editItem!.id : null,
      name: _controllers['name']?.text.trim() ?? '',
      category: _category,
      quantity: int.tryParse(_controllers['quantity']?.text.trim() ?? '1') ?? 1,
      notes: _controllers['notes']?.text.trim(),
      dateAdded: _isEditMode ? widget.editItem!.dateAdded : DateTime.now(),
    );

    if (_isEditMode) {
      context.read<ArmoryBloc>().add(UpdateToolEvent(userId: widget.userId, tool: tool));
      Navigator.pop(context);

    } else {
      context.read<ArmoryBloc>().add(AddToolEvent(userId: widget.userId, tool: tool));
    }
  }
}
