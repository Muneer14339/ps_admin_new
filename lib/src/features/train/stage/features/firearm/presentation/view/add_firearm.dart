import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/services/local_storage_service/local_storage_service.dart';
import 'package:pa_sreens/src/core/services/locator/locator.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/widgets/custom_appbar.dart';
import 'package:pa_sreens/src/core/widgets/custom_textfield.dart';
import 'package:pa_sreens/src/core/widgets/exit_save_button.dart';
import 'package:pa_sreens/src/core/widgets/train_background.dart';
import 'package:pa_sreens/src/features/train/stage/features/firearm/data/local/service/firearm_db_helper.dart';
import 'package:pa_sreens/src/features/train/stage/features/firearm/data/model/firearm_entity.dart';
import 'package:pa_sreens/src/features/train/stage/data/model/stage_entity.dart';
import 'package:pa_sreens/src/features/train/stage/presentation/stage_bloc/stage_bloc.dart';
import 'package:pa_sreens/src/features/train/stage/presentation/stage_cubit/satge_cubit.dart';

class AddFireArmScreen extends StatefulWidget {
  const AddFireArmScreen({required this.stageEntity, super.key});
  final StageEntity stageEntity;

  @override
  State<AddFireArmScreen> createState() => _AddFireArmScreenState();
}

class _AddFireArmScreenState extends State<AddFireArmScreen> {
  TextEditingController gunTypeController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController generationController = TextEditingController();
  TextEditingController caliberController = TextEditingController();
  TextEditingController firingMechController = TextEditingController();
  TextEditingController ammoTypeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isAutoValidate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom(ctx: context, title: 'Firearm'),
      body: CustomPaint(
        painter: TrainBackgroundPainter(context),
        child: BlocProvider(
          create: (context) => AutoValidationCubit(),
          child: BlocBuilder<AutoValidationCubit, bool>(
            builder: (context, state) {
              isAutoValidate = state;
              return Form(
                autovalidateMode:
                    state ? AutovalidateMode.always : AutovalidateMode.disabled,
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Add new weapon',
                            style: TextStyle(
                                fontSize: 18.sp,
                                // color: AppColors.blackTextColor,
                                fontFamily: AppFontFamily.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFieldOld(
                        labelText: 'Gun Type',
                        isRequired: true,
                        controller: gunTypeController,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFieldOld(
                        isRequired: true,
                        labelText: 'Brand',
                        controller: brandController,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFieldOld(
                        labelText: 'Model',
                        controller: modelController,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFieldOld(
                        labelText: 'Generation/variant',
                        controller: generationController,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFieldOld(
                        labelText: 'Caliber',
                        controller: caliberController,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFieldOld(
                        labelText: 'Firing Mechanism',
                        controller: firingMechController,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      CustomTextFieldOld(
                        labelText: 'Ammo Type',
                        controller: ammoTypeController,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      ExitSaveButton(
                        firstButton: 'Exit',
                        onTapFirstButton: () => Navigator.pop(context),
                        secondButton: 'Save',
                        onTapSecondButton: () async {
                          if (_formKey.currentState!.validate()) {
                            FirearmEntity firearmEntity = FirearmEntity(
                                type: gunTypeController.text,
                                brand: brandController.text,
                                model: modelController.text,
                                generation: generationController.text,
                                caliber: caliberController.text,
                                firingMachanism: firingMechController.text,
                                ammoType: ammoTypeController.text);
                            BotToast.showLoading();
                            FirearmEntity? entity = await FirearmDbHelper()
                                .addNewFirearm(
                                    locator<LocalStorageService>().userIdString,
                                    firearmEntity);
                            BotToast.closeAllLoading();
                            widget.stageEntity.firearm = entity;
                            if (context.mounted) {
                              context.read<StageBloc>().add(StageUpdateEvent(
                                  stageEntity: widget.stageEntity
                                      .copyWith(firearm: entity)));
                              Navigator.pop(context);
                              Navigator.pop(context);
                            }
                          } else {
                            !isAutoValidate
                                ? context
                                    .read<AutoValidationCubit>()
                                    .enableAuto()
                                : '';
                          }
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
