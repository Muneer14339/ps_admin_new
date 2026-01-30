// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_core/theme.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';
//
// import '../../../../core/theme/color/app_colors_new.dart';
// import '../../../../core/theme/font/app_fonts.dart';
//
// class SessionHistoryView extends StatefulWidget {
//   const SessionHistoryView({super.key});
//
//   @override
//   State<SessionHistoryView> createState() => _SessionHistoryViewState();
// }
//
// class _SessionHistoryViewState extends State<SessionHistoryView> {
//   final DateRangePickerController dateRangePickerController =
//   DateRangePickerController();
//   DateRangePickerView view = DateRangePickerView.month;
//
//   final List<SessionSummaryEntity> _sessionSummary = [];
//   List<double> timeList = [];
//   RxBool isLoading = false.obs;
//   RxString currentDate = "".obs;
//
//   @override
//   void initState() {
//     super.initState();
//     dateRangePickerController.view = DateRangePickerView.month;
//     Timer(const Duration(seconds: 0), () {
//       setState(() {
//         controller.firstTimeData();
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     dateRangePickerController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: EdgeInsets.symmetric(horizontal: 16),
//       children: [
//         SizedBox(height: 10.h),
//         Row(children: [
//           Expanded(
//               child: Text("Select Your Training Period",
//                   style: TextStyle(
//                       color: AppColors.white,
//                       fontFamily: AppFontFamily.regular,
//                       fontSize: 18.sp)))
//         ]),
//         SizedBox(height: 15.h),
//         Container(
//             margin: EdgeInsets.only(bottom: 12.h),
//             decoration: BoxDecoration(
//               color: AppColors.black,
//               borderRadius: BorderRadius.circular(8),
//               border: Border.all(color: AppColors.white, width: 0.2),
//             ),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: SfDateRangePickerTheme(
//                 data: SfDateRangePickerThemeData(
//                   backgroundColor: AppColors.greenColor,
//                   selectionColor: AppColors.primary,
//                   todayTextStyle: TextStyle(color: AppColors.white),
//                   activeDatesTextStyle: TextStyle(color: AppColors.white),
//                   leadingDatesTextStyle: TextStyle(color: AppColors.bg_gry),
//                   trailingDatesTextStyle: TextStyle(color: AppColors.bg_gry),
//                   specialDatesTextStyle: TextStyle(color: AppColors.yellow),
//                 ),
//                 child: SfDateRangePicker(
//                   onViewChanged: (dateRangePickerViewChangedArgs) {
//                     view = dateRangePickerViewChangedArgs.view;
//                     WidgetsBinding.instance.addPostFrameCallback((v) {
//                       setState(() {});
//                     });
//                   },
//                   cellBuilder: view != DateRangePickerView.month
//                       ? null
//                       : (BuildContext context,
//                       DateRangePickerCellDetails details) {
//                     bool isSpecialDate = controller.sessionSummaryList
//                         .any((e) =>
//                     DateFormat('yyyy/M/d').parse(e.date!) ==
//                         details.date);
//
//                     return Container(
//                       margin: const EdgeInsets.all(2),
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             details.date.day.toString(),
//                             style: TextStyle(
//                               color: AppColors.white,
//                               fontSize: 13,
//                             ),
//                           ),
//                           if (isSpecialDate)
//                             Container(
//                                 margin: const EdgeInsets.only(top: 3),
//                                 width: 4,
//                                 height: 4,
//                                 decoration: BoxDecoration(
//                                     color: AppColors.greenColor,
//                                     shape: BoxShape.circle))
//                         ],
//                       ),
//                     );
//                   },
//                   todayHighlightColor: AppColors.greenColor,
//                   backgroundColor: AppColors.calendarBackGround,
//                   selectionMode: DateRangePickerSelectionMode.single,
//                   view: view,
//                   showNavigationArrow: true,
//                   headerStyle: DateRangePickerHeaderStyle(
//                       backgroundColor: AppColors.calendarBackGround,
//                       textStyle: TextStyle(color: AppColors.greenColor)),
//                   monthViewSettings: DateRangePickerMonthViewSettings(
//                       showTrailingAndLeadingDates: true,
//                       specialDates: controller.sessionSummaryList
//                           .map((e) => DateFormat('yyyy/M/d').parse(e.date!))
//                           .toList(),
//                       weekNumberStyle: DateRangePickerWeekNumberStyle(
//                           textStyle: TextStyle(color: AppColors.white)),
//                       viewHeaderStyle: DateRangePickerViewHeaderStyle(
//                           textStyle: TextStyle(color: AppColors.yellow))),
//                   initialDisplayDate: DateTime.now(),
//                   initialSelectedDate: DateTime.now(),
//                   viewSpacing: 8,
//                   yearCellStyle: DateRangePickerYearCellStyle(
//                     leadingDatesTextStyle:
//                     TextStyle(color: AppColors.white),
//                     textStyle: TextStyle(color: AppColors.white),
//                     todayCellDecoration: BoxDecoration(
//                         backgroundBlendMode: BlendMode.colorDodge,
//                         color: AppColors.primary,
//                         border:
//                         Border.all(color: AppColors.greenColor, width: 1)),
//                     todayTextStyle: TextStyle(color: AppColors.white),
//                   ),
//                   onSelectionChanged:
//                       (DateRangePickerSelectionChangedArgs args) {
//                     if (args.value is DateTime) {
//                       DateTime selectedDate = args.value;
//                       controller.handleDateSelection(
//                           selectedDate, _sessionSummary, timeList);
//                       setState(() {
//                         currentDate.value =
//                             DateFormat('yyyy/M/d').format(selectedDate);
//                       });
//                     }
//                   },
//                 ),
//               ),
//             )),
//         Obx(() {
//           return controller.filteredSessionSummaryList.isNotEmpty
//               ? Container(
//               padding: const EdgeInsets.all(13),
//               decoration: BoxDecoration(
//                 color: AppColors.calendarBackGround,
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: AppColors.white, width: 0.1),
//               ),
//               child: Column(
//                 children: [
//                   Obx(() {
//                     return Text(
//                       controller.filteredSessionSummaryList.isNotEmpty
//                           ? controller.filteredSessionSummaryList[0].date ??
//                           'No Data'
//                           : 'No Data',
//                       style: TextStyle(
//                         color: AppColors.white,
//                         fontSize: 16.sp,
//                       ),
//                     );
//                   }),
//                   SizedBox(
//                     height: 22.h,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       onClickDataView(
//                         heading: "Total Time",
//                         value: Obx(() {
//                           return Text(
//                             controller.totalTime.isNotEmpty &&
//                                 controller.filteredSessionSummaryList
//                                     .isNotEmpty
//                                 ? '${controller.totalTime.reduce((value, element) => value + element).toStringAsFixed(3)}"'
//                                 : '0.00"',
//                             style: TextStyle(
//                               color: AppColors.white,
//                               fontSize: 16.sp,
//                             ),
//                           );
//                         }),
//                       ),
//                       onClickDataView(
//                         heading: "Total Shots",
//                         value: Obx(() {
//                           return Text(
//                             controller.totalShots.value.toString(),
//                             style: TextStyle(
//                               color: AppColors.white,
//                               fontSize: 16.sp,
//                             ),
//                           );
//                         }),
//                       ),
//                       onClickDataView(
//                         heading: "Best Split Time",
//                         value: Obx(() {
//                           return Text(
//                             '${(controller.totalSplitTime.value).toStringAsFixed(3)}"',
//                             style: TextStyle(
//                               color: AppColors.white,
//                               fontSize: 16.sp,
//                             ),
//                           );
//                         }),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 22.h,
//                   ),
//                   Divider(
//                     color: AppColors.white.withOpacity(0.4),
//                   ),
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Obx(() {
//                           return GestureDetector(
//                             onTap: controller
//                                 .filteredSessionSummaryList.isNotEmpty
//                                 ? () {
//                               controller.setFilterType(1.obs);
//                               controller.setHistoryTabType(0);
//
//                               Navigator.push(
//                                   context,
//                                   navigateWithAnimation(
//                                       const HistoryPage()));
//                             }
//                                 : null,
//                             child: Center(
//                               child: Text(
//                                 controller.filteredSessionSummaryList
//                                     .isNotEmpty
//                                     ? "See More"
//                                     : "No history available for this date",
//                                 style: TextStyle(
//                                   color: AppColors.greenColor,
//                                   fontFamily: AppFontFamily.regular,
//                                   fontSize: 14.sp,
//                                 ),
//                               ),
//                             ),
//                           );
//                         }),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                 ],
//               ))
//               : Container(
//               padding: const EdgeInsets.all(13),
//               decoration: BoxDecoration(
//                 color: AppColors.calendarBackGround,
//                 borderRadius: BorderRadius.circular(8),
//                 border: Border.all(color: AppColors.white, width: 0.1),
//               ),
//               child: Column(
//                 children: [
//                   Obx(() {
//                     return Text(
//                       controller.filteredSessionSummaryList.isNotEmpty
//                           ? controller.filteredSessionSummaryList[0].date ??
//                           currentDate.string
//                           : currentDate.string,
//                       style: TextStyle(
//                         color: AppColors.white,
//                         fontFamily: AppFontFamily.medium,
//                         fontSize: 16.sp,
//                       ),
//                     );
//                   }),
//                   SizedBox(
//                     height: 22.h,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       onClickDataView(
//                         heading: "Total Time",
//                         value: Obx(() {
//                           return Text(
//                             controller.totalTime.isNotEmpty &&
//                                 controller.filteredSessionSummaryList
//                                     .isNotEmpty
//                                 ? '${controller.totalTime.reduce((value, element) => value + element).toStringAsFixed(3)}"'
//                                 : '0.00"',
//                             style: TextStyle(
//                               color: AppColors.white,
//                               fontFamily: AppFontFamily.medium,
//                               fontSize: 16.sp,
//                             ),
//                           );
//                         }),
//                       ),
//                       onClickDataView(
//                         heading: "Total Shots",
//                         value: Obx(() {
//                           return Text(
//                             controller.totalShots.value.toString(),
//                             style: TextStyle(
//                               color: AppColors.white,
//                               fontFamily: AppFontFamily.medium,
//                               fontSize: 16.sp,
//                             ),
//                           );
//                         }),
//                       ),
//                       onClickDataView(
//                         heading: "Best Split Time",
//                         value: Obx(() {
//                           return Text(
//                             '${(controller.totalSplitTime.value).toStringAsFixed(3)}"',
//                             style: TextStyle(
//                               color: AppColors.white,
//                               fontFamily: AppFontFamily.medium,
//                               fontSize: 16.sp,
//                             ),
//                           );
//                         }),
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 22.h,
//                   ),
//                   Divider(
//                     color: AppColors.white.withOpacity(0.4),
//                   ),
//                   SizedBox(
//                     height: 10.h,
//                   ),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Obx(() {
//                           return GestureDetector(
//                             onTap: controller
//                                 .filteredSessionSummaryList.isNotEmpty
//                                 ? () {
//                               controller.setHistoryTabType(0);
//
//                               controller.setFilterType(1.obs);
//                               Navigator.push(
//                                   context,
//                                   navigateWithAnimation(
//                                       const HistoryPage()));
//                             }
//                                 : null,
//                             child: Center(
//                               child: Text(
//                                 controller.filteredSessionSummaryList
//                                     .isNotEmpty
//                                     ? "See More"
//                                     : "No history available for this date",
//                                 style: TextStyle(
//                                   color: AppColors.greenColor,
//                                   fontFamily: AppFontFamily.regular,
//                                   fontSize: 14.sp,
//                                 ),
//                               ),
//                             ),
//                           );
//                         }),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 5.h,
//                   ),
//                 ],
//               ));
//         }),
//         SizedBox(height: 20.h),
//       ],
//     );
//   }
//
//   onClickDataView({required String heading, required Widget value}) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           heading,
//           style: TextStyle(
//             color: AppColors.white,
//             fontFamily: AppFontFamily.regular,
//             fontSize: 12.sp,
//           ),
//         ),
//         SizedBox(height: 16.h),
//         value,
//       ],
//     );
//   }
//   InputDecoration inPutDecoration({required String label}) {
//     return InputDecoration(
//       // hintText: label,
//       labelText: label,
//       suffixIcon: Icon(Icons.calendar_month),
//       suffixIconColor: AppColors.greenColor,
//       // labelStyle: TextStyle(
//       //   color: AppColors.white,
//       //   fontFamily: AppFontFamily.regular,
//       //   fontSize: 14.sp,
//       // ),
//       labelStyle: TextStyle(
//         color: AppColors.white.withOpacity(0.5),
//         fontFamily: AppFontFamily.regular,
//         fontSize: 14.sp,
//       ),
//       // hintText: "Gun Type",
//       fillColor: AppColors.greyText,
//       enabled: true,
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: BorderSide(color: AppColors.white, width: 0.5),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: BorderSide(color: AppColors.white, width: 0.5),
//       ),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: BorderSide(color: AppColors.white, width: 0.5),
//       ),
//       contentPadding: EdgeInsets.all(16.0),
//     );
//   }
// }
//
// class Meeting {
//   Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);
//
//   String eventName;
//   DateTime from;
//   DateTime to;
//   Color background;
//   bool isAllDay;
// }
