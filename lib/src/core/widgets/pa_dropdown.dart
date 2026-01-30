import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/gen/assets.gen.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/widgets/custom_textfield.dart';
import 'package:pa_sreens/src/core/widgets/dropdown_custom.dart';
import 'package:pa_sreens/src/core/widgets/smart_drop_down.dart';
import 'package:pa_sreens/src/core/utils/utils.dart';
import 'package:pa_sreens/src/features/train/stage/features/firearm/data/model/firearm_entity.dart';
import 'package:pa_sreens/src/features/train/stage/presentation/stage_cubit/satge_cubit.dart';
import 'package:pa_sreens/src/features/train/stage/presentation/component/stage_parts.dart';

import '../theme/theme_data/theme_data.dart';

class PaDropdown extends StatefulWidget {
  final List<String> items;
  final String initialValue;
  final String? hint;
  final bool allowCustomItem;
  final bool isStageSection;
  final String? stageTitle;
  final Widget? stageWidget;
  final bool showSearch;
  final Function(String)? selectItemCall;
  final String? selectedValue;
  final bool? isPreviousSelected;

  const PaDropdown({
    super.key,
    required this.items,
    this.hint,
    this.initialValue = '',
    this.stageTitle,
    this.stageWidget,
    this.allowCustomItem = false,
    this.isStageSection = false,
    required this.selectItemCall,
    this.selectedValue,
    this.showSearch = false, // Default to false
    this.isPreviousSelected,
  });

  @override
  State<PaDropdown> createState() => _PaDropdownState();
}

class _PaDropdownState extends State<PaDropdown> {
  final OverlayPortalController _controller = OverlayPortalController();
  //String? selectedValue;

  @override
  void initState() {
    super.initState();

    // selectedValue =
    //     widget.initialValue.isEmpty ? widget.items[0] : widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isPreviousSelected == true) {
          toast('Select above field first!');
        }
      },
      child: AbsorbPointer(
        absorbing: widget.isPreviousSelected == true,
        child: BlocProvider(
          create: (context) => DropDownCubit(widget.items),
          child: SmartDropdown(
            itemLength: widget.allowCustomItem
                ? widget.items.length + 1
                : widget.items.length,
            isStage: widget.isStageSection,
            controller:
                _controller, // we can use this overlay controller for further logic don't need on tap func
            buttonBuilder: (context, onTap, isOpen) {
              return widget.isStageSection
                  ? StageSection(
                      iconWidget: widget.stageWidget!,
                      title: widget.stageTitle!,
                      onTap: onTap,
                      isDropdown: true,
                      isDropDownOpen: isOpen,
                      selectionText: widget.selectedValue!,
                    )
                  : DropdownCustom(
                      controller:
                          TextEditingController(text: widget.selectedValue),
                      dropDownOpen: isOpen,
                      hint: widget.hint ?? '',
                      selectedValue: widget.selectedValue,
                      onTap: onTap,
                    );
            },
            menuBuilder: (context, toggleDropDown, width) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 26.w),
                child: MenuWidget(
                  width: width,
                  items: widget.items,

                  allowCustomItem: widget.allowCustomItem,
                  selectedItem: widget
                      .selectedValue, // this needs to update too with the button
                  onItemSelected: (value) {
                    toggleDropDown();
                    widget.selectItemCall!(value);
                    // setState(() {
                    //   selectedValue = value;
                    // });

                    // _controller.hide();
                  },
                  showSearch: widget.showSearch, // Pass the new parameter
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class MenuWidget extends StatefulWidget {
  const MenuWidget({
    super.key,
    this.width,
    required this.items,
    required this.onItemSelected,
    this.allowCustomItem = false,
    required this.selectedItem,
    this.hint,
    this.showSearch = false,
  });

  final double? width;
  final List<String> items;
  final Function(String) onItemSelected;
  final bool allowCustomItem;
  final String? selectedItem;
  final String? hint;
  final bool showSearch;

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  final TextEditingController _searchController = TextEditingController();
  // List<String> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    // _filteredItems = widget.items;
    if (widget.showSearch) {
      _searchController.addListener(_filterItems);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  void _filterItems() {
    final query = _searchController.text.toLowerCase();
    context.read<DropDownCubit>().filterItems(query);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(6.w, 6.h, 6.w, 0),
        decoration: ShapeDecoration(
          color: Theme.of(context).canvasColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Theme.of(context).hintColor),
            borderRadius: BorderRadius.circular(10.w),
          ),
          shadows: const [
            BoxShadow(
                color: Color.fromARGB(33, 0, 0, 0),
                blurRadius: 10,
                offset: Offset(0, 5),
                spreadRadius: 3)
          ],
        ),
        child: ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 200.h),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              if (widget.showSearch) ...[
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    child: CustomTextFieldOld(
                        hintText: 'Search...', controller: _searchController))
              ],
              Flexible(child:
                  Scrollbar(child: BlocBuilder<DropDownCubit, List<String>>(
                builder: (context, filteredItems) {
                  return ListView(shrinkWrap: true, children: [
                    ...filteredItems.map((item) => _DropdownItem(
                        isSelected: widget.selectedItem == item,
                        text: item,
                        onTap: () {
                          widget.onItemSelected(item);
                          _searchController.text = '';
                        })),
                    if (widget.allowCustomItem) ...[
                      _DropdownItem(
                          text: 'Add custom',
                          customColor: Theme.of(context).cardColor,
                          onTap: () {
                            _showCustomItemDialog(context);
                          })
                    ]
                  ]);
                },
              )))
            ])));
  }

  void _showCustomItemDialog(BuildContext context) {
    final TextEditingController customItemController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).canvasColor, //AppColors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Theme.of(context).highlightColor),
            borderRadius: BorderRadius.circular(6.w),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFieldOld(
                  labelText: 'Mount Location',
                  controller: customItemController),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 22.h, 0, 13.h),
                child: SizedBox(
                  width: double.infinity,
                  height: 40.h,
                  child: TextButton(
                    onPressed: () {
                      if (customItemController.text.isNotEmpty) {
                        widget.onItemSelected(customItemController.text);
                        Navigator.of(context).pop();
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                    ),
                    child: Text(
                      'Apply',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16.sp,
                        fontFamily: AppFontFamily.regular,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Back',
                  style: TextStyle(
                    color: AppColors.blackTextColor,
                    fontSize: 16.sp,
                    fontFamily: AppFontFamily.regular,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DropdownItem extends StatelessWidget {
  const _DropdownItem({
    required this.text,
    required this.onTap,
    this.isSelected = false,
    this.customColor,
  });
  final bool isSelected;
  final Color? customColor;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Material(
        color: customColor ??
            (isSelected
                ? AppColors.kPrimaryColor
                : Theme.of(context).cardColor),
        shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: Theme.of(context).canvasColor,
            ),
            borderRadius: BorderRadius.circular(6.w)),
        child: InkWell(
          borderRadius: BorderRadius.circular(6.w),
          onTap: onTap,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Text(
                text,
                style: TextStyle(
                  color: isSelected ? AppColors.white : null,
                  fontSize: 16.sp,
                  fontFamily: AppFontFamily.regular,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// -------------------------------- Generics

class PaDropdownGen<T> extends StatefulWidget {
  final List<T> items;
  final T initialValue;
  final String? hint;
  final bool allowCustomItem;
  final bool isStageSection;
  final String? stageTitle;
  final String? fieldName;
  final String? stageIcon;
  final bool showSearch;
  final Function(T)? selectItemCall;
  final T? selectedValue;
  final String Function(T) getLabel;
  final void Function(T) onDelTap;
  final void Function(bool)? itemTapped;
  final bool? isPreviousSelected;
  final bool? showDelIcon;
  final bool? noPadding;
  final double? menuHorizontalPadding;
  final ScrollController? scrollController;
  const PaDropdownGen({
    super.key,
    required this.items,
    this.hint,
    required this.initialValue,
    this.stageTitle,
    this.stageIcon,
    this.allowCustomItem = false,
    this.isStageSection = false,
    required this.selectItemCall,
    this.selectedValue,
    required this.getLabel,
    this.fieldName,
    this.showSearch = false, // Default to false
    this.isPreviousSelected = false,
    this.showDelIcon = false,
    this.noPadding = false,
    this.menuHorizontalPadding,
    this.scrollController,
    required this.onDelTap,
    this.itemTapped,
  });

  @override
  State<PaDropdownGen<T>> createState() => _PaDropdownGenState<T>();
}

class _PaDropdownGenState<T> extends State<PaDropdownGen<T>> {
  final OverlayPortalController _controller = OverlayPortalController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.isPreviousSelected == true) {
          toast('Select above field first!');
        } else if (widget.items.isEmpty) {
          toast('No items found');
        }
      },
      child: AbsorbPointer(
        absorbing: widget.isPreviousSelected == true || widget.items.isEmpty,
        child: BlocProvider(
          create: (context) =>
              DropDownCubitGen<T>(widget.items, widget.getLabel),
          child: SmartDropdown(
            itemLength: widget.items.length,
            isStage: widget.isStageSection,
            controller: _controller,
            scrollController: widget.scrollController,
            buttonBuilder: (context, onTap, isOpen) {
              return widget.isStageSection
                  ? StageSection(
                      iconWidget: Assets.icons.distance
                          .image(), //Image.asset('assets/icons/distance.png'),
                      title: widget.stageTitle ?? '',
                      onTap: onTap,
                      isDropdown: true,
                      isDropDownOpen: isOpen,
                      selectionText: widget.getLabel(widget.initialValue),
                    )
                  : DropdownCustom(
                      noPadding: widget.noPadding ?? false,
                      controller: TextEditingController(
                          text: widget.getLabel(
                              widget.selectedValue ?? widget.initialValue)),
                      dropDownOpen: isOpen,
                      hint: widget.hint ?? '',
                      selectedValue: widget.getLabel(widget.selectedValue ??
                          widget
                              .initialValue), //widget.selectedValue?.toString(),
                      onTap: onTap,
                    );
            },
            menuBuilder: (context, toggleDropDown, width) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: widget.menuHorizontalPadding ?? 26.w),
                child: MenuWidgetGen<T>(
                  width: width,
                  items: widget.items,
                  fieldName: widget.fieldName,
                  allowCustomItem: widget.allowCustomItem,
                  selectedItem: widget.selectedValue,
                  getLabel: widget.getLabel,
                  onDelTap: widget.onDelTap,
                  itemTapped: widget.itemTapped ?? (v) {},
                  showDelIcon: widget.showDelIcon ?? true,
                  onItemSelected: (value) {
                    toggleDropDown();
                    widget.selectItemCall?.call(value);
                  },
                  showSearch: widget.showSearch,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class MenuWidgetGen<T> extends StatefulWidget {
  const MenuWidgetGen({
    super.key,
    this.width,
    required this.items,
    required this.onItemSelected,
    this.allowCustomItem = false,
    required this.selectedItem,
    this.fieldName,
    this.hint,
    this.showSearch = false,
    this.showDelIcon = true,
    required this.getLabel,
    required this.onDelTap,
    required this.itemTapped,
  });

  final double? width;
  final List<T> items;
  final Function(T) onItemSelected;
  final bool allowCustomItem;
  final T? selectedItem;
  final String? hint;
  final String? fieldName;
  final bool showSearch;
  final bool showDelIcon;
  final String Function(T) getLabel;
  final void Function(T) onDelTap;
  final void Function(bool) itemTapped;

  @override
  State<MenuWidgetGen<T>> createState() => _MenuWidgetGenState<T>();
}

class _MenuWidgetGenState<T> extends State<MenuWidgetGen<T>> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.showSearch) {
      // _searchController.addListener(_filterItems);
    }
  }

  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _filterItems(BuildContext context) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      final query = _searchController.text.trim().toLowerCase();
      context.read<DropDownCubitGen<T>>().filterItems(query);
    });
  }

  // void _filterItems() {
  //   final query = _searchController.text.toLowerCase();
  //   context.read<DropDownCubitGen>().filterItems(query);
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: EdgeInsets.all(6),
      decoration: ShapeDecoration(
        color: AppTheme.background(context),

        shape: RoundedRectangleBorder(
            side: BorderSide(color: Theme.of(context).hintColor),
            borderRadius: BorderRadius.circular(10.w)),
        shadows: const [
          BoxShadow(
            color: Color.fromARGB(33, 0, 0, 0),
            blurRadius: 10,
            offset: Offset(0, 5),
            spreadRadius: 3,
          ),
        ],
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: widget.items.any(((p) => p == 'Male')) ? 100.h : 200.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.showSearch) ...[
              Padding(
                  padding: EdgeInsets.only(bottom: 6.h),
                  child: CustomTextFieldOld(
                      onChanged: (_) => _filterItems(context),
                      hintText: 'Search...',
                      controller: _searchController))
            ],
            Flexible(
              child: Scrollbar(
                child: BlocBuilder<DropDownCubitGen<T>, List<T>>(
                  builder: (context, filteredItems) {
                    return ListView(
                      shrinkWrap: true,
                      children: [
                        ...filteredItems.map((item) => _DropdownItemGen<T>(
                              isSelected: widget.selectedItem == item,
                              text: widget.getLabel(item),
                              onDelTap: widget.onDelTap,
                              showDelIcon: widget.showDelIcon,
                              item: item,
                              onTap: () {
                                widget.itemTapped(true);
                                widget.onItemSelected(item);
                                _searchController.text =
                                    ''; // to clear controller so search cubit can update state
                              },
                            )),
                        if (widget.allowCustomItem)
                          _DropdownItemGen(
                            text: 'Add custom',
                            customColor: AppColors.switchColor,
                            item: filteredItems.first,
                            onTap: () {
                              _showCustomItemDialog(
                                  context, widget.fieldName ?? '');
                            },
                            showDelIcon: widget.showDelIcon,
                            onDelTap: widget.onDelTap,
                          ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//   void _showCustomItemDialog(BuildContext context) {
//   final TextEditingController customItemController = TextEditingController();

//   showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         backgroundColor: AppColors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(6.w),
//         ),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             CustomTextField(hintText: '', controller: customItemController),
//             Padding(
//               padding: EdgeInsets.fromLTRB(0, 22.h, 0, 13.h),
//               child: SizedBox(
//                 width: double.infinity,
//                 height: 40.h,
//                 child: TextButton(
//                   onPressed: () {
//                     if (customItemController.text.isNotEmpty) {
//                       final newItem = _mapInputToType(customItemController.text);
//                       if (newItem != null) {
//                         widget.onItemSelected(newItem);
//                       }
//                       Navigator.of(context).pop();
//                     }
//                   },
//                   style: TextButton.styleFrom(
//                     backgroundColor: AppColors.kPrimaryColor,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.w),
//                     ),
//                   ),
//                   child: Text(
//                     'Apply',
//                     style: TextStyle(
//                       color: AppColors.white,
//                       fontSize: 16.sp,
//                       fontFamily: AppFontFamily.regular,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             InkWell(
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text(
//                 'Back',
//                 style: TextStyle(
//                   color: AppColors.blackTextColor,
//                   fontSize: 16.sp,
//                   fontFamily: AppFontFamily.regular,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }

  void _showCustomItemDialog(BuildContext context, String fieldName) {
    final TextEditingController customItemController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.w),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFieldOld(
                hintText: 'Enter custom value for $fieldName',
                controller: customItemController,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 22.h, 0, 13.h),
                child: SizedBox(
                  width: double.infinity,
                  height: 40.h,
                  child: TextButton(
                    onPressed: () {
                      if (customItemController.text.isNotEmpty) {
                        // Pass the custom value and the field name to update dynamically
                        final newItem = _createUpdatedModel(
                          fieldName,
                          customItemController.text,
                        );
                        if (newItem != null) {
                          log('new custom item ---- ${jsonEncode(newItem)}');
                          widget.onItemSelected(newItem);
                          widget.itemTapped(false);
                        }
                        Navigator.of(context).pop();
                      }
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: AppColors.kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.w),
                      ),
                    ),
                    child: Text(
                      'Apply',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 16.sp,
                        fontFamily: AppFontFamily.regular,
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Back',
                  style: TextStyle(
                    color: AppColors.blackTextColor,
                    fontSize: 16.sp,
                    fontFamily: AppFontFamily.regular,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  T? _mapInputToType(String input) {
    if (T == String) {
      return input as T; // Handle String input
    } else if (T == FirearmEntity) {
      return FirearmEntity(
        brand: input,
        addedByUser:
            1, // Optionally set a flag indicating it was added by the user
      ) as T;
    }
    return null; // Unsupported types
  }

  T? _createUpdatedModel(String? fieldName, String inputValue) {
    if (T == String) {
      // Simply return the inputValue if the type is String
      return inputValue as T;
    } else if (T == FirearmEntity && fieldName != null) {
      print('message--- $fieldName ---value ---$inputValue');
      final FirearmEntity existingModel = widget.selectedItem as FirearmEntity;
      existingModel.addedByUser = 1;
      final Map<String, dynamic> updatedJson = existingModel.toJson();
      updatedJson[fieldName] = inputValue;
      if (fieldName == 'ammo_type') {
        existingModel.ammoTypeMacIsCustom = true;
      } else if (fieldName == 'brand') {
        existingModel.brandIsCustom = true;
      } else if (fieldName == 'model') {
        existingModel.modelIsCustom = true;
      } else if (fieldName == 'generation') {
        existingModel.generationIsCustom = true;
      } else if (fieldName == 'caliber') {
        existingModel.caliberIsCustom = true;
      } else if (fieldName == 'firing_machanism') {
        existingModel.firingMacIsCustom = true;
      } else {}
      return FirearmEntity.fromJson(updatedJson) as T;
    }
    return null; // Return null for unsupported cases
  }
}

class _DropdownItemGen<T> extends StatelessWidget {
  const _DropdownItemGen({
    required this.text,
    required this.onTap,
    required this.onDelTap,
    this.showDelIcon = true,
    required this.item,
    this.isSelected = false,
    this.customColor,
  });

  final bool isSelected;
  final Color? customColor;
  final String text;
  final bool showDelIcon;
  final T item;
  final VoidCallback onTap;
  final void Function(T) onDelTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 6.h),
      child: Material(
        color: customColor ??
            (isSelected
                ? AppTheme.primary(context).withOpacity(0.5)
                : AppTheme.background(context)),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Theme.of(context).canvasColor,
          ),
          borderRadius: BorderRadius.circular(6.w),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(6.w),
          onTap: onTap,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: isSelected ? AppTheme.textPrimary(context)
                      :AppTheme.textSecondary(context),
                      fontSize: 16.sp,
                      fontFamily: AppFontFamily.regular,
                    ),
                  ),
                  if (showDelIcon)
                    InkWell(
                      onTap: () {
                        onDelTap(item);
                      },
                      child: Icon(
                        Icons.delete_outline,
                        color: AppColors.kRedColor,
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
