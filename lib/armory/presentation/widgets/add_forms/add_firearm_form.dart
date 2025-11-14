// lib/armory/presentation/widgets/add_forms/add_firearm_form.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/validators/caliber_validator.dart';
import '../../../domain/entities/armory_firearm.dart';
import '../../../domain/entities/dropdown_option.dart';
import '../../bloc/armory_bloc.dart';
import '../../bloc/armory_event.dart';
import '../../bloc/armory_state.dart';
import '../../bloc/dropdown/dropdown_bloc.dart';
import '../../bloc/dropdown/dropdown_event.dart';
import '../../bloc/dropdown/dropdown_state.dart';
import '../common/armory_constants.dart';
import '../common/common_widgets.dart';
import '../common/dialog_widgets.dart';

class AddFirearmForm extends StatefulWidget {
  final String userId;
  final ArmoryFirearm? editItem;  // ADD

  const AddFirearmForm({super.key, required this.userId, this.editItem});  // UPDATE

  @override
  State<AddFirearmForm> createState() => _AddFirearmFormState();
}

class _AddFirearmFormState extends State<AddFirearmForm> {
  final _formKey = GlobalKey<FormState>();
  final _controllers = <String, TextEditingController>{};
  final _dropdownValues = <String, String?>{};
  final _errors = <String, String>{};

  // Initialize as empty mutable lists
  List<DropdownOption> _firearmBrands = [];
  List<DropdownOption> _firearmModels = [];
  List<DropdownOption> _firearmGenerations = [];
  List<DropdownOption> _firearmMakes = [];
  List<DropdownOption> _firearmMechanisms = [];
  List<DropdownOption> _calibers = [];

  // For multiple caliber selection
  List<String> _selectedCalibers = [];

  List<String> _originalCalibers = [];  // ADD - track original calibers
  bool get _isEditMode => widget.editItem != null;  // ADD

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    if (_isEditMode) {
      _populateEditData();  // ADD
    }
  }

  void _populateEditData() {
    final firearm = widget.editItem!;

    // Simple values - NO __CUSTOM__ prefix
    _dropdownValues['type'] = firearm.type;
    _dropdownValues['status'] = firearm.status;

    // Text controllers
    _controllers['nickname']?.text = firearm.nickname ?? '';
    _controllers['serial']?.text = firearm.serial ?? '';
    _controllers['notes']?.text = firearm.notes ?? '';

    // Parse calibers - Store as display values only
    final caliberList = firearm.caliber.split(',').map((c) => c.trim()).toList();
    _selectedCalibers = caliberList;
    _originalCalibers = List.from(_selectedCalibers);

    // Start cascading load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (firearm.type.isNotEmpty) {
        _loadBrandsForType(firearm.type);

        // Wait for brands to load then set brand
        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted && firearm.brand!.isNotEmpty) {
            // Check if brand exists in loaded options, otherwise mark as custom
            final brandExists = _firearmBrands.any((opt) => opt.value == firearm.brand);
            _dropdownValues['brand'] = brandExists ? firearm.brand : '__CUSTOM__${firearm.brand}';

            if (_dropdownValues['brand'] != null) {
              _loadModelsForBrand(_dropdownValues['brand']!);

              // Load model after brands loaded
              Future.delayed(const Duration(milliseconds: 300), () {
                if (mounted && firearm.model.isNotEmpty) {
                  final modelExists = _firearmModels.any((opt) => opt.value == firearm.model);
                  _dropdownValues['model'] = modelExists ? firearm.model : '__CUSTOM__${firearm.model}';

                  if (_dropdownValues['model'] != null) {
                    _loadGenerationsForModel(_dropdownValues['model']!);

                    // Load generation
                    Future.delayed(const Duration(milliseconds: 300), () {
                      if (mounted && firearm.generation?.isNotEmpty == true) {
                        final genExists = _firearmGenerations.any((opt) => opt.value == firearm.generation);
                        _dropdownValues['generation'] = genExists ? firearm.generation : '__CUSTOM__${firearm.generation}';

                        if (_dropdownValues['generation'] != null) {
                          _loadCalibersForGeneration(_dropdownValues['generation']!);
                        }
                      }
                    });
                  }
                }
              });
            }
          }
        });
      }

      // Load firing mechanism and make based on calibers
      if (_selectedCalibers.isNotEmpty) {
        _loadFiringMechanismsForCalibers();

        Future.delayed(const Duration(milliseconds: 400), () {
          if (mounted && firearm.firingMechanism?.isNotEmpty == true) {
            final mechExists = _firearmMechanisms.any((opt) => opt.value == firearm.firingMechanism);
            _dropdownValues['firingMechanism'] = mechExists ? firearm.firingMechanism : '__CUSTOM__${firearm.firingMechanism}';

            if (_dropdownValues['firingMechanism'] != null) {
              _loadMakesForSelection(_dropdownValues['firingMechanism']!);

              Future.delayed(const Duration(milliseconds: 300), () {
                if (mounted && firearm.make?.isNotEmpty == true) {
                  final makeExists = _firearmMakes.any((opt) => opt.value == firearm.make);
                  _dropdownValues['make'] = makeExists ? firearm.make : '__CUSTOM__${firearm.make}';
                  setState(() {});
                }
              });
            }
          }
        });
      }
    });
  }

  bool get _shouldUseGridLayout {
    final orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.landscape;
  }


  // REPLACE _loadBrandsForType method (line ~78)
  void _loadBrandsForType(String type) {
    setState(() {
      _firearmBrands = [];
      _firearmModels = [];
      _firearmGenerations = [];
      _firearmMakes = [];
      _firearmMechanisms = [];
      _calibers = [];
      _selectedCalibers = []; // Clear selected calibers
      _dropdownValues['brand'] = null;
      _dropdownValues['model'] = null;
      _dropdownValues['generation'] = null;
      _dropdownValues['make'] = null;
      _dropdownValues['firingMechanism'] = null;
    });

    context.read<DropdownBloc>().add(
      LoadDropdownEvent(
        key: 'firearm_brands',
        type: DropdownType.firearmBrands,
        filterValue: type,
      ),
    );
  }

// REPLACE _loadModelsForBrand method (line ~100)
  void _loadModelsForBrand(String brand) {
    setState(() {
      _firearmModels = [];
      _firearmGenerations = [];
      _calibers = [];
      _firearmMechanisms = [];
      _firearmMakes = [];
      _selectedCalibers = []; // Clear selected calibers
      _dropdownValues['model'] = null;
      _dropdownValues['generation'] = null;
      _dropdownValues['firingMechanism'] = null;
      _dropdownValues['make'] = null;
    });

    final filterBrand = DialogWidgets.isCustomValue(brand) ? '' : brand;

    context.read<DropdownBloc>().add(
      LoadDropdownEvent(
        key: 'firearm_models',
        type: DropdownType.firearmModels,
        filterValue: filterBrand,
      ),
    );

    // Load calibers for brand
    context.read<DropdownBloc>().add(
      LoadDropdownEvent(
        key: 'firearm_calibers',
        type: DropdownType.calibers,
        filterValue: filterBrand,
      ),
    );
  }

// REPLACE _loadGenerationsForModel method (line ~130)
  void _loadGenerationsForModel(String model) {
    setState(() {
      _firearmGenerations = [];
      _calibers = [];
      _firearmMechanisms = [];
      _firearmMakes = [];
      _selectedCalibers = []; // Clear selected calibers
      _dropdownValues['generation'] = null;
      _dropdownValues['firingMechanism'] = null;
      _dropdownValues['make'] = null;
    });

    final filterModel = DialogWidgets.isCustomValue(model) ? '' : model;

    context.read<DropdownBloc>().add(
      LoadDropdownEvent(
        key: 'firearm_generations',
        type: DropdownType.firearmGenerations,
        filterValue: filterModel,
      ),
    );

    // Load calibers for model
    context.read<DropdownBloc>().add(
      LoadDropdownEvent(
        key: 'firearm_calibers',
        type: DropdownType.calibers,
        filterValue: filterModel,
      ),
    );
  }

// REPLACE _loadCalibersForGeneration method (line ~160)
  void _loadCalibersForGeneration(String generation) {
    setState(() {
      _calibers = [];
      _firearmMechanisms = [];
      _firearmMakes = [];
      _selectedCalibers = []; // Clear selected calibers
      _dropdownValues['firingMechanism'] = null;
      _dropdownValues['make'] = null;
    });

    final filterGeneration = DialogWidgets.isCustomValue(generation) ? '' : generation;
    context.read<DropdownBloc>().add(
      LoadDropdownEvent(
        key: 'firearm_calibers',
        type: DropdownType.calibers,
        filterValue: filterGeneration,
      ),
    );
  }

  void _onBrandChanged(String? value) {
    setState(() => _dropdownValues['brand'] = value);
    if (value != null) {
      _loadModelsForBrand(value);
    }
  }

  void _onModelChanged(String? value) {
    setState(() => _dropdownValues['model'] = value);
    if (value != null) {
      _loadGenerationsForModel(value);
    }
  }

  void _onGenerationChanged(String? value) {
    setState(() => _dropdownValues['generation'] = value);
    if (value != null) {
      _loadCalibersForGeneration(value);
    }
  }

  void _onCaliberSelected(String? caliber) {
    if (caliber == null || _selectedCalibers.contains(caliber)) return;

    final displayValue = DialogWidgets.isCustomValue(caliber)
        ? DialogWidgets.extractCustomValue(caliber)
        : caliber;

    setState(() {
      _selectedCalibers.add(displayValue);
    });
    _loadFiringMechanismsForCalibers();
  }

// MODIFY _onCaliberRemoved
  void _onCaliberRemoved(String caliber) async {
    // Check if this was an original caliber
    if (_isEditMode && _originalCalibers.contains(caliber)) {
      final state = context.read<ArmoryBloc>().state;
      if (state is! ArmoryDataLoaded) return;

      // Check if any other firearm has this caliber
      final otherFirearmsWithCaliber = state.firearms.where((f) {
        if (f.id == widget.editItem!.id) return false;
        final fCalibers = f.caliber.split(',').map((c) => c.trim().toLowerCase()).toList();
        return fCalibers.contains(caliber.toLowerCase());
      }).toList();

      if (otherFirearmsWithCaliber.isEmpty) {
        // Find dependent ammo and loadouts
        final dependentAmmo = state.ammunition.where(
                (a) => a.caliber.toLowerCase() == caliber.toLowerCase()
        ).toList();

        final dependentLoadouts = state.loadouts.where((l) =>
        l.firearmId == widget.editItem!.id
        ).toList();

        if (dependentAmmo.isNotEmpty || dependentLoadouts.isNotEmpty) {
          final confirmed = await _showCaliberRemovalDialog(
              caliber, dependentAmmo.length, dependentLoadouts.length
          );

          if (!confirmed) return;
        }
      }
    }

    setState(() {
      _selectedCalibers.remove(caliber);
    });

    if (_selectedCalibers.isNotEmpty) {
      _loadFiringMechanismsForCalibers();
    } else {
      setState(() {
        _firearmMechanisms = [];
        _firearmMakes = [];
        _dropdownValues['firingMechanism'] = null;
        _dropdownValues['make'] = null;
      });
    }
  }

  // ADD confirmation dialog
  Future<bool> _showCaliberRemovalDialog(String caliber, int ammoCount, int loadoutCount) async {
    return await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppTheme.surface(context),
        title: Text('Remove Caliber', style: AppTheme.headingSmall(context)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Removing "$caliber" will delete:', style: AppTheme.bodyMedium(context)),
            const SizedBox(height: 12),
            if (ammoCount > 0)
              Text('• $ammoCount Ammunition lot(s)', style: AppTheme.bodySmall(context)),
            if (loadoutCount > 0)
              Text('• $loadoutCount Loadout(s)', style: AppTheme.bodySmall(context)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text('Remove', style: TextStyle(color: AppTheme.error(context))),
          ),
        ],
      ),
    ) ?? false;
  }

  void _loadFiringMechanismsForCalibers() {
    if (_selectedCalibers.isEmpty) return;

    setState(() {
      _firearmMechanisms = [];
      _firearmMakes = [];
      _dropdownValues['firingMechanism'] = null;
      _dropdownValues['make'] = null;
    });

    // Use plain caliber values (no __CUSTOM__ prefix needed)
    final caliberString = _selectedCalibers.join(',');

    context.read<DropdownBloc>().add(
      LoadDropdownEvent(
        key: 'firearm_mechanisms',
        type: DropdownType.firearmFiringMechanisms,
        filterValue: caliberString,
      ),
    );
  }

  void _onFiringMechanismChanged(String? value) {
    setState(() => _dropdownValues['firingMechanism'] = value);
    if (value != null) {
      _loadMakesForSelection(value);
    }
  }

  void _loadMakesForSelection(String firingMechanism) {
    setState(() {
      _firearmMakes = [];
      _dropdownValues['make'] = null;
    });

    final filterMechanism = DialogWidgets.isCustomValue(firingMechanism) ? '' : firingMechanism;
    context.read<DropdownBloc>().add(
      LoadDropdownEvent(
        key: 'firearm_makes',
        type: DropdownType.firearmMakes,
        filterValue: filterMechanism,
      ),
    );
  }

  void _initializeControllers() {
    final fields = ['make', 'model', 'nickname', 'serial', 'notes'];
    for (final field in fields) {
      _controllers[field] = TextEditingController();
    }

    _dropdownValues['status'] = 'available';
    _dropdownValues['condition'] = 'good';
  }

  void _handleDropdownOptionsLoaded(String key, List<DropdownOption> options) {
    setState(() {
      switch (key) {
        case 'firearm_brands':
          _firearmBrands = options;
          break;
        case 'firearm_models':
          _firearmModels = options;
          break;
        case 'firearm_generations':
          _firearmGenerations = options;
          break;
        case 'firearm_calibers':
          _calibers = options;
          break;
        case 'firearm_mechanisms':
          _firearmMechanisms = options;
          break;
        case 'firearm_makes':
          _firearmMakes = options;
          break;
      }
    });
  }

  @override
  void dispose() {
    _controllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }

  // BUILD METHOD - SAME AS BEFORE with caliber section updated
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<DropdownBloc, DropdownState>(
          listener: (context, state) {
            if (state is DropdownLoaded) {
              _handleDropdownOptionsLoaded(state.key, state.options);
            }
          },
        ),
        BlocListener<ArmoryBloc, ArmoryState>(
          listener: (context, state) {
            if (state is ArmoryActionSuccess) {
              context.read<ArmoryBloc>().add(const HideFormEvent());
            }
          },
        ),
      ],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(_isEditMode)
            DialogWidgets.buildHeader(
              context: context,
              title: 'Edit Firearm',
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
            onPressed: state is ArmoryLoadingAction ? null : _saveFirearm,
            child: state is ArmoryLoadingAction
                ? SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppTheme.textPrimary(context),
              ),
            )
                : const Text('Save Firearm'),
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
        child: CommonWidgets.buildResponsiveLayout(context, [
          // Type dropdown
          DialogWidgets.buildDropdownField(
            context: context,
            label: 'Firearm Type *',
            value: _dropdownValues['type'],
            options: const [
              DropdownOption(value: 'Rifle', label: 'Rifle'),
              DropdownOption(value: 'Pistol', label: 'Pistol'),
              DropdownOption(value: 'Revolver', label: 'Revolver'),
              DropdownOption(value: 'Shotgun', label: 'Shotgun'),
            ],
            onChanged: (value) {
              setState(() => _dropdownValues['type'] = value);
              if (value != null) _loadBrandsForType(value);
            },
            isRequired: true,
            enabled: !_isEditMode,  // ADD this line
          ),

          // Brand dropdown
          BlocBuilder<DropdownBloc, DropdownState>(
            builder: (context, dropdownState) {
              final isLoading = dropdownState is DropdownLoading &&
                  dropdownState.loadingKey == 'firearm_brands';
              return DialogWidgets.buildDropdownFieldWithCustom(
                context: context,
                label: 'Brand *',
                value: _dropdownValues['brand'],
                options: _firearmBrands,
                onChanged: _onBrandChanged,
                customFieldLabel: 'Brand',
                customHintText: 'e.g., Custom Manufacturer',
                isRequired: true,
                isLoading: isLoading,
                enabled: _dropdownValues['type'] != null,
              );
            },
          ),

          // Model dropdown (optional)
          BlocBuilder<DropdownBloc, DropdownState>(
            builder: (context, dropdownState) {
              final isLoading = dropdownState is DropdownLoading &&
                  dropdownState.loadingKey == 'firearm_models';
              return DialogWidgets.buildDropdownFieldWithCustom(
                context: context,
                label: 'Model',
                value: _dropdownValues['model'],
                options: _firearmModels,
                onChanged: _onModelChanged,
                customFieldLabel: 'Model',
                customHintText: 'e.g., Custom Model Name',
                isRequired: false,
                isLoading: isLoading,
                enabled: _dropdownValues['brand'] != null,
              );
            },
          ),

          // Generation dropdown (optional)
          BlocBuilder<DropdownBloc, DropdownState>(
            builder: (context, dropdownState) {
              final isLoading = dropdownState is DropdownLoading &&
                  dropdownState.loadingKey == 'firearm_generations';
              return DialogWidgets.buildDropdownFieldWithCustom(
                context: context,
                label: 'Generation',
                value: _dropdownValues['generation'],
                options: _firearmGenerations,
                onChanged: _onGenerationChanged,
                customFieldLabel: 'Generation',
                customHintText: 'e.g., Gen 5, Mk II',
                isLoading: isLoading,
                enabled: _dropdownValues['model'] != null,
                isRequired: false,
              );
            },
          ),

          // Calibers dropdown with chips
          BlocBuilder<DropdownBloc, DropdownState>(
            builder: (context, dropdownState) {
              final isLoading = dropdownState is DropdownLoading &&
                  dropdownState.loadingKey == 'firearm_calibers';
              final showCaliber = _dropdownValues['brand'] != null;
// 👇 NEW: Unique key jo brand/model/generation change par dropdown reset karega
              final caliberKey = '${_dropdownValues['brand']}_${_dropdownValues['model']}_${_dropdownValues['generation']}';

              return Column(
                key: ValueKey(caliberKey), // 👈 CRITICAL: Yeh line add karo
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DialogWidgets.buildDropdownFieldWithCustom(
                    context: context,
                    label: 'Calibers *',
                    value: null,
                    options: _calibers,
                    onChanged: _onCaliberSelected,
                    customFieldLabel: 'Caliber',
                    customHintText: 'e.g., .300 WinMag',
                    isRequired: false,
                    isLoading: isLoading,
                    keepSearchable: true,
                    enabled: showCaliber,
                    customValueFormatter: (customValue) {
                      final firearmType = _dropdownValues['type'];
                      if (firearmType != null && firearmType.isNotEmpty) {
                        return '$customValue ($firearmType)';
                      }
                      return customValue;
                    },
                    validator: (value) => CaliberValidator.validate(value),
                  ),
                  if (_selectedCalibers.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _selectedCalibers.map((caliber) {
                        return Chip(
                          label: Text(
                            DialogWidgets.getDisplayValue(caliber),
                            style: AppTheme.labelMedium(context).copyWith(fontSize: 13),
                          ),
                          backgroundColor: AppTheme.surfaceVariant(context),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: AppTheme.border(context)),
                          ),
                          deleteIcon: Icon(Icons.close, size: 18, color: AppTheme.textSecondary(context)),
                          onDeleted: () => _onCaliberRemoved(caliber),
                        );
                      }).toList(),
                    ),
                  ],
                ],
              );
            },
          ),

          // Firing Mechanism dropdown
          BlocBuilder<DropdownBloc, DropdownState>(
            builder: (context, dropdownState) {
              final isLoading = dropdownState is DropdownLoading &&
                  dropdownState.loadingKey == 'firearm_mechanisms';
              return DialogWidgets.buildDropdownFieldWithCustom(
                context: context,
                label: 'Firing Mechanism',
                value: _dropdownValues['firingMechanism'],
                options: _firearmMechanisms,
                onChanged: _onFiringMechanismChanged,
                customFieldLabel: 'Firing Mechanism',
                customHintText: 'e.g., Custom Action',
                isLoading: isLoading,
                enabled: _selectedCalibers.isNotEmpty,
              );
            },
          ),

          // Make dropdown
          BlocBuilder<DropdownBloc, DropdownState>(
            builder: (context, dropdownState) {
              final isLoading = dropdownState is DropdownLoading &&
                  dropdownState.loadingKey == 'firearm_makes';
              return DialogWidgets.buildDropdownFieldWithCustom(
                context: context,
                label: 'Make',
                value: _dropdownValues['make'],
                options: _firearmMakes,
                onChanged: (value) => setState(() => _dropdownValues['make'] = value),
                customFieldLabel: 'Make',
                customHintText: 'e.g., Custom Make',
                isLoading: isLoading,
                enabled: _dropdownValues['firingMechanism'] != null,
              );
            },
          ),

          DialogWidgets.buildTextField(
            context: context,
            label: 'Nickname/Identifier *',
            controller: _controllers['nickname']!,
            isRequired: true,
            maxLength: 20,
            enabled: !_isEditMode,  // ADD this line
          ),

          DialogWidgets.buildDropdownField(
            context: context,
            label: 'Status',
            value: _dropdownValues['status'],
            options: const [
              DropdownOption(value: 'available', label: 'Available'),
              DropdownOption(value: 'in-use', label: 'In Use'),
              DropdownOption(value: 'maintenance', label: 'Maintenance'),
            ],
            onChanged: (value) => setState(() => _dropdownValues['status'] = value),
            isRequired: true,
          ),

          DialogWidgets.buildTextField(
            context: context,
            label: 'Serial Number',
            controller: _controllers['serial']!,
            maxLength: 20,
          ),

          _shouldUseGridLayout
              ? SizedBox(
            width: double.infinity,
            child: DialogWidgets.buildTextField(
              context: context,
              label: 'Notes',
              controller: _controllers['notes']!,
              maxLines: 3,
              maxLength: 200,
              hintText: 'Purpose, setup, special considerations, etc.',
            ),
          )
              : DialogWidgets.buildTextField(
            context: context,
            label: 'Notes',
            controller: _controllers['notes']!,
            maxLines: 3,
            maxLength: 200,
            hintText: 'Purpose, setup, special considerations, etc.',
          ),
        ], _shouldUseGridLayout),
      ),
    );
  }

  void _saveFirearm() {
    if (!_formKey.currentState!.validate()) return;

    bool hasErrors = false;
    final requiredDropdowns = {
      'type': 'Firearm type is required',
      'brand': 'Brand is required',
      'status': 'Status is required',
    };

    requiredDropdowns.forEach((field, errorMessage) {
      if (_dropdownValues[field] == null) {
        setState(() => _errors[field] = errorMessage);
        hasErrors = true;
      }
    });

    if (_selectedCalibers.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('At least one caliber is required'),
          backgroundColor: AppTheme.error(context),
        ),
      );
      return;
    }

    final nickname = _controllers['nickname']?.text.trim() ?? '';
    if (nickname.isEmpty) {
      setState(() => _errors['nickname'] = 'Nickname is required');
      hasErrors = true;
    }

    if (hasErrors) return;

    final firearm = ArmoryFirearm(
      id: _isEditMode ? widget.editItem!.id : null,
      type: _dropdownValues['type']!,
      make: DialogWidgets.getDisplayValue(_dropdownValues['make']),
      model: _dropdownValues['model'] != null
          ? DialogWidgets.getDisplayValue(_dropdownValues['model'])
          : '',
      caliber: _selectedCalibers.join(', '),  // Direct join
      nickname: nickname,
      status: _dropdownValues['status']!,
      serial: _controllers['serial']?.text.trim(),
      notes: _controllers['notes']?.text.trim(),
      brand: DialogWidgets.getDisplayValue(_dropdownValues['brand']),
      generation: _dropdownValues['generation'] != null
          ? DialogWidgets.getDisplayValue(_dropdownValues['generation'])
          : '',
      firingMechanism: DialogWidgets.getDisplayValue(_dropdownValues['firingMechanism']),
      dateAdded: _isEditMode ? widget.editItem!.dateAdded : DateTime.now(),
    );

    if (_isEditMode) {
      // Check removed calibers
      final removedCalibers = _originalCalibers
          .where((c) => !_selectedCalibers.contains(c))
          .toList();

      if (removedCalibers.isNotEmpty) {
        final state = context.read<ArmoryBloc>().state;
        if (state is ArmoryDataLoaded) {
          final dependentAmmoIds = <String>[];
          final dependentLoadoutIds = <String>[];

          for (final cal in removedCalibers) {
            final ammo = state.ammunition.where(
                    (a) => a.caliber.toLowerCase() == cal.toLowerCase()
            );
            dependentAmmoIds.addAll(ammo.map((a) => a.id!));
          }

          final loadouts = state.loadouts.where((l) => l.firearmId == widget.editItem!.id);
          dependentLoadoutIds.addAll(loadouts.map((l) => l.id!));

          context.read<ArmoryBloc>().add(UpdateFirearmWithDependenciesEvent(
            userId: widget.userId,
            firearm: firearm,
            removedCalibers: removedCalibers,
            dependentLoadoutIds: dependentLoadoutIds.toSet().toList(),
            dependentAmmunitionIds: dependentAmmoIds.toSet().toList(),
          ));
        }
      } else {
        context.read<ArmoryBloc>().add(UpdateFirearmEvent(userId: widget.userId, firearm: firearm));
      }
    } else {
      context.read<ArmoryBloc>().add(AddFirearmEvent(userId: widget.userId, firearm: firearm));
    }
  }
}