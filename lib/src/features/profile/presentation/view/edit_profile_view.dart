// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
// import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
// import 'package:pa_sreens/src/core/theme/text_styles/app_text_style.dart';
// import 'package:pa_sreens/src/core/widgets/app_network_image.dart';
// import 'package:pa_sreens/src/core/widgets/custom_appbar.dart';
// import 'package:pa_sreens/src/core/widgets/custom_textfield.dart';
// import 'package:pa_sreens/src/core/widgets/modified_container.dart';
// import 'package:pa_sreens/src/core/widgets/pa_dropdown.dart';
// import 'package:pa_sreens/src/core/utils/utils.dart';
// import 'package:pa_sreens/src/core/widgets/train_background.dart';
// import 'package:pa_sreens/src/features/profile/presentation/blocs/profile_bloc/profile_bloc.dart';
// import 'package:pa_sreens/src/features/profile/presentation/blocs/profile_remote_bloc/profile_remote_bloc.dart';
// import 'package:pa_sreens/src/features/profile/presentation/widgets/label_widget.dart';
// import '../../../../core/helper/helper_methods.dart';
// import '../../../../core/widgets/border_button.dart';
// import '../../../../core/widgets/bottom_sheet_.dart';
// import '../../../../core/widgets/custom_csc_picker.dart';
// import '../../../../core/widgets/primary_button.dart';
// import '../../../auth_new/authentication/domain/entities/user.dart';
//
// class EditProfileView extends StatefulWidget {
//   const EditProfileView({required this.user, super.key});
//   final User user;
//
//   @override
//   State<EditProfileView> createState() => _EditProfileViewState();
// }
//
// class _EditProfileViewState extends State<EditProfileView> {
//   late ScrollController _scrollController;
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return CustomPaint(
//       painter: TrainBackgroundPainter(context),
//       child: Scaffold(
//         appBar: appBarCustom(ctx: context, title: 'Edit Profile'),
//         body: BlocConsumer<ProfileRemoteBloc, ProfileRemoteState>(
//           listener: (context, stateRemote) {
//             if (stateRemote is UpdateProfileError) {
//               toast(stateRemote.error);
//             } else if (stateRemote is UpdateProfileSuccess) {
//               toast('Profile updated successfully');
//               context
//                   .read<ProfileRemoteBloc>()
//                   .add(UserProfileRemoteEvent(userId: "${widget.user.id}"));
//               Navigator.pop(context);
//             }
//           },
//           builder: (context, stateRemote) {
//             return BlocBuilder<ProfileBloc, ProfileState>(
//               builder: (context, state) {
//                 return ListView(
//                   controller: _scrollController,
//                   padding: EdgeInsets.symmetric(horizontal: 24.w),
//                   children: [
//                     const Gap(8),
//                     GestureDetector(
//                         onTap: () {
//                           showModalBottomSheet(
//                             isScrollControlled: true,
//                             context: context,
//                             backgroundColor: Colors.transparent,
//                             useRootNavigator: true,
//                             builder: (context) => AppBottomSheet(
//                               height: 0.3,
//                               title: '',
//                               children: [
//                                 Center(
//                                   child: Text('Choose Image',
//                                       style: TextStyle(
//                                           color: AppColors.blackTextColor,
//                                           fontFamily: AppFontFamily.bold,
//                                           fontSize: 16.sp)),
//                                 ),
//                                 SizedBox(height: size.height * 0.02),
//                                 Center(
//                                   child: Text(
//                                       "Select whether you want to pick file from\nGallery or Camera",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                           color: AppColors.blackTextColor,
//                                           fontFamily: AppFontFamily.regular,
//                                           fontSize: 16.sp)),
//                                 ),
//                                 SizedBox(height: size.height * 0.05),
//                                 Row(
//                                   children: [
//                                     Expanded(
//                                         child: BorderButton(
//                                             title: "Camera",
//                                             onTap: () async {
//                                               final pickedImage =
//                                                   await pickImage(
//                                                       isGallery: false);
//                                               if (pickedImage != null &&
//                                                   context.mounted) {
//                                                 Navigator.pop(
//                                                     context, pickedImage);
//                                               }
//                                             })),
//                                     SizedBox(width: size.width * 0.05),
//                                     Expanded(
//                                         child: PrimaryButton(
//                                             title: "Gallery",
//                                             onTap: () async {
//                                               final pickedImage =
//                                                   await pickImage(
//                                                       isGallery: true);
//                                               if (pickedImage != null &&
//                                                   context.mounted) {
//                                                 Navigator.pop(
//                                                     context, pickedImage);
//                                               }
//                                             }))
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ).then((value) async {
//                             if (value != null && context.mounted) {
//                               userImage = value;
//                               context.read<ProfileBloc>().add(
//                                   ProfilePictureChangeEvent(imageFile: value));
//                             }
//                           });
//                         },
//                         child: SizedBox(
//                             child: Center(
//                           child: ModifiedContainer(
//                             padding: const EdgeInsets.all(4),
//                             width: size.width / 4,
//                             height: size.width / 4,
//                             borderColor: AppColors.kPrimaryColor,
//                             borderSize: 4,
//                             borderRadius: 100,
//                             child: Center(
//                               child: userImage != null
//                                   ? ClipRRect(
//                                       borderRadius: const BorderRadius.all(
//                                           Radius.circular(100)),
//                                       child: Image.file(
//                                         userImage!,
//                                         width: size.width / 4,
//                                         height: size.width / 4,
//                                         fit: BoxFit.cover,
//                                       ),
//                                     )
//                                   : AppNetworkImage(
//                                       imageURL: widget.user.image,
//                                       height: size.width / 4,
//                                       width: size.width / 4,
//                                       borderRadius: 100,
//                                     ),
//                             ),
//                           ),
//                         ))),
//                     Center(
//                       child: Text(widget.user.fullName ?? 'Joe Smith',
//                           style: TextStyle(
//                             fontFamily: AppFontFamily.bold,
//                             fontSize: 18.sp,
//                             // color: AppColors.blackTextColor,
//                           )),
//                     ),
//                     Center(
//                       child: Text(widget.user.email ?? 'jsmith@example.com',
//                           style: TextStyle(
//                             fontFamily: AppFontFamily.regular,
//                             fontSize: 14.sp,
//                             // color: AppColors.blackTextColor
//                           )),
//                     ),
//                     const Gap(22),
//                     ModifiedContainer(
//                         color: Theme.of(context).cardColor,
//                         padding: const EdgeInsets.all(12),
//                         borderRadius: 12.h,
//                         child: Form(
//                           key: formKey,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const LabelWidget(label: 'Full Name'),
//                               CustomTextFieldOld(
//                                 hintText: 'Full Name',
//                                 controller: controllerName,
//                                 isRequired: true,
//                                 onChanged: (value) {},
//                               ),
//                               const LabelWidget(label: 'Phone No'),
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Expanded(
//                                       flex: 3,
//                                       child: CustomTextFieldOld(
//                                         hintText: '+1',
//                                         isReadOnly: true,
//                                         controller: controllerCountryCode,
//                                         onTap: () {
//                                           showModalBottomSheet(
//                                             context: context,
//                                             isScrollControlled: true,
//                                             backgroundColor: Colors.transparent,
//                                             useRootNavigator: true,
//                                             builder: (context) {
//                                               return AppBottomSheetWidget(
//                                                   height: 0.6,
//                                                   title: 'Select Country Code',
//                                                   child: FutureBuilder<
//                                                       Map<String,
//                                                           CountryWithPhoneCode>>(
//                                                     future:
//                                                         getAllSupportedRegions(),
//                                                     builder:
//                                                         (context, snapshot) {
//                                                       if (!snapshot.hasData) {
//                                                         return const Padding(
//                                                           padding:
//                                                               EdgeInsets.only(
//                                                                   top: 8),
//                                                           child:
//                                                               LinearProgressIndicator(),
//                                                         );
//                                                       }
//
//                                                       final countries =
//                                                           snapshot.data!;
//                                                       final countryList =
//                                                           countries.values
//                                                               .toList();
//
//                                                       return ListView.builder(
//                                                         itemCount:
//                                                             countryList.length,
//                                                         itemBuilder:
//                                                             (context, index) {
//                                                           final country =
//                                                               countryList[
//                                                                   index];
//                                                           return ModifiedContainer(
//                                                             onTap: () {
//                                                               controllerCountryCode
//                                                                       .text =
//                                                                   '+${country.phoneCode}';
//                                                               Navigator.pop(
//                                                                   context);
//                                                             },
//                                                             margin:
//                                                                 const EdgeInsets
//                                                                     .only(
//                                                                     top: 4),
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                     .symmetric(
//                                                                     horizontal:
//                                                                         12,
//                                                                     vertical:
//                                                                         8),
//                                                             child: Column(
//                                                               crossAxisAlignment:
//                                                                   CrossAxisAlignment
//                                                                       .start,
//                                                               mainAxisSize:
//                                                                   MainAxisSize
//                                                                       .min,
//                                                               children: [
//                                                                 Text(
//                                                                     '${country.countryName} (+${country.phoneCode})',
//                                                                     style:
//                                                                         s16w400regularFont()),
//                                                                 appDivider(
//                                                                     context)
//                                                               ],
//                                                             ),
//                                                           );
//                                                         },
//                                                       );
//                                                     },
//                                                   ));
//                                             },
//                                           );
//                                         },
//                                       )),
//                                   Gap(4.w),
//                                   Expanded(
//                                     flex: 11,
//                                     child: CustomTextFieldOld(
//                                         numericKeyBoard: true,
//                                         hintText: 'Phone No',
//                                         controller: controllerPhoneNo,
//                                         maxLength: 10,
//                                         isRequired: true),
//                                   ),
//                                 ],
//                               ),
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         const LabelWidget(label: 'Gender'),
//                                         PaDropdownGen<String>(
//                                             items: const ['Male', 'Female'],
//                                             noPadding: true,
//                                             initialValue: gender ??
//                                                 widget.user.gender ??
//                                                 '',
//                                             hint: 'Gender',
//                                             menuHorizontalPadding: 0.w,
//                                             getLabel: (p0) => p0,
//                                             onDelTap: (p0) {},
//                                             selectItemCall: (p0) {
//                                               gender = p0;
//                                               context.read<ProfileBloc>().add(
//                                                   DropDownChangedEventGen<
//                                                           String>(
//                                                       id: 0, selectedVal: p0));
//                                             },
//                                             scrollController: _scrollController,
//                                             selectedValue:
//                                                 (state is DropdownChangedStateGen) &&
//                                                         state.id == 0
//                                                     ? state.selectedVal
//                                                     : null),
//                                       ],
//                                     ),
//                                   ),
//                                   const Gap(4),
//                                   Expanded(
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       mainAxisSize: MainAxisSize.max,
//                                       children: [
//                                         const LabelWidget(label: 'Age'),
//                                         CustomTextFieldOld(
//                                             hintText: '25',
//                                             numericKeyBoard: true,
//                                             maxLength: 2,
//                                             controller: controllerAge),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               const LabelWidget(label: 'Country'),
//                               CSCPickerCustom(
//                                 // dropdownItemStyle: const TextStyle(),
//                                 // dropdownHeadingStyle: const TextStyle(),
//                                 cityDropdownLabel: 'City',
//                                 stateDropdownLabel: 'State',
//                                 currentCity: city ?? widget.user.city,
//                                 currentCountry: country ?? widget.user.location,
//                                 flagState: CountryFlag.DISABLE,
//                                 defaultCountry: CscCountry.United_States,
//                                 currentState:
//                                     stateProvince ?? widget.user.state,
//                                 onCountryChanged: (value) {
//                                   country = value;
//                                   stateProvince = null;
//                                   city = null;
//                                 },
//                                 onStateChanged: (value) {
//                                   stateProvince = value;
//                                   city = null;
//                                 },
//                                 onCityChanged: (value) {
//                                   city = value;
//                                 },
//                               ),
//                               const LabelWidget(label: 'Zip Code'),
//                               CustomTextFieldOld(
//                                   hintText: 'Zip Code',
//                                   controller: controllerZipCode,
//                                   numericKeyBoard: true,
//                                   maxLength: 5),
//                               Gap(16.h),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     child: BorderButton(
//                                       title: 'Discard',
//                                       color: Theme.of(context)
//                                           .textTheme
//                                           .labelLarge
//                                           ?.color,
//                                       style: TextStyle(
//                                           // color: AppColors.black,
//                                           fontFamily: AppFontFamily.bold,
//                                           fontSize: 16.sp,
//                                           letterSpacing: 0.6),
//                                       onTap: () {
//                                         Navigator.pop(context);
//                                       },
//                                     ),
//                                   ),
//                                   SizedBox(width: size.width * 0.05),
//                                   stateRemote is UpdateProfileLoading
//                                       ? const CircularProgressIndicator
//                                           .adaptive()
//                                       : Expanded(
//                                           child: PrimaryButton(
//                                           title: 'Save',
//                                           buttonColor: AppColors.kPrimaryColor,
//                                           style: TextStyle(
//                                               // color: AppColors.white,
//                                               fontFamily: AppFontFamily.bold,
//                                               fontSize: 16.sp,
//                                               letterSpacing: 0.6),
//                                           onTap: () async {
//                                             controllerName.text =
//                                                 controllerName.text.trim();
//
//                                             if (formKey.currentState!
//                                                 .validate()) {
//                                               User user = User(
//                                                   id: widget.user.id,
//                                                   fullName: controllerName.text,
//                                                   phoneNo:
//                                                       '${controllerCountryCode.text}-${controllerPhoneNo.text}',
//                                                   gender: gender ??
//                                                       widget.user.gender,
//                                                   age: controllerAge
//                                                           .text.isEmpty
//                                                       ? 0
//                                                       : int.parse(
//                                                           controllerAge.text),
//                                                   location: country,
//                                                   state:
//                                                       stateProvince == 'State'
//                                                           ? null
//                                                           : stateProvince,
//                                                   city: city == 'City'
//                                                       ? null
//                                                       : city,
//                                                   zipCode: controllerZipCode
//                                                           .text.isEmpty
//                                                       ? null
//                                                       : int.parse(
//                                                           controllerZipCode
//                                                               .text),
//                                                   email: widget.user.email,
//                                                   isAgree: widget.user.isAgree,
//                                                   isCommunicationTrue: widget
//                                                       .user.isCommunicationTrue,
//                                                   image: userImage?.path);
//                                               context
//                                                   .read<ProfileRemoteBloc>()
//                                                   .add(UpdateProfileRemoteEvent(
//                                                       user: user));
//                                             }
//                                           },
//                                         ))
//                                 ],
//                               ),
//                             ],
//                           ),
//                         )),
//                     Gap(65.h)
//                   ],
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
//
//   final formKey = GlobalKey<FormState>();
//
//   File? userImage;
//   // late TextEditingController controllerOldPass;
//   // late TextEditingController controllerNewPass;
//   // late TextEditingController controllerConfirmPass;
//   String? gender, age, country, stateProvince, city;
//   late TextEditingController controllerName;
//   late TextEditingController controllerPhoneNo;
//   late TextEditingController controllerCountryCode;
//   late TextEditingController controllerAge;
//   late TextEditingController controllerZipCode;
//
//   @override
//   void initState() {
//     // Libphonenumber Init
//     init();
//
// //----------
//     controllerName = TextEditingController(text: widget.user.fullName);
//     controllerPhoneNo =
//         TextEditingController(text: widget.user.phoneNo?.split('-').last);
//     controllerCountryCode =
//         TextEditingController(text: widget.user.phoneNo?.split('-').first);
//     if (controllerCountryCode.text.trim().isEmpty) {
//       controllerCountryCode.text = '+1';
//     }
//     controllerAge = TextEditingController(text: '${widget.user.age ?? ''}');
//     controllerZipCode =
//         TextEditingController(text: '${widget.user.zipCode ?? ''}');
//     //
//     country = widget.user.location;
//     stateProvince =
//         widget.user.state?.isEmpty ?? true ? 'State' : widget.user.state;
//     city = widget.user.city?.isEmpty ?? true ? 'City' : widget.user.city;
//     _scrollController = ScrollController();
//
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     // controllerOldPass.dispose();
//     // controllerNewPass.dispose();
//     // controllerConfirmPass.dispose();
//     //
//     controllerName.dispose();
//     controllerPhoneNo.dispose();
//     controllerCountryCode.dispose();
//     controllerAge.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   Future<Map<String, dynamic>> _getAllSupportedRegions() async {
//     return await getAllSupportedRegions();
//   }
// }
