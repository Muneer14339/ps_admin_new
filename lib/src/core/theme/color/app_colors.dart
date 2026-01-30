// import 'package:flutter/material.dart';

// class AppColors {
//   AppColors._();

//   static Color whiteColor = Colors.white;
//   static Color black = Colors.black;
//   static Color kRedColor = Colors.red;
//   static Color cancelText = HexColor('#DE0C00');
//   static Color orange = HexColor('#FF8B03');
//   static Color deepOrange = HexColor('#FE6B40');
//   static Color greyTextColor = HexColor('#7C7C7C');
//   static Color blackTextColor = HexColor('#101010');
//   static Color borderOutline = HexColor('#EEEEEE');
//   static Color dividerColor = HexColor('#000000').withOpacity(.1);
//   static Color greyColor = Colors.grey;
//   static Color greenColor = HexColor('#0DB30D');
//   static Color greyTextfieldBack = HexColor('#F1EFEE');
//   static Color profileTilesBack = HexColor('#F2F5F8');
//   static Color switchColor = HexColor('#6F9C3D');
//   static Color countBaseColor = HexColor('#F2F5F8');
//   static Color timeClearColor = HexColor('#FF0000');
//   static Color sliderDotsColor = HexColor('#D9D9D9');
// }

// class HexColor extends Color {
//   static int _getColorFromHex(String hexColor) {
//     hexColor = hexColor.toUpperCase().replaceAll("#", "");
//     if (hexColor.length == 6) {
//       hexColor = "FF$hexColor";
//     }

//     final hexNum = int.parse(hexColor, radix: 16);

//     if (hexNum == 0) {
//       return 0xff000000;
//     }

//     return hexNum;
//   }

//   HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
// }
