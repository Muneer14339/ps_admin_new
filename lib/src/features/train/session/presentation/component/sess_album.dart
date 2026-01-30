import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gal/gal.dart';
import 'package:gap/gap.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import 'package:pa_sreens/src/core/theme/font/app_fonts.dart';
import 'package:pa_sreens/src/core/theme/text_styles/app_text_style.dart';
import 'package:pa_sreens/src/core/utils/utils.dart';
import 'package:pa_sreens/src/core/widgets/app_checkbox.dart';
import 'package:pa_sreens/src/core/widgets/modified_container.dart';
import 'package:pa_sreens/src/features/train/session/presentation/bloc/session_bloc/session_bloc.dart';
import 'package:pa_sreens/src/features/train/session/presentation/component/shot_q_review.dart';
import 'package:photo_view/photo_view.dart';
import '../../../../../core/theme/theme_data/theme_data.dart';
import '../../data/model/session_model.dart';
import '../bloc/checkbox_bloc/checkbox_bloc.dart';
import '../bloc/checkbox_bloc/checkbox_event.dart';
import '../bloc/checkbox_bloc/checkbox_state.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SessionAlbumScreen extends StatefulWidget {
  const SessionAlbumScreen({super.key});

  @override
  State<SessionAlbumScreen> createState() => _SessionAlbumScreenState();
}

class _SessionAlbumScreenState extends State<SessionAlbumScreen> {
  @override
  Widget build(BuildContext context) {
    // BotToast.closeAllLoading();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.h),
      child: BlocBuilder<SessionBloc, SessionState>(
        builder: (_, stateSession) {
          if (stateSession is ShootState) {
            List<ShootModel> filtered = stateSession.sessionModel.listShots ==
                    null
                ? []
                : stateSession.sessionModel.listShots!
                    .where((s) => !(stateSession.sessionModel.listShots!
                                .where((x) => x.shootNumber == s.shootNumber)
                                .length >
                            1 &&
                        (s.splitTime?.isEmpty ?? true)))
                    .toList();
            return BlocProvider(
              create: (ctx) => CheckboxBloc(filtered.length ?? 0,
                  filtered.map((e) => e.shootImagePath ?? '').toList() ?? []),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(8),
                      Visibility(
                        visible:
                            stateSession.sessionModel.showSliderImages != true,
                        child: BlocBuilder<CheckboxBloc, CheckboxState>(
                          builder: (context, state) {
                            return Container(
                              padding: const EdgeInsets.all(6.0),
                              decoration: r8Decoration,
                              child: Row(
                                children: [
                                  // Text(
                                  //   'Session ID: ${stateSession.sessionModel.sessionId ?? ''}',
                                  //   style: TextStyle(
                                  //       color: AppColors.white,
                                  //       fontWeight: FontWeight.w700),
                                  // ),
                                  const Spacer(),
                                  if (state.selectedCount > 0)
                                    GestureDetector(
                                      onTap: () async {
                                        BotToast.showLoading();
                                        for (var i = 0;
                                            i < state.selectedCount;
                                            i++) {
                                          await Gal.putImage(
                                              state.itemsSelected[i].title);
                                        }
                                        BotToast.closeAllLoading();
                                        if (context.mounted) {
                                          context
                                              .read<CheckboxBloc>()
                                              .add(ToggleMainCheckbox(false));
                                        }
                                        toast(
                                            'Selected images saved to gallery!');
                                      },
                                      child: Text(
                                        'Download (${state.selectedCount})',
                                        style: s13w400regularFont(
                                            color: AppColors.kPrimaryColor),
                                      ),
                                    ),
                                  AppCheckBox(
                                    scale: 1.2,
                                    valuee: state.isMainSelected,
                                    isCheckBox: true,
                                    onChanged: (p0) {
                                      context
                                          .read<CheckboxBloc>()
                                          .add(ToggleMainCheckbox(p0));
                                    },
                                  ),
                                  Text('Selected (${state.selectedCount})',
                                      style: s13w400regularFont()),
                                  const Gap(8),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      stateSession.sessionModel.showSliderImages == true
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // const Gap(4),
                                ModifiedContainer(
                                  height: 34.h,
                                  width: 34.h,
                                  borderRadius: 100,
                                  color: AppColors.kPrimaryColor,
                                  child: Icon(
                                    Icons.arrow_back_rounded,
                                    color: AppTheme.textPrimary(context),
                                  ),
                                  onTap: () {
                                    toast(null);
                                    // if (currentIndex == 0) {
                                    //   currentIndex = (stateSession.sessionModel
                                    //               .listShots?.length ??
                                    //           0) -
                                    //       1;
                                    //   itemScrollController.scrollTo(
                                    //       duration:
                                    //           const Duration(milliseconds: 300),
                                    //       index: currentIndex);
                                    // } else {
                                    //   currentIndex = currentIndex - 1;
                                    //   itemScrollController.scrollTo(
                                    //       duration:
                                    //           const Duration(milliseconds: 300),
                                    //       index: currentIndex);
                                    // }
                                  },
                                ),
                                SizedBox(
                                  height: 0.7.sh,
                                  width: 0.6.sw,
                                  // child: ScrollablePositionedList.builder(
                                  //
                                  //   shrinkWrap: true,
                                  //   itemScrollController: itemScrollController,
                                  //   physics: const BouncingScrollPhysics(),
                                  //   scrollDirection: Axis.horizontal,
                                  //   itemCount: stateSession
                                  //           .sessionModel.listShots?.length ??
                                  //       0,
                                  //   itemBuilder: (context, i) {
                                  //     // currentIndex = i;
                                  //     print("qqqqqqqq$i");
                                  //     return Padding(
                                  //       padding: const EdgeInsets.symmetric(
                                  //           horizontal: 4),
                                  //       child: ClipRRect(
                                  //         borderRadius: const BorderRadius.all(
                                  //             Radius.circular(12)),
                                  //         child:        stateSession
                                  //             .sessionModel
                                  //             .listShots?[i]
                                  //             .shootScore !=
                                  //             0?Image.file(
                                  //           fit: BoxFit.fill,
                                  //           File(stateSession
                                  //                   .sessionModel
                                  //                   .listShots?[currentIndex]
                                  //                   .shootImagePath ??
                                  //               ''),
                                  //           height: 0.7.sh,
                                  //           width: 0.7.sh,                                          ):
                                  //         ClipRRect(
                                  //             borderRadius:
                                  //             const BorderRadius
                                  //                 .all(
                                  //                 Radius.circular(
                                  //                     12)),
                                  //             child: Container(
                                  //               height: 0.7.sh,
                                  //               width: 0.7.sh,
                                  //               padding: EdgeInsets.symmetric(horizontal: 10.h),
                                  //               color: Colors.white,
                                  //               child: Center(
                                  //                 child: Text(
                                  //                   "Shot ${i+1} is outside from rings, so score is 0 ",
                                  //                   style: TextStyle(
                                  //                       color:
                                  //                       Colors.red),
                                  //                 ),
                                  //               ),
                                  //             )),
                                  //       ),
                                  //     );
                                  //   },
                                  // ),
                                  child: ShotsCarousel(
                                    shots: filtered,
                                    onPageChanged: (idx) {
                                      setState(() {
                                        currentIndex = idx;
                                      });
                                      debugPrint(
                                          "Now showing shot #${idx + 1}");
                                    },
                                    initialPage: currentIndex,
                                  ),
                                ),
                                // const Gap(4),
                                ModifiedContainer(
                                  height: 34.h,
                                  width: 34.h,
                                  borderRadius: 100,
                                  color: AppColors.kPrimaryColor,
                                  // color: Theme.of(context).primaryColor,
                                  child: Icon(
                                    Icons.arrow_forward_rounded,
                                    color: AppTheme.textPrimary(context),
                                  ),
                                  onTap: () {
                                    toast(null);

                                    if (currentIndex ==
                                        (filtered.length ?? 0) - 1) {
                                      currentIndex = 0;
                                      itemScrollController.scrollTo(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          index: currentIndex);
                                    } else {
                                      currentIndex = currentIndex + 1;
                                      itemScrollController.scrollTo(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          index: currentIndex);
                                    }
                                  },
                                ),
                                Gap(16.w),

                                SizedBox(
                                  width: 0.2.sw,
                                  height: 0.7.sh,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,

                                        child:  IconButton(
                                          onPressed: () {
                                            context.read<SessionBloc>().add(
                                                ShootEvent(
                                                    sessionModel: stateSession
                                                        .sessionModel
                                                        .copyWith(
                                                        showSliderImages:
                                                        false)));
                                          },
                                          icon: Icon(
                                            Icons.close,
                                            color:
                                            AppTheme.textPrimary(context),
                                          )),),

                                      Gap(8.h),
                                      Text(
                                        'Session ID:   ${stateSession.sessionModel.sessionId ?? ''}',
                                        style: TextStyle(
                                            color:
                                                AppTheme.textPrimary(context),
                                            fontWeight: FontWeight.w700),
                                      ),
                                      // Gap(12.h),
                                      // Row(
                                      //   mainAxisAlignment:
                                      //       MainAxisAlignment.spaceBetween,
                                      //   children: [
                                      //     Text(
                                      //       'Total Score:',
                                      //       style: TextStyle(
                                      //           color: AppColors.white,
                                      //           fontFamily: AppFontFamily.regular,
                                      //           fontSize: 15.h),
                                      //     ),
                                      //     Text(
                                      //       '${stateSession.sessionModel.totalScores ?? ''}',
                                      //       style: TextStyle(
                                      //           color: AppColors.white,
                                      //           fontFamily: AppFontFamily.regular,
                                      //           fontSize: 15.h),
                                      //     )
                                      //   ],
                                      // ),
                                      Gap(8.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Shot Number:',
                                            style: TextStyle(
                                                color: AppTheme.textPrimary(
                                                    context),
                                                fontFamily:
                                                    AppFontFamily.regular,
                                                fontSize: 14.sp),
                                          ),
                                          Text(
                                            '${filtered[currentIndex].shootNumber ?? ''}',
                                            style: TextStyle(
                                                color: AppTheme.textPrimary(
                                                    context),
                                                fontFamily:
                                                    AppFontFamily.regular,
                                                fontSize: 12.sp),
                                          )
                                        ],
                                      ),
                                      Gap(8.h),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Shot Score:',
                                            style: TextStyle(
                                                color: AppColors.white,
                                                fontFamily:
                                                    AppFontFamily.regular,
                                                fontSize: 14.sp),
                                          ),
                                          Text(
                                            '${filtered[currentIndex].shootScore ?? ''}',
                                            style: TextStyle(
                                                color: AppColors.white,
                                                fontFamily:
                                                    AppFontFamily.regular,
                                                fontSize: 12.sp),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          : Wrap(
                              children: List.generate(
                              filtered.length ?? 0,
                              (i) => ModifiedContainer(
                                // height: 100,
                                // width: 100,
                                padding: const EdgeInsets.all(4.0),
                                margin: const EdgeInsets.all(5.0),
                                borderRadius: 12,
                                color: AppColors.white,
                                child: BlocBuilder<CheckboxBloc, CheckboxState>(
                                  builder: (ctx, state) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap:
                                              // stateSession
                                              //                   .sessionModel
                                              //                   .listShots?[i]
                                              //                   .shootScore !=
                                              //               0
                                              //           ?
                                              () {
                                            context.read<SessionBloc>().add(
                                                ShootEvent(
                                                    sessionModel: stateSession
                                                        .sessionModel
                                                        .copyWith(
                                                            showSliderImages:
                                                                true)));
                                            currentIndex = i;
                                            Future.delayed(
                                              const Duration(milliseconds: 300),
                                              () {
                                                itemScrollController.scrollTo(
                                                    duration: const Duration(
                                                        milliseconds: 1),
                                                    index: i);
                                              },
                                            );
                                          },
                                          // : null,
                                          onLongPress:
                                              // stateSession
                                              //                   .sessionModel
                                              //                   .listShots?[i]
                                              //                   .shootScore !=
                                              //               0
                                              //           ?
                                              () {
                                            ctx.read<CheckboxBloc>().add(
                                                LongPressItem(
                                                    i,
                                                    stateSession
                                                            .sessionModel
                                                            .listShots?[i]
                                                            .shootImagePath ??
                                                        ''));
                                          },
                                          // : null,
                                          child: Stack(
                                            children: [
                                              // stateSession
                                              //             .sessionModel
                                              //             .listShots?[i]
                                              //             .shootScore !=
                                              //         0
                                              //     ?
                                              ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(12)),
                                                child: Image.file(
                                                    fit: BoxFit.cover,
                                                    File(stateSession
                                                            .sessionModel
                                                            .listShots?[i]
                                                            .shootImagePath ??
                                                        ''),
                                                    width: 160.h,
                                                    height: 160.h),
                                              ),
                                              // : ClipRRect(
                                              //     borderRadius:
                                              //         const BorderRadius
                                              //             .all(
                                              //             Radius.circular(
                                              //                 12)),
                                              //     child: Container(
                                              //       width: 160.h,
                                              //       height: 160.h,
                                              //       padding: EdgeInsets
                                              //           .symmetric(
                                              //               horizontal:
                                              //                   10.h),
                                              //       color: Colors.white,
                                              //       child: Center(
                                              //         child: Text(
                                              //           "Shot ${i + 1} is outside from rings, so score is 0 ",
                                              //           style: TextStyle(
                                              //               color:
                                              //                   Colors.red),
                                              //         ),
                                              //       ),
                                              //     )),
                                              // stateSession
                                              //             .sessionModel
                                              //             .listShots?[i]
                                              //             .shootScore !=
                                              //         0
                                              //     ?
                                              Visibility(
                                                visible: state
                                                        .areCheckboxesVisible ||
                                                    state.isMainSelected,
                                                child: AppCheckBox(
                                                  scale: 1.2,
                                                  valuee: state.itemsSelected
                                                      .any((item) =>
                                                          item.index == i),
                                                  isCheckBox: true,
                                                  onChanged: (p0) {
                                                    ctx
                                                        .read<CheckboxBloc>()
                                                        .add(ToggleItemCheckbox(
                                                            i,
                                                            stateSession
                                                                    .sessionModel
                                                                    .listShots?[
                                                                        i]
                                                                    .shootImagePath ??
                                                                ''));
                                                  },
                                                ),
                                              )
                                              // : SizedBox()
                                            ],
                                          ),
                                        ),
                                        Gap(4.h),
                                        Text(
                                            filtered[i].shootScore==0?"Shot ${i + 1} is outside from rings,\nso score is 0":'Shot#${i + 1}  Score: ${filtered[i].shootScore}',
                                            style: s12w400regularFont(
                                                color:filtered[i].shootScore==0? AppColors.kRedColor:AppColors.black))
                                      ],
                                    );
                                  },
                                ),
                              ),
                            )),
                    ]),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  final ItemScrollController itemScrollController = ItemScrollController();
  int currentIndex = 0;
}

class ImageFullscreenPage extends StatelessWidget {
  final ImageProvider imageProvider;

  const ImageFullscreenPage({Key? key, required this.imageProvider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: PhotoView(
        imageProvider: imageProvider,
        initialScale: PhotoViewComputedScale.contained,
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.covered * 4,
        backgroundDecoration: const BoxDecoration(color: Colors.black),
        enableRotation: false,
        heroAttributes: PhotoViewHeroAttributes(tag: imageProvider),
      ),
    );
  }
}

class ShotsCarousel extends StatefulWidget {
  final List<ShootModel> shots;
  final ValueChanged<int>? onPageChanged;
  final double viewportFraction;
  final double pageGap;
  final int initialPage;

  const ShotsCarousel({
    Key? key,
    required this.shots,
    this.onPageChanged,
    this.viewportFraction = 0.8,
    this.pageGap = 16.0,
    required this.initialPage,
  }) : super(key: key);

  @override
  _ShotsCarouselState createState() => _ShotsCarouselState();
}

class _ShotsCarouselState extends State<ShotsCarousel> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      viewportFraction: widget.viewportFraction,
      initialPage: widget.initialPage,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final squareSize =
        MediaQuery.of(context).size.width * widget.viewportFraction;

    return SizedBox(
      height: squareSize,
      child: PageView.builder(
        controller: _controller,
        itemCount: widget.shots.length,
        pageSnapping: true,
        onPageChanged: widget.onPageChanged,
        itemBuilder: (context, i) {
          final shot = widget.shots[i];
          final imageProvider = FileImage(File(shot.shootImagePath!));

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.pageGap / 2),
            child: SizedBox(
              width: squareSize,
              height: squareSize,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child:
                      // shot.shootScore != 0
                      //     ?
                      GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) =>
                            ImageFullscreenPage(imageProvider: imageProvider),
                      ));
                    },
                    child: Hero(
                      tag: imageProvider,
                      child: Image(image: imageProvider, fit: BoxFit.cover),
                    ),
                  )
                  // : Container(
                  //     color: Colors.white,
                  //     alignment: Alignment.center,
                  //     child: Text(
                  //       "Shot ${i + 1} missed (score 0)",
                  //       style: const TextStyle(color: Colors.red),
                  //       textAlign: TextAlign.center,
                  //     ),
                  //   ),
                  ),
            ),
          );
        },
      ),
    );
  }
}

// class ShotsCarousel extends StatefulWidget {
//   final List<ShootModel> shots;
//   final ValueChanged<int>? onPageChanged;
//   /// fraction of viewport each page should occupy (0.0–1.0)
//   final double viewportFraction;
//   /// horizontal gap between pages
//   final double pageGap;
//   final int initialPage;
//
//   const ShotsCarousel({
//     super.key,
//     required this.shots,
//     this.onPageChanged,
//     this.viewportFraction = 0.8,
//     this.pageGap = 16.0, required this.initialPage,
//   });
//
//   @override
//   _ShotsCarouselState createState() => _ShotsCarouselState();
// }
//
// class _ShotsCarouselState extends State<ShotsCarousel> {
//   late final PageController _controller;
//   int _currentPage = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = PageController(
//       viewportFraction: widget.viewportFraction,
//       initialPage: widget.initialPage,
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final shots = widget.shots;
//     // calculate the square size based on screen width & your viewportFraction
//     final squareSize = MediaQuery.of(context).size.width * widget.viewportFraction;
//
//     return         SizedBox(
//       height: squareSize,   // fix height = width * fraction
//       child: PageView.builder(
//         controller: _controller,
//         itemCount: shots.length,
//         pageSnapping: true,
//         onPageChanged: (i) {
//           widget.onPageChanged?.call(i);
//
//         },
//         itemBuilder: (context, i) {
//           final shot = shots[i];
//           return Padding(
//             padding: EdgeInsets.symmetric(horizontal: widget.pageGap/2),
//             child: SizedBox(
//               width: squareSize,
//               height: squareSize,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(12),
//                 child: shot.shootScore != 0
//                     ? Image.file(
//                   File(shot.shootImagePath!),
//                   fit: BoxFit.fill,
//                 )
//                     : Container(
//                   color: Colors.white,
//                   alignment: Alignment.center,
//                   child: Text(
//                     "Shot ${i + 1} missed (score 0)",
//                     style: TextStyle(color: Colors.red),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//
// }
