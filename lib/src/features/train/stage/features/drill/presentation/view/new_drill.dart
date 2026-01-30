import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pa_sreens/src/core/services/locator/locator.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/widgets/custom_appbar.dart';
import 'package:pa_sreens/src/core/widgets/custom_textfield.dart';
import 'package:pa_sreens/src/core/widgets/exit_save_button.dart';
import 'package:pa_sreens/src/core/widgets/pa_dropdown.dart';
import 'package:pa_sreens/src/core/widgets/train_background.dart';
import 'package:pa_sreens/src/features/train/stage/features/drill/data/model/drills_entity.dart';
import 'package:pa_sreens/src/features/train/stage/features/partime/view/partime_view.dart';
import 'package:pa_sreens/src/features/train/stage/data/model/stage_entity.dart';
import 'package:pa_sreens/src/features/train/stage/presentation/stage_cubit/satge_cubit.dart';
import 'package:pa_sreens/src/features/train/stage/presentation/stage_bloc/stage_bloc.dart';
import '../../../../../../../core/services/local_storage_service/local_storage_service.dart';
import '../../../../../../../core/theme/theme_data/theme_data.dart';
import '../../../../../../training_new/presentation/bloc/training_bloc.dart';
import '../../../../../../training_new/presentation/bloc/training_event.dart';
import '../../../../../../training_new/presentation/widgets/components/choose_wifi_ble.dart';
import '../../../../presentation/view/stage_view.dart';
import '../../data/local/service/drill_db_helper.dart';

class CreateDrillScreen extends StatefulWidget {
  final StageEntity stageEntity;

  const CreateDrillScreen({super.key, required this.stageEntity});

  @override
  State<CreateDrillScreen> createState() => _CreateDrillScreenState();
}

class _CreateDrillScreenState extends State<CreateDrillScreen> {
  TextEditingController drillNameController = TextEditingController();
  TextEditingController drillDescpController = TextEditingController();
  TextEditingController noOfShots = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final cubit = ParTimeCubit();
  DrillsModel drillsEntity = DrillsModel(id: null, drill: DrillsEntity());
  bool isAutoValidate = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AutoValidationCubit>(
      create: (context) => AutoValidationCubit(),
      child: BlocBuilder<AutoValidationCubit, bool>(
        builder: (context, state) {
          isAutoValidate = state;
          return Form(
            autovalidateMode:
                state ? AutovalidateMode.always : AutovalidateMode.disabled,
            key: _formKey,
            child: CustomPaint(
              painter: TrainBackgroundPainter(context),
              child: Scaffold(
                backgroundColor: AppTheme.background(context),

                // appBar: appBarCustom(ctx: context, title: 'Stage'),
                body: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    children: [
                      const BackButtonWithTitle(title: 'Create Drill'),
                      const SizedBox(height: 20),
                      Expanded(
                        child: ListView(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Create New drill',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                      color: AppTheme.textPrimary(context),
                                    ),
                                    // TextStyle(
                                    //     fontSize: 18.sp,
                                    //     color: AppColors.blackTextColor,
                                    //     fontFamily: AppFontFamily.bold),
                                  ),
                                  SizedBox(height: 16.h),
                                  CustomTextFieldOld(
                                    isRequired: true,
                                    controller: drillNameController,
                                    labelText: 'Name your new drill',
                                  ),
                                  SizedBox(height: 16.h),
                                  CustomTextFieldOld(
                                      controller: drillDescpController,
                                      labelText: 'Drill description',
                                      maxLines: 5),
                                  SizedBox(height: 32.h),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Select Fire Type',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp,
                                        color: AppTheme.textPrimary(context),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 32.h),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: BlocBuilder<StageBloc, StageState>(
                                builder: (context, state) {
                                  if (state is DrillDropdownChangedState &&
                                      state.id == 4 &&
                                      state.selectedVal == 'Live Fire') {
                                    drillsEntity.drill?.fireType = 'Live Fire';
                                    drillsEntity.id = 1;
                                  } else if (state
                                          is DrillDropdownChangedState &&
                                      state.id == 4) {
                                    drillsEntity.drill?.fireType =
                                        'Air Powered Fire';
                                    drillsEntity.id = 2;
                                  }
                                  if (isAutoValidate) {
                                    WidgetsBinding.instance
                                        .addPostFrameCallback((_) {
                                      _formKey.currentState?.validate();
                                    });
                                  }
                                  return PaDropdownGen<String>(
                                    initialValue: fireType,
                                    onDelTap: (p0) {},
                                    getLabel: (p0) => p0,
                                    hint: 'Fire Type',
                                    items: const [
                                      'Live Fire',
                                      'Air Powered Fire'
                                    ],
                                    noPadding: true,
                                    selectItemCall: (val) {
                                      fireType = val;
                                      context.read<StageBloc>().add(
                                          DrillDropDownChangedEvent(
                                              id: 4, selectedVal: val));
                                    },
                                    selectedValue:
                                        (state is DrillDropdownChangedState &&
                                                state.id == 4)
                                            ? state.selectedVal
                                            : '',
                                  );
                                },
                              ),
                            ),
                            SizedBox(height: 32.h),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Select Total No of Shots',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp,
                                        color: AppTheme.textPrimary(context),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 16.h),
                                  CustomTextFieldOld(
                                      isShots: true,
                                      numericKeyBoard: true,
                                      isRequired: true,
                                      controller: noOfShots,
                                      labelText: 'No of shots'),
                                  SizedBox(height: 16.h),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Do you want to set par time for this drill?',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp,
                                        color: AppTheme.textPrimary(context),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  BlocProvider(
                                    create: (context) => cubit,
                                    child: SizedBox(
                                        height: 150.h,
                                        child:
                                            BlocBuilder<ParTimeCubit, String>(
                                          builder: (context, state) {
                                            return Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Radio<String>(
                                                      activeColor: AppColors
                                                          .kPrimaryColor,
                                                      fillColor:
                                                          WidgetStateProperty
                                                              .all(
                                                        AppTheme.textSecondary(
                                                            context),
                                                      ),
                                                      value: 'Yes',
                                                      groupValue: state,
                                                      onChanged:
                                                          (String? value) {
                                                        // if (_formKey.currentState!
                                                        //     .validate()) {
                                                        //   cubit.yesPartime();
                                                        //   drillsEntity.drill?.name =
                                                        //       drillNameController.text;
                                                        //   drillsEntity
                                                        //           .drill?.description =
                                                        //       drillDescpController.text;
                                                        //   drillsEntity
                                                        //           .drill?.noOfShots =
                                                        //       noOfShots.text;
                                                        //   // log(' new drill page  - - ${drillsEntity.drill?.toJson()}');
                                                        //   // Navigator.push(
                                                        //   //     context,
                                                        //   //     MaterialPageRoute(
                                                        //   //         builder: (context) =>
                                                        //   //             ParTimeScreen(
                                                        //   //                 drillsEntity:
                                                        //   //                     drillsEntity,
                                                        //   //                 stageEntity:
                                                        //   //                     widget
                                                        //   //                         .stageEntity))).then(
                                                        //   //     (v) => cubit.noParTime());
                                                        // } else {
                                                        //   !isAutoValidate
                                                        //       ? context
                                                        //           .read<
                                                        //               AutoValidationCubit>()
                                                        //           .enableAuto()
                                                        //       : '';
                                                        // }
                                                      },
                                                    ),
                                                    Text(
                                                      'Yes',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 14.sp,
                                                        color: AppTheme
                                                            .textPrimary(
                                                                context),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Radio<String>(
                                                      value: 'No',
                                                      activeColor:
                                                          AppTheme.primary(
                                                              context),
                                                      fillColor:
                                                          WidgetStateProperty
                                                              .all(
                                                        AppTheme.textSecondary(
                                                            context),
                                                      ),
                                                      groupValue: cubit.state,
                                                      onChanged:
                                                          (String? value) {
                                                        cubit.noParTime();

                                                        drillsEntity.drill
                                                            ?.parTimeList = [];
                                                        // setState(() {
                                                        //   _selectedOption = value;
                                                        // });
                                                      },
                                                    ),
                                                    Text(
                                                      'No',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 14.sp,
                                                        color: AppTheme
                                                            .textPrimary(
                                                                context),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            );
                                          },
                                        )),
                                  ),
                                  ExitSaveButton(
                                    firstButton: 'Exit',
                                    onTapFirstButton: () =>
                                        Navigator.pop(context),
                                    secondButton: 'Save',
                                    onTapSecondButton: () async {
                                      if (_formKey.currentState!.validate()) {
                                        DrillsEntity drillsEntity =
                                            DrillsEntity(
                                          description:
                                              drillDescpController.text,
                                          fireType: fireType,
                                          //widget.drillsEntity.drill?.fireType,
                                          isMute: 0,
                                          //widget.drillsEntity.drill?.isMute,
                                          name: drillNameController.text,
                                          noOfShots: noOfShots.text,
                                          parTimeList: [],
                                          partTimeType: 'no',
                                        );
                                        DrillsModel? drillsModel =
                                            await DrillDbHelper().addNewDrill(
                                                locator<LocalStorageService>()
                                                    .userIdString,
                                                drillsEntity);
                                        widget.stageEntity.drill = drillsModel;
                                        if (context.mounted) {
                                          context.read<StageBloc>().add(
                                              StageUpdateEvent(
                                                  stageEntity:
                                                      widget.stageEntity));
                                          context.read<TrainingBloc>().add(SelectDrillEvent(widget.stageEntity.drill!));
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                          // Navigator.popUntil(context, (route) {
                                          //   return route.settings.name == null &&
                                          //       route is MaterialPageRoute &&
                                          //       route.builder(context) is StageView;
                                          // });
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
                                  SizedBox(height: 20.h)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String fireType = 'Live Fire';
}
