// lib/armory/presentation/widgets/add_forms/add_gear_form.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../../domain/entities/armory_gear.dart';
import '../../../domain/entities/dropdown_option.dart';
import '../../bloc/armory_bloc.dart';
import '../../bloc/armory_event.dart';
import '../../bloc/armory_state.dart';
import '../common/armory_constants.dart';
import '../common/dialog_widgets.dart';

class AddGearForm extends StatefulWidget {
  final String userId;
  final ArmoryGear? editItem;  // ADD

  const AddGearForm({super.key, required this.userId, this.editItem});  // UPDATE

  @override
  State<AddGearForm> createState() => _AddGearFormState();
}

class _AddGearFormState extends State<AddGearForm> {
  final _formKey = GlobalKey<FormState>();
  final _controllers = <String, TextEditingController>{};
  String? _category;

  bool get _isEditMode => widget.editItem != null;  // ADD this line

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    if (_isEditMode) {  // ADD this block
      _populateEditData();
    }
  }

  void _populateEditData() {
    final gear = widget.editItem!;

    _category = gear.category;
    _controllers['model']?.text = gear.model ?? '';
    _controllers['serial']?.text = gear.serial ?? '';
    _controllers['quantity']?.text = gear.quantity.toString();
    _controllers['notes']?.text = gear.notes ?? '';

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
  }



  void _initializeControllers() {
    final fields = ['model', 'serial', 'quantity', 'notes'];
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
              title: 'Edit Gear',
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
            onPressed: state is ArmoryLoadingAction ? null : _saveGear,
            child: state is ArmoryLoadingAction
                ? SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppTheme.textPrimary(context),
              ),
            )
                : const Text('Save Gear'),
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
            DialogWidgets.buildDropdownField(
              context: context,
              label: 'Category *',
              value: _category,
              options: const [
                DropdownOption(value: 'optics', label: 'Optics'),
                DropdownOption(value: 'supports', label: 'Supports'),
                DropdownOption(value: 'attachments', label: 'Attachments'),
                DropdownOption(value: 'sensors', label: 'Sensors'),
                DropdownOption(value: 'misc', label: 'Miscellaneous'),
              ],
              onChanged: (value) => setState(() => _category = value),
              isRequired: true,
              enabled: !_isEditMode,  // ADD this line
            ),
            const SizedBox(height: ArmoryConstants.fieldSpacing),
            DialogWidgets.buildTextField(
              context: context,
              label: 'Model/Name *',
              controller: _controllers['model']!,
              isRequired: true,
              maxLength: 30,
              hintText: 'e.g., Vortex Razor HD',
              enabled: !_isEditMode,  // ADD this line
            ),
            const SizedBox(height: ArmoryConstants.fieldSpacing),
            DialogWidgets.buildResponsiveRow(context, [
              DialogWidgets.buildTextField(
                context: context,
                label: 'Serial Number',
                controller: _controllers['serial']!,
                maxLength: 20,
                hintText: 'Optional',
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
              hintText: 'Details about this gear',
            ),
          ],
        ),
      ),
    );
  }

  // Save method
  void _saveGear() {
    if (!_formKey.currentState!.validate()) return;

    final gear = ArmoryGear(
      id: _isEditMode ? widget.editItem!.id : null,
      category: _category!,
      model: _controllers['model']?.text.trim() ?? '',
      serial: _controllers['serial']?.text.trim(),
      quantity: int.tryParse(_controllers['quantity']?.text.trim() ?? '1') ?? 1,
      notes: _controllers['notes']?.text.trim(),
      dateAdded: _isEditMode ? widget.editItem!.dateAdded : DateTime.now(),
    );

    if (_isEditMode) {
      context.read<ArmoryBloc>().add(UpdateGearEvent(userId: widget.userId, gear: gear));
      Navigator.pop(context);

    } else {
      context.read<ArmoryBloc>().add(AddGearEvent(userId: widget.userId, gear: gear));
    }
  }
}
