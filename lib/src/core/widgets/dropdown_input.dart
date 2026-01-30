// // ignore_for_file: must_be_immutable

// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:kennel_boss/utils/utils.dart';
// import '../core/models/get_dam_model.dart';
// import '../utils/colors.dart';
// import 'modified_container.dart';
// import 'simple_text_field.dart';

// class AppDropdownInput<T> extends StatelessWidget {
//   final String labelText;
//   final String? hintText;
//   final List<T> options;
//   final T? value;
//   final String Function(T) getLabel;
//   final void Function(T?)? onChanged;
//   final EdgeInsetsGeometry? contentPadding;
//   final bool? isDence;
//   final double? borderRadius;
//   final String? validationText;

//   const AppDropdownInput({
//     super.key,
//     this.labelText = '',
//     this.hintText,
//     this.options = const [],
//     required this.getLabel,
//     this.value,
//     this.onChanged,
//     this.contentPadding,
//     this.isDence,
//     this.borderRadius,
//     this.validationText,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: FormField<T>(
//         validator: (valuee) {
//           // value == null || value == '' ? 'Select Any Option' : null;
//           // log('$value');
//           // // log('$valuee');
//           // return null;
//           if (value == null || value == '') {
//             return validationText ?? 'Select an option';
//           } else {
//             return null;
//           }
//         },
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         builder: (FormFieldState<T> state) {
//           return InputDecorator(
//             decoration: InputDecoration(
//               isDense: isDence,
//               contentPadding: contentPadding ??
//                   const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
//               labelText: labelText,
//               hintText: hintText,
//               enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(borderRadius ?? 6.0),
//                   borderSide: const BorderSide(
//                     color: kLightBlackColor,
//                   )),
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(borderRadius ?? 6.0),
//                   borderSide: const BorderSide(
//                     color: kLightBlackColor,
//                   )),
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(borderRadius ?? 6.0),
//                   borderSide: const BorderSide(
//                     color: kPrimaryColor,
//                   )),
//               errorText:
//                   state.errorText, // Display error text if validation fails
//             ),
//             isEmpty: value == null || value == '',
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton<T>(
//                 menuMaxHeight: 300,
//                 isExpanded: true,
//                 value: value,
//                 isDense: true,
//                 onChanged: (newValue) {
//                   state.didChange(newValue);
//                   if (onChanged != null) {
//                     onChanged!(newValue);
//                   }
//                 },
//                 items: options.map((T value) {
//                   return DropdownMenuItem<T>(
//                     enabled: true,
//                     value: value,
//                     child: Text(getLabel(value)),
//                   );
//                 }).toList(),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class DamDropdownInput extends StatelessWidget {
//   final String hintText;
//   final List<GetDamData> options;
//   final GetDamData? value;
//   final String Function(GetDamData) getLabel;
//   final void Function(GetDamData?)? onChanged;
//   final EdgeInsetsGeometry? contentPadding;
//   final bool? isDence;
//   final double? borderRadius;

//   const DamDropdownInput(
//       {super.key,
//       this.hintText = 'Please select an Option',
//       this.options = const [],
//       required this.getLabel,
//       this.value,
//       this.onChanged,
//       this.contentPadding,
//       this.isDence,
//       this.borderRadius});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: FormField<GetDamData>(
//         autovalidateMode: AutovalidateMode.onUserInteraction,
//         builder: (FormFieldState<GetDamData> state) {
//           return InputDecorator(
//             decoration: InputDecoration(
//               isDense: isDence,
//               contentPadding: contentPadding ??
//                   const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
//               labelText: hintText,
//               enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(borderRadius ?? 18.0),
//                   borderSide:
//                       const BorderSide(color: kLightBlackColor, width: 2)),
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(borderRadius ?? 18.0),
//                   borderSide:
//                       const BorderSide(color: kLightBlackColor, width: 2)),
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(borderRadius ?? 18.0),
//                   borderSide: const BorderSide(color: kPrimaryColor, width: 2)),
//             ),
//             isEmpty: value == null,
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton<GetDamData>(
//                 menuMaxHeight: 300,
//                 isExpanded: true,
//                 value: value,
//                 isDense: true,
//                 onChanged: onChanged,
//                 items: options.map((GetDamData value) {
//                   return DropdownMenuItem<GetDamData>(
//                     enabled: true,
//                     value: value,
//                     child: Text(getLabel(value)),
//                   );
//                 }).toList(),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class AppDropdown<T> extends StatefulWidget {
//   final String hintText;
//   final List<T> options;
//   T? value;
//   final String Function(T) getLabel;
//   Function(T)? getNewvalue;
//   final void Function()? onChanged;
//   EdgeInsetsGeometry? contentPadding;
//   bool? isDence;
//   double? borderRadius;

//   AppDropdown(
//       {super.key,
//       this.hintText = 'Please select an Option',
//       this.options = const [],
//       required this.getLabel,
//       this.value,
//       this.getNewvalue,
//       this.onChanged,
//       this.contentPadding,
//       this.isDence,
//       this.borderRadius});

//   @override
//   State<AppDropdown<T>> createState() => _AppDropdownState<T>();
// }

// class _AppDropdownState<T> extends State<AppDropdown<T>> {
//   // T? valuee;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8),
//       child: FormField<T>(
//         // validator: (val) => val != null ? null : 'Select option',
//         builder: (FormFieldState<T> state) {
//           return InputDecorator(
//             decoration: InputDecoration(
//               isDense: widget.isDence,
//               contentPadding: widget.contentPadding ??
//                   const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
//               labelText: widget.hintText,
//               enabledBorder: OutlineInputBorder(
//                   borderRadius:
//                       BorderRadius.circular(widget.borderRadius ?? 18.0),
//                   borderSide:
//                       const BorderSide(color: kLightBlackColor, width: 2)),
//               border: OutlineInputBorder(
//                   borderRadius:
//                       BorderRadius.circular(widget.borderRadius ?? 18.0),
//                   borderSide:
//                       const BorderSide(color: kLightBlackColor, width: 2)),
//               focusedBorder: OutlineInputBorder(
//                   borderRadius:
//                       BorderRadius.circular(widget.borderRadius ?? 18.0),
//                   borderSide: const BorderSide(color: kPrimaryColor, width: 2)),
//             ),
//             isEmpty: widget.value == null || widget.value == '',
//             child: DropdownButtonHideUnderline(
//               child: DropdownButtonFormField<T>(
//                 decoration: InputDecoration(
//                     border: InputBorder.none,
//                     isCollapsed: true,
//                     contentPadding: widget.contentPadding ??
//                         const EdgeInsets.symmetric(
//                             horizontal: 0.0, vertical: 0.0)),
//                 validator: (val) => val != null ? null : 'Select option',
//                 menuMaxHeight: 300,
//                 isExpanded: true,
//                 value: widget.value,
//                 isDense: true,
//                 onChanged: (value) {
//                   widget.getNewvalue!(value as T);
//                   setState(() {
//                     widget.value = value;
//                   });
//                 },
//                 items: widget.options.map((T value) {
//                   return DropdownMenuItem<T>(
//                     enabled: true,
//                     value: value,
//                     onTap: widget.onChanged,
//                     child: Text(widget.getLabel(value)),
//                   );
//                 }).toList(),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class DropDownListView extends StatefulWidget {
//   const DropDownListView(
//       {required this.items,
//       required this.callBack,
//       this.hint,
//       this.validationText,
//       required this.controller,
//       super.key});
//   final List<String> items;
//   final Function(String) callBack;
//   final String? hint, validationText;
//   final TextEditingController controller;
//   @override
//   State<DropDownListView> createState() => _DropDownListViewState();
// }

// class _DropDownListViewState extends State<DropDownListView> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         SimpleTextField(
//           readOnly: true,
//           controller: widget.controller,
//           hintText: widget.hint,
//           validationText: widget.validationText,
//           onTap: () {
//             tapped = !tapped;
//             setState(() {});
//           },
//           suffixIcon:
//               Icon(tapped ? Icons.arrow_drop_up : Icons.arrow_drop_down),
//         ),
//         if (tapped) const Gap(5),
//         if (tapped)
//           ModifiedContainer(
//             borderRadius: 8,
//             borderColor: kLightBlackColor,
//             height: widget.items.length == 1 || widget.items.length == 2
//                 ? 106
//                 : widget.items.length == 3
//                     ? 156
//                     : 200,
//             child: ListView.builder(
//               padding: EdgeInsets.zero,
//               itemCount: widget.items.length,
//               itemBuilder: (ctx, i) {
//                 return InkWell(
//                   onTap: () {
//                     widget.controller.text = widget.items[i];
//                     tapped = false;
//                     widget.callBack('true');
//                     setState(() {});
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: kWhiteColor,
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(8)),
//                         border: Border(
//                             bottom: BorderSide(color: Colors.grey.shade300))),
//                     child: Padding(
//                       padding: const EdgeInsets.all(14.0),
//                       child: Text(
//                         widget.items[i],
//                         style: poppinsStyle().copyWith(
//                             fontSize: 15, color: const Color(0xff79747E)),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//       ],
//     );
//   }

//   bool tapped = false;
//   // late TextEditingController controller;

//   @override
//   void initState() {
//     // controller = TextEditingController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     // controller.dispose();
//     super.dispose();
//   }
// }

// class GenericDropDownLV<T> extends StatefulWidget {
//   const GenericDropDownLV({
//     required this.items,
//     required this.getLabel,
//     this.hint,
//     required this.controller,
//     required this.showTextField,
//     required this.callback,
//     super.key,
//   });
//   final List<T> items;
//   final String Function(T) getLabel;
//   final void Function(T) callback;
//   final String? hint;
//   final TextEditingController controller;
//   final bool showTextField;
//   @override
//   State<GenericDropDownLV<T>> createState() => _GenericDropDownLVState<T>();
// }

// class _GenericDropDownLVState<T> extends State<GenericDropDownLV<T>> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         if (widget.showTextField)
//           SimpleTextField(
//             readOnly: true,
//             controller: widget.controller,
//             hintText: widget.hint,
//             validationText: widget.hint,
//             onTap: () {
//               tapped = !tapped;
//               setState(() {});
//             },
//           ),
//         if (tapped) const Gap(5),
//         if (tapped)
//           ModifiedContainer(
//             borderRadius: 8,
//             borderColor: kLightBlackColor,
//             height: 200,
//             child: ListView.builder(
//               padding: EdgeInsets.zero,
//               itemCount: widget.items.length,
//               itemBuilder: (ctx, i) {
//                 return InkWell(
//                   onTap: () {
//                     widget.controller.text = widget.getLabel(widget.items[i]);
//                     tapped = false;
//                     widget.callback(widget.items[i]);
//                     setState(() {});
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: kWhiteColor,
//                         borderRadius:
//                             const BorderRadius.all(Radius.circular(8)),
//                         border: Border(
//                             bottom: BorderSide(color: Colors.grey.shade300))),
//                     child: Padding(
//                       padding: const EdgeInsets.all(14.0),
//                       child: Text(
//                         widget.getLabel(widget.items[i]),
//                         style: poppinsStyle().copyWith(
//                             fontSize: 15, color: const Color(0xff79747E)),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//       ],
//     );
//   }

//   bool tapped = false;
//   // late TextEditingController controller;

//   @override
//   void initState() {
//     // controller = TextEditingController();
//     tapped = !widget.showTextField;
//     super.initState();
//   }

//   @override
//   void dispose() {
//     // controller.dispose();
//     super.dispose();
//   }
// }
