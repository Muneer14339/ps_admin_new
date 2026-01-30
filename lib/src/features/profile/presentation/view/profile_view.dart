// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:pa_sreens/src/core/services/local_storage_service/local_storage_service.dart';
// import 'package:pa_sreens/src/core/services/locator/locator.dart';
// import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
// // import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
// import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
// import 'package:pa_sreens/src/core/utils/utils.dart';
// import 'package:pa_sreens/src/core/widgets/bottom_sheet_.dart';
// import 'package:pa_sreens/src/core/widgets/modified_container.dart';
// import 'package:pa_sreens/src/core/widgets/train_background.dart';
// import 'package:pa_sreens/src/features/auth_new/authentication/presentation/pages/login_page.dart';
// import 'package:pa_sreens/src/features/profile/presentation/blocs/profile_remote_bloc/profile_remote_bloc.dart';
// import 'package:pa_sreens/src/features/profile/presentation/view/app_settings_view.dart';
// import 'package:pa_sreens/src/features/profile/presentation/view/details_view.dart';
// import 'package:pa_sreens/src/features/profile/presentation/widgets/menu_tile.dart';
// import 'package:pa_sreens/src/features/profile/presentation/widgets/refer_a_friend_tile.dart';
// import 'package:pa_sreens/src/features/profile/presentation/view/store_view.dart';
// import 'package:share_plus/share_plus.dart';
// import '../../../../core/widgets/app_network_image.dart';
// import '../../../../core/widgets/border_button.dart';
// import '../../../../core/widgets/primary_button.dart';
// import 'toturials_view.dart';
//
// class ProfileView extends StatefulWidget {
//   const ProfileView({super.key});
//
//   @override
//   State<ProfileView> createState() => _ProfileViewState();
// }
//
// class _ProfileViewState extends State<ProfileView> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return CustomPaint(
//       painter: TrainBackgroundPainter(context),
//       child: Scaffold(
//         // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         // backgroundColor: Colors.transparent,
//         body: BlocBuilder<ProfileRemoteBloc, ProfileRemoteState>(
//           builder: (context, state) {
//             if (state is ProfileSuccess) {
//               return ListView(
//                 padding: EdgeInsets.symmetric(horizontal: 24.w),
//                 children: [
//                   SizedBox(
//                       height: MediaQuery.of(context).padding.top +
//                           AppBar().preferredSize.height),
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
//                   Center(
//                     child: Text(state.user.fullName ?? 'Joe Smith',
//                         style: Theme.of(context).textTheme.titleMedium),
//                   ),
//                   Center(
//                     child: Text(state.user.email ?? 'jsmith@example.com',
//                         style: Theme.of(context).textTheme.titleSmall),
//                   ),
//                   const Gap(22),
//                   ModifiedContainer(
//                     color: Theme.of(context).cardColor,
//                     padding: const EdgeInsets.all(12),
//                     borderRadius: 12.h,
//                     child: Column(
//                       children: [
//                         MenuTile(
//                             title: 'Account Detail',
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (_) => const DetailsView(),
//                                 ),
//                               );
//                             }),
//                         const Gap(10),
//                         MenuTile(title: 'My Competitions', onTap: () {}),
//                         const Gap(10),
//                         MenuTile(
//                             title: 'App Settings',
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (_) => const AppSettingsView()));
//                             }),
//                         const Gap(10),
//                         MenuTile(
//                             title: 'Refer a Friend',
//                             onTap: () {
//                               showModalBottomSheet(
//                                   backgroundColor: Colors.transparent,
//                                   context: context,
//                                   isScrollControlled: true,
//                                   useRootNavigator: true,
//                                   builder: (_) => AppBottomSheet(
//                                           initialHeight: 0.45,
//                                           height: .5,
//                                           children: [
//                                             Center(
//                                               child: Text(
//                                                 'Share with friends',
//                                                 style: TextStyle(
//                                                     color: AppColors
//                                                         .blackTextColor,
//                                                     fontFamily:
//                                                         AppFontFamily.bold,
//                                                     fontSize: 20.sp),
//                                               ),
//                                             ),
//                                             const Gap(32),
//                                             const ReferFriendTile(
//                                                 assetIcon:
//                                                     'assets/icons/playstore.png',
//                                                 link:
//                                                     'www.pulseaim.apk/VCjVhncChcbbxdz'),
//                                             const Gap(25),
//                                             const ReferFriendTile(
//                                                 assetIcon:
//                                                     'assets/icons/app_store_icon.png',
//                                                 link:
//                                                     'www.pulseaim.apk/VCjVhncChcbbxdz'),
//                                             const Gap(25),
//                                             Row(
//                                               children: [
//                                                 Expanded(
//                                                   child: Divider(
//                                                     color: Colors.grey.shade500,
//                                                   ),
//                                                 ),
//                                                 Text(
//                                                   '  OR ',
//                                                   style: TextStyle(
//                                                       color: AppColors
//                                                           .blackTextColor,
//                                                       fontSize: 12.sp,
//                                                       fontFamily: AppFontFamily
//                                                           .regular),
//                                                 ),
//                                                 Expanded(
//                                                     child: Divider(
//                                                         color: Colors
//                                                             .grey.shade500)),
//                                               ],
//                                             ),
//                                             const Gap(25),
//                                             PrimaryButton(
//                                               title: 'Share',
//                                               onTap: () async {
//                                                 Share.share(
//                                                     'www.pulseaim.apk/VCjVhncChcbbxdz');
//                                               },
//                                             ),
//                                           ]));
//                             }),
//                         const Gap(10),
//                         MenuTile(
//                             title: 'Store',
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (_) => const StorePage()));
//                             }),
//                         const Gap(10),
//                         MenuTile(
//                             title: 'Tutorials',
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (_) => const ToturialsPage()));
//                             }),
//                         const Gap(10),
//                         MenuTile(
//                             title: 'Log out',
//                             onTap: () {
//                               showModalBottomSheet(
//                                   context: context,
//                                   backgroundColor: Colors.transparent,
//                                   isDismissible: true,
//                                   isScrollControlled: true,
//                                   useRootNavigator: true,
//                                   builder: (_) => AppBottomSheetWidget(
//                                       height: 0.4,
//                                       child: Padding(
//                                         padding: hPadding,
//                                         child: Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceAround,
//                                             children: [
//                                               // const Gap(1),
//                                               Icon(Icons.info_outline_rounded,
//                                                   color: AppColors.deepOrange),
//                                               Text('Note',
//                                                   style: TextStyle(
//                                                       color: Theme.of(context)
//                                                           .primaryColor,
//                                                       fontFamily:
//                                                           AppFontFamily.bold,
//                                                       fontSize: 20.sp)),
//                                               Text('Do you want to log out?',
//                                                   style: TextStyle(
//                                                       color: AppColors
//                                                           .greyTextColor,
//                                                       fontFamily:
//                                                           AppFontFamily.regular,
//                                                       fontSize: 16.sp)),
//                                               const Gap(14),
//                                               Row(
//                                                 children: [
//                                                   Expanded(
//                                                     child: BorderButton(
//                                                       title: 'Cancel',
//                                                       onTap: () {
//                                                         Navigator.pop(context);
//                                                       },
//                                                     ),
//                                                   ),
//                                                   SizedBox(
//                                                       width: size.width * 0.05),
//                                                   Expanded(
//                                                     child: PrimaryButton(
//                                                       title: 'Log out',
//                                                       style: TextStyle(
//                                                           color:
//                                                               AppColors.white,
//                                                           fontFamily:
//                                                               AppFontFamily
//                                                                   .bold,
//                                                           fontSize: 16.sp,
//                                                           letterSpacing: 0.6),
//                                                       onTap: () {
//                                                         prefs?.clear();
//                                                         // Navigator.popUntil(
//                                                         //     context,
//                                                         //     ModalRoute.withName(
//                                                         //         '/signIN'));
//                                                         Navigator.of(context,
//                                                                 rootNavigator:
//                                                                     true)
//                                                             .pushAndRemoveUntil(
//                                                           MaterialPageRoute(
//                                                               builder: (_) =>
//                                                                   const LoginPage()),
//                                                           (route) => false,
//                                                         );
//                                                       },
//                                                     ),
//                                                   )
//                                                 ],
//                                               ),
//                                             ]),
//                                       )));
//                             }),
//                       ],
//                     ),
//                   ),
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
//   File? userImage;
//   @override
//   void initState() {
//     super.initState();
//     final state = BlocProvider.of<ProfileRemoteBloc>(context).state;
//     if ((state is! ProfileSuccess) ||
//         (state.user.id != locator<LocalStorageService>().userId)) {
//       context.read<ProfileRemoteBloc>().add(UserProfileRemoteEvent(
//           userId: locator<LocalStorageService>().userIdString));
//     }
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//   }
// }
