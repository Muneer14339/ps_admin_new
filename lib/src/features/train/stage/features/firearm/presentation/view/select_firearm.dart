
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/services/local_storage_service/local_storage_service.dart';
import 'package:pa_sreens/src/core/services/locator/locator.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/widgets/custom_appbar.dart';
import 'package:pa_sreens/src/core/widgets/exit_save_button.dart';
import 'package:pa_sreens/src/core/widgets/pa_dropdown.dart';
import 'package:pa_sreens/src/core/widgets/train_background.dart';
import 'package:pa_sreens/src/features/train/stage/features/firearm/data/model/firearm_entity.dart';
import 'package:pa_sreens/src/features/train/stage/features/firearm/data/local/service/firearm_db_helper.dart';
import 'package:pa_sreens/src/features/train/stage/features/firearm/presentation/view/add_firearm.dart';
import 'package:pa_sreens/src/features/train/stage/data/model/stage_entity.dart';
import 'package:pa_sreens/src/features/train/stage/presentation/stage_bloc/stage_bloc.dart';

class SelectFirearmScreen extends StatefulWidget {
  final StageEntity stageEntity;
  const SelectFirearmScreen({super.key, required this.stageEntity});

  @override
  State<SelectFirearmScreen> createState() => _SelectFirearmScreenState();
}

class _SelectFirearmScreenState extends State<SelectFirearmScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late FirearmEntity firearm;
  @override
  void initState() {
    super.initState();
    firearm = FirearmEntity(
        type: widget.stageEntity.firearm?.type ?? '',
        brand: widget.stageEntity.firearm?.brand ?? '',
        model: widget.stageEntity.firearm?.model,
        generation: widget.stageEntity.firearm?.generation,
        caliber: widget.stageEntity.firearm?.caliber,
        firingMachanism: widget.stageEntity.firearm?.firingMachanism,
        ammoType: widget.stageEntity.firearm?.ammoType);
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TrainBackgroundPainter(context),
      child: Scaffold(
        appBar: appBarCustom(ctx: context, title: 'Firearm'),
        body: FutureBuilder<List<FirearmEntity>>(
            future: loadedArms
                ? null
                : FirearmDbHelper()
                    .geFirearms(locator<LocalStorageService>().userIdString),
            builder: (context, snap) {
              if (!snap.hasData ||
                  snap.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              } else {
                loadedArms = true;
                List<FirearmEntity> allFireArms = [];
                allFireArms = (snap.data ?? []).fold<List<FirearmEntity>>([],
                    (prev, element) {
                  if (!prev.any((e) => e.type == element.type)) {
                    prev.add(element);
                  }
                  return prev;
                });
                return BlocBuilder<StageBloc, StageState>(
                  builder: (context, state) {
                    return Form(
                      key: _formKey,
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 24.w),
                            child: Text(
                              'Select Weapon',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  // color: AppColors.blackTextColor,
                                  fontFamily: AppFontFamily.bold),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          PaDropdownGen<FirearmEntity>(
                            // key: UniqueKey(),
                            hint: 'Gun Type',
                            items: allFireArms,
                            getLabel: (p0) => p0.type ?? '',
                            initialValue: firearm,
                            showDelIcon: false,
                            onDelTap: (p0) {},
                            showSearch: true,
                            selectItemCall: (value) {
                              firearm.type = value.type ?? 'None';
                              firearm.brand = null;
                              firearm.model = null;
                              firearm.generation = null;
                              firearm.caliber = null;
                              firearm.firingMachanism = null;
                              firearm.ammoType = null;
                              context.read<StageBloc>().add(
                                  FireArmDropDownChangedEventGen(
                                      allItems: snap.data ?? [],
                                      firearmEntity: firearm));
                            },
                            selectedValue:
                                (state is FireArmDropDownChangedStateGen)
                                    ? state.firearmEntity
                                    : firearm,
                          ),
                          const SizedBox(height: 16),
                          PaDropdownGen<FirearmEntity>(
                            key: UniqueKey(),
                            isPreviousSelected: firearm.type == null,
                            hint: 'Brand',
                            fieldName: 'brand',
                            items: (state is FireArmDropDownChangedStateGen)
                                ? state.brandsList
                                : [],
                            getLabel: (p0) => p0.brand ?? '',
                            initialValue: firearm,
                            showDelIcon: false,
                            allowCustomItem: true,
                            onDelTap: (p0) {},
                            itemTapped: (p0) {
                              if (p0) {
                                print('non custom brand');
                                firearm.brandIsCustom = false;
                              }
                            },
                            selectItemCall: (value) {
                              firearm.brand = value.brand ?? 'None';
                              firearm.model = null;
                              firearm.generation = null;
                              firearm.caliber = null;
                              firearm.firingMachanism = null;
                              firearm.ammoType = null;
                              context.read<StageBloc>().add(
                                  FireArmDropDownChangedEventGen(
                                      allItems: snap.data ?? [],
                                      firearmEntity: firearm));
                            },
                            selectedValue:
                                (state is FireArmDropDownChangedStateGen)
                                    ? state.firearmEntity
                                    : firearm,
                          ),
                          const SizedBox(height: 16),
                          PaDropdownGen<FirearmEntity>(
                              key: UniqueKey(),
                              isPreviousSelected: firearm.brand == null,
                              hint: 'Model',
                              fieldName: 'model',
                              allowCustomItem: true,
                              items: (state is FireArmDropDownChangedStateGen)
                                  ? state.modelsListString.isEmpty
                                      ? []
                                      : state.modelsList
                                  : [],
                              getLabel: (p0) => p0.model ?? '',
                              initialValue: firearm,
                              showDelIcon: false,
                              onDelTap: (p0) {},
                              itemTapped: (p0) {
                                if (p0) {
                                  print('non custom model');
                                  firearm.modelIsCustom = false;
                                }
                              },
                              selectItemCall: (value) {
                                firearm.model = value.model ?? 'None';
                                firearm.generation = null;
                                firearm.caliber = null;
                                firearm.firingMachanism = null;
                                firearm.ammoType = null;
                                context.read<StageBloc>().add(
                                    FireArmDropDownChangedEventGen(
                                        allItems: snap.data ?? [],
                                        firearmEntity: firearm));
                              },
                              selectedValue:
                                  (state is FireArmDropDownChangedStateGen)
                                      ? state.firearmEntity
                                      : firearm),
                          const SizedBox(height: 16),
                          PaDropdownGen<FirearmEntity>(
                            key: UniqueKey(),
                            isPreviousSelected: firearm.model == null,
                            hint: 'Generation',
                            fieldName: 'generation',
                            allowCustomItem: true,
                            items: (state is FireArmDropDownChangedStateGen)
                                ? state.generationListString.isEmpty
                                    ? []
                                    : state.generationList
                                : [],
                            getLabel: (p0) => p0.generation ?? '',
                            initialValue: firearm,
                            showDelIcon: false,
                            onDelTap: (p0) {},
                            itemTapped: (p0) {
                              if (p0) {
                                print('non custom generation');
                                firearm.generationIsCustom = false;
                              }
                            },
                            selectItemCall: (value) {
                              firearm.generation = value.generation ?? 'None';
                              firearm.caliber = null;
                              firearm.firingMachanism = null;
                              firearm.ammoType = null;
                              context.read<StageBloc>().add(
                                  FireArmDropDownChangedEventGen(
                                      allItems: snap.data ?? [],
                                      firearmEntity: firearm));
                            },
                            selectedValue:
                                (state is FireArmDropDownChangedStateGen)
                                    ? state.firearmEntity
                                    : firearm,
                          ),
                          const SizedBox(height: 16),
                          // if (caliberList.isNotEmpty)
                          PaDropdownGen<FirearmEntity>(
                            key: UniqueKey(),
                            isPreviousSelected: firearm.generation == null,
                            hint: 'Caliber',
                            fieldName: 'caliber',
                            allowCustomItem: true,
                            items: (state is FireArmDropDownChangedStateGen)
                                ? state.caliberListString.isEmpty
                                    ? []
                                    : state.caliberList
                                : [],
                            getLabel: (p0) => p0.caliber ?? '',
                            initialValue: firearm,
                            showDelIcon: false,
                            onDelTap: (p0) {},
                            itemTapped: (p0) {
                              if (p0) {
                                print('non custom caliber');
                                firearm.caliberIsCustom = false;
                              }
                            },
                            selectItemCall: (value) {
                              firearm.caliber = value.caliber ?? 'None';
                              firearm.firingMachanism = null;
                              firearm.ammoType = null;
                              context.read<StageBloc>().add(
                                  FireArmDropDownChangedEventGen(
                                      allItems: snap.data ?? [],
                                      firearmEntity: firearm));
                            },
                            selectedValue:
                                (state is FireArmDropDownChangedStateGen)
                                    ? state.firearmEntity
                                    : firearm,
                          ),
                          const SizedBox(height: 16),
                          // if (firingMacList.isNotEmpty)
                          PaDropdownGen<FirearmEntity>(
                            key: UniqueKey(),
                            isPreviousSelected: firearm.caliber == null,
                            hint: 'Firing Mechanism',
                            fieldName: 'firing_machanism',
                            allowCustomItem: true,
                            items: (state is FireArmDropDownChangedStateGen)
                                ? state.firingMacListString.isEmpty
                                    ? []
                                    : state.firingMacList
                                : [],
                            getLabel: (p0) => p0.firingMachanism ?? '',
                            initialValue: firearm,
                            showDelIcon: false,
                            onDelTap: (p0) {},
                            itemTapped: (p0) {
                              if (p0) {
                                print('non custom Firing Mac');
                                firearm.firingMacIsCustom = false;
                              }
                            },
                            selectItemCall: (value) {
                              print(
                                  'value.firingMachanism --------------------------- ${value.firingMachanism}');
                              firearm.firingMachanism =
                                  value.firingMachanism ?? 'None';
                              firearm.ammoType = null;
                              context.read<StageBloc>().add(
                                  FireArmDropDownChangedEventGen(
                                      allItems: snap.data ?? [],
                                      firearmEntity: firearm));
                            },
                            selectedValue:
                                (state is FireArmDropDownChangedStateGen)
                                    ? state.firearmEntity
                                    : firearm,
                          ),
                          const SizedBox(height: 16),
                          // if (ammoTypeList.isNotEmpty)
                          PaDropdownGen<FirearmEntity>(
                            key: UniqueKey(),
                            isPreviousSelected: firearm.firingMachanism == null,
                            hint: 'Ammo Type',
                            fieldName: 'ammo_type',
                            allowCustomItem: true,
                            items: (state is FireArmDropDownChangedStateGen)
                                ? state.ammoTypeListString.isEmpty
                                    ? []
                                    : state.ammoTypeList
                                : [],
                            getLabel: (p0) => p0.ammoType ?? '',
                            initialValue: firearm,
                            showDelIcon: false,
                            onDelTap: (p0) {},
                            itemTapped: (p0) {
                              if (p0) {
                                print('non custom Ammo Type');
                                firearm.ammoTypeMacIsCustom = false;
                              }
                            },
                            selectItemCall: (value) {
                              firearm.ammoType = value.ammoType ?? 'None';
                              context.read<StageBloc>().add(
                                  FireArmDropDownChangedEventGen(
                                      allItems: snap.data ?? [],
                                      firearmEntity: firearm));
                            },
                            selectedValue:
                                (state is FireArmDropDownChangedStateGen)
                                    ? state.firearmEntity
                                    : firearm,
                          ),
                          SizedBox(height: 36.h),
                          Padding(
                            padding: EdgeInsets.only(right: 24.w),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: InkWell(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddFireArmScreen(
                                              stageEntity: widget.stageEntity,
                                            ))),
                                child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 10.h),
                                    decoration: BoxDecoration(
                                        color: AppColors.kPrimaryColor,
                                        borderRadius:
                                            BorderRadius.circular(100.w)),
                                    child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset('assets/icons/Vector.png',
                                              height: 16.h),
                                          SizedBox(width: 10.w),
                                          Text('Add New Weapon',
                                              style: TextStyle(
                                                  color: AppColors.white,
                                                  fontFamily:
                                                      AppFontFamily.regular))
                                        ])),
                              ),
                            ),
                          ),
                          SizedBox(height: 36.h),
                          ExitSaveButton(
                            firstButton: 'Exit',
                            onTapFirstButton: () => Navigator.pop(context),
                            secondButton: 'Save',
                            onTapSecondButton: () async {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pop(context);
                                widget.stageEntity.firearm = firearm;
                                BotToast.showLoading();
                                await FirearmDbHelper().updateFirearmInStage(
                                    locator<LocalStorageService>().userIdString,
                                    firearm);
                                BotToast.closeAllLoading();
                              }
                            },
                          ),
                          SizedBox(height: 54.h)
                        ],
                      ),
                    );
                  },
                );
              }
            }),
      ),
    );
  }

  bool loadedArms = false;
}
