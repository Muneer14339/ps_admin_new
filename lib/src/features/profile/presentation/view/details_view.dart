// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:pa_sreens/src/core/services/locator/locator.dart';
// import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
// import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
// import 'package:pa_sreens/src/core/widgets/custom_appbar.dart';
// import 'package:pa_sreens/src/core/widgets/modified_container.dart';
// import 'package:pa_sreens/src/core/utils/utils.dart';
// import 'package:pa_sreens/src/core/widgets/train_background.dart';
// import 'package:pa_sreens/src/features/profile/presentation/blocs/profile_remote_bloc/profile_remote_bloc.dart';
// import 'package:pa_sreens/src/features/profile/presentation/view/edit_profile_view.dart';
// import 'package:pa_sreens/src/features/profile/presentation/widgets/detail_page_tile.dart';
// import 'package:pa_sreens/src/features/profile/presentation/widgets/edit_icon.dart';
// import '../../../../core/widgets/app_network_image.dart';
// import '../../../../core/widgets/border_button.dart';
// import '../../../../core/widgets/bottom_sheet_.dart';
// import '../../../../core/widgets/primary_button.dart';
// import '../../../../core/widgets/signin_textfield.dart';
// import '../../../auth_new/authentication/domain/entities/user.dart';
// import '../../../auth_new/signup_cubit.dart';
//
// class DetailsView extends StatefulWidget {
//   const DetailsView({super.key});
//
//   @override
//   State<DetailsView> createState() => _DetailsViewState();
// }
//
// class _DetailsViewState extends State<DetailsView> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return CustomPaint(
//       painter: TrainBackgroundPainter(context),
//       child: Scaffold(
//         appBar: appBarCustom(ctx: context, title: 'Account Details'),
//         body: BlocBuilder<ProfileRemoteBloc, ProfileRemoteState>(
//           builder: (context, state) {
//             if (state is ProfileError) {
//               return Center(child: Text(state.error));
//             } else if (state is ProfileSuccess) {
//               return ListView(
//                 padding: EdgeInsets.symmetric(horizontal: 24.w),
//                 children: [
//                   const Gap(8),
//                   Center(
//                       child: ModifiedContainer(
//                           padding: const EdgeInsets.all(4),
//                           width: size.width / 4,
//                           height: size.width / 4,
//                           borderColor: AppColors.kPrimaryColor,
//                           borderSize: 4,
//                           borderRadius: 100,
//                           child: Center(
//                             child: AppNetworkImage(
//                               imageURL: state.user.image,
//                               height: size.width / 4,
//                               width: size.width / 4,
//                               borderRadius: 100,
//                             ),
//                           ))),
//                   const Gap(6),
//                   Center(
//                     child: Text(state.user.fullName ?? 'Joe Smith',
//                         style: Theme.of(context).textTheme.titleMedium),
//                   ),
//                   Center(
//                     child: Text(state.user.email ?? 'jsmith@example.com',
//                         style: Theme.of(context).textTheme.bodySmall),
//                   ),
//                   const Gap(2),
//                   ModifiedContainer(
//                     onTap: () {
//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //         builder: (_) =>
//                       //             EditProfileView(user: state.user)));
//                     },
//                     padding: const EdgeInsets.all(8),
//                     color: Colors.transparent,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text('edit',
//                             style: TextStyle(
//                                 letterSpacing: 0.6,
//                                 fontSize: 16.sp,
//                                 fontFamily: AppFontFamily.regular,
//                                 color: AppColors.kPrimaryColor)),
//                         const Gap(4),
//                         const EditIcon()
//                       ],
//                     ),
//                   ),
//                   const Gap(8),
//                   ModifiedContainer(
//                     color: Theme.of(context).cardColor,
//                     padding: const EdgeInsets.all(12),
//                     borderRadius: 12.h,
//                     child: Column(
//                       children: [
//                         const Gap(8),
//                         DetailPageTile(
//                             label: 'Email',
//                             text: state.user.email ?? 'jsmith@example.com'),
//                         DetailPageTile(
//                           label: 'Password',
//                           text: '*************',
//                           onTapEdit: () {
//                             // controllerOldPass.clear();
//                             // controllerNewPass.clear();
//                             // controllerConfirmPass.clear();
//                             // showModalBottomSheet(
//                             //     backgroundColor: Colors.transparent,
//                             //     context: context,
//                             //     isScrollControlled: true,
//                             //     useRootNavigator: true,
//                             //     builder: (_) => BlocProvider(
//                             //           create: (context) => signupCubit,
//                             //           child: BlocBuilder<SignupCubit,
//                             //               SignupEntity>(
//                             //             builder: (context, state) {
//                             //               return AppBottomSheet(
//                             //                   initialHeight: 0.45,
//                             //                   height: .7,
//                             //                   formKey: formKeyPassword,
//                             //                   scrollWidget: SigninTextfield(
//                             //                       hintText: '',
//                             //                       icon: '',
//                             //                       controller:
//                             //                           TextEditingController(),
//                             //                       preIconHeight: 1),
//                             //                   paddding:
//                             //                       const EdgeInsets.symmetric(
//                             //                           horizontal: 20),
//                             //                   children: [
//                             //                     Text('Change Password',
//                             //                         style: TextStyle(
//                             //                             fontSize: 14.sp,
//                             //                             fontFamily:
//                             //                                 AppFontFamily.bold,
//                             //                             color: AppColors
//                             //                                 .blackTextColor)),
//                             //                     const Gap(24),
//                             //                     SigninTextfield(
//                             //                         hintText: 'Old password',
//                             //                         isObscure:
//                             //                             state.obscurePassword,
//                             //                         validator:
//                             //                             validateLoginPass,
//                             //                         visibility: signupCubit
//                             //                             .togglePasswordVisibility,
//                             //                         icon:
//                             //                             'assets/icons/pass2.png',
//                             //                         preIconHeight: 18.h,
//                             //                         controller:
//                             //                             controllerOldPass),
//                             //                     const Gap(8),
//                             //                     SigninTextfield(
//                             //                         hintText: 'Password',
//                             //                         validator:
//                             //                             validatePasswords,
//                             //                         isObscure:
//                             //                             state.obscurePassword,
//                             //                         visibility: signupCubit
//                             //                             .togglePasswordVisibility,
//                             //                         icon:
//                             //                             'assets/icons/pass2.png',
//                             //                         preIconHeight: 18.h,
//                             //                         controller:
//                             //                             controllerNewPass),
//                             //                     const Gap(8),
//                             //                     SigninTextfield(
//                             //                         hintText:
//                             //                             'Confirm Password',
//                             //                         validator:
//                             //                             _validateConfirmPassword,
//                             //                         isObscure:
//                             //                             state.obscurePassword,
//                             //                         visibility: signupCubit
//                             //                             .togglePasswordVisibility,
//                             //                         icon:
//                             //                             'assets/icons/pass2.png',
//                             //                         preIconHeight: 18.h,
//                             //                         controller:
//                             //                             controllerConfirmPass),
//                             //                     const Gap(20),
//                             //                     Row(
//                             //                       children: [
//                             //                         Expanded(
//                             //                           child: BorderButton(
//                             //                             title: 'Discard',
//                             //                             style: TextStyle(
//                             //                                 color:
//                             //                                     AppColors.black,
//                             //                                 fontFamily:
//                             //                                     AppFontFamily
//                             //                                         .bold,
//                             //                                 fontSize: 16.sp,
//                             //                                 letterSpacing: 0.6),
//                             //                             onTap: () {
//                             //                               Navigator.pop(
//                             //                                   context);
//                             //                             },
//                             //                           ),
//                             //                         ),
//                             //                         SizedBox(
//                             //                             width:
//                             //                                 size.width * 0.05),
//                             //                         BlocProvider(
//                             //                           create: (context) => locator<
//                             //                               ProfileRemoteBloc>(),
//                             //                           child: BlocConsumer<
//                             //                               ProfileRemoteBloc,
//                             //                               ProfileRemoteState>(
//                             //                             listener:
//                             //                                 (context, state) {
//                             //                               if (state
//                             //                                   is ChangePassError) {
//                             //                                 toast(state.error);
//                             //                               } else if (state
//                             //                                   is ChangePassSuccess) {
//                             //                                 toast(
//                             //                                     'Password changed successfully!');
//                             //
//                             //                                 Navigator.pop(
//                             //                                     context);
//                             //                               }
//                             //                             },
//                             //                             builder: (context,
//                             //                                 stateChange) {
//                             //                               if (stateChange
//                             //                                   is ChangePassLoading) {
//                             //                                 return const CircularProgressIndicator
//                             //                                     .adaptive();
//                             //                               } else {
//                             //                                 return Expanded(
//                             //                                     child:
//                             //                                         PrimaryButton(
//                             //                                   title: 'Save',
//                             //                                   style: TextStyle(
//                             //                                       color:
//                             //                                           AppColors
//                             //                                               .white,
//                             //                                       fontFamily:
//                             //                                           AppFontFamily
//                             //                                               .bold,
//                             //                                       fontSize:
//                             //                                           16.sp,
//                             //                                       letterSpacing:
//                             //                                           0.6),
//                             //                                   onTap: () async {
//                             //                                     if (formKeyPassword
//                             //                                         .currentState!
//                             //                                         .validate()) {
//                             //                                       context.read<ProfileRemoteBloc>().add(ChangePassEvent(
//                             //                                           oldPass:
//                             //                                               controllerOldPass
//                             //                                                   .text,
//                             //                                           newPass:
//                             //                                               controllerConfirmPass
//                             //                                                   .text));
//                             //                                     }
//                             //                                   },
//                             //                                 ));
//                             //                               }
//                             //                             },
//                             //                           ),
//                             //                         )
//                             //                       ],
//                             //                     ),
//                             //                     const Gap(8)
//                             //                   ]);
//                             //             },
//                             //           ),
//                             //         ));
//                           },
//                         ),
//                         DetailPageTile(
//                           label: 'Phone No',
//                           text: (state.user.phoneNo ?? '').isEmpty
//                               ? 'Add Phone No'
//                               : state.user.phoneNo!,
//                           onTap: () {
//                             if ((state.user.phoneNo ?? '').isEmpty) {
//                               editNavigator(state.user);
//                             }
//                           },
//                         ),
//                         DetailPageTile(
//                             label: 'Full Name',
//                             text: state.user.fullName ?? 'Name'),
//                         DetailPageTile(
//                             label: 'Gender',
//                             text: (state.user.gender ?? '').isEmpty
//                                 ? 'Enter Gender'
//                                 : state.user.gender!,
//                             onTap: () {
//                               if ((state.user.gender ?? '').isEmpty) {
//                                 editNavigator(state.user);
//                               }
//                             }),
//                         DetailPageTile(
//                             label: 'Age',
//                             text: '${state.user.age ?? ''}'.isEmpty
//                                 ? 'Enter Age'
//                                 : '${state.user.age}',
//                             onTap: () {
//                               if ('${state.user.age ?? ''}'.isEmpty) {
//                                 editNavigator(state.user);
//                               }
//                             }),
//                         DetailPageTile(
//                             label: 'City',
//                             text: (state.user.city ?? '').isEmpty
//                                 ? 'Enter City'
//                                 : state.user.city!,
//                             onTap: () {
//                               if ((state.user.city ?? '').isEmpty) {
//                                 editNavigator(state.user);
//                               }
//                             }
//                             //state.user.city ?? 'California',
//                             ),
//                         DetailPageTile(
//                             label: 'State & Province',
//                             text: (state.user.state ?? '').isEmpty
//                                 ? 'Enter State & Province'
//                                 : state.user.state!,
//                             onTap: () {
//                               if ((state.user.state ?? '').isEmpty) {
//                                 editNavigator(state.user);
//                               }
//                             }
//                             //state.user.state ?? 'California',
//                             ),
//                         DetailPageTile(
//                             label: 'Country',
//                             text: state.user.location ?? 'Country'),
//                         DetailPageTile(
//                             label: 'Zip Code',
//                             text: '${state.user.zipCode ?? ''}'.isEmpty
//                                 ? 'Enter Zip Code'
//                                 : '${state.user.zipCode}',
//                             onTap: () {
//                               if ('${state.user.zipCode ?? ''}'.isEmpty) {
//                                 editNavigator(state.user);
//                               }
//                             }
//                             //'${state.user.zipCode ?? '41000'}',
//                             ),
//                       ],
//                     ),
//                   ),
//                   Gap(70.h),
//                 ],
//               );
//             } else {
//               return const Center(child: CircularProgressIndicator.adaptive());
//             }
//           },
//         ),
//       ),
//     );
//   }
//
//
//   final formKeyPassword = GlobalKey<FormState>();
//
//   // File? userImage;
//   late TextEditingController controllerOldPass;
//   late TextEditingController controllerNewPass;
//   late TextEditingController controllerConfirmPass;
//
//   @override
//   void initState() {
//     // context.read<ProfileRemoteBloc>().add(UserProfileRemoteEvent(
//     //     userId: locator<LocalStorageService>().userIdString));
//     controllerOldPass = TextEditingController();
//     controllerNewPass = TextEditingController();
//     controllerConfirmPass = TextEditingController();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     controllerOldPass.dispose();
//     controllerNewPass.dispose();
//     controllerConfirmPass.dispose();
//     super.dispose();
//   }
//
//   String? _validateConfirmPassword(String? value) {
//     if (value == null || value.isEmpty) {
//       return 'Confirm password is required';
//     }
//     if (value != controllerNewPass.text) {
//       return 'Passwords do not match';
//     }
//     return null;
//   }
//
//   void editNavigator(User user) {
//     // Navigator.push(context,
//     //     MaterialPageRoute(builder: (_) => EditProfileView(user: user)));
//   }
// }
