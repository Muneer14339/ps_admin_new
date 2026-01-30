import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pa_sreens/src/core/theme/color/app_colors_new.dart';
import '../text_styles/custom_text_styles.dart';

enum AppThemeEnum { Dark, Light }

Map<AppThemeEnum, ThemeData> kAppThemeData = {

  AppThemeEnum.Dark: ThemeData.dark().copyWith(
      cardColor: AppColors.bg_gry,
      unselectedWidgetColor: AppColors.kDarkTextColor,
      primaryColor: AppColors.kDarkPrimary,
      scaffoldBackgroundColor: Colors.transparent,
      dividerColor: AppColors.dividerColorDark,
      cardTheme: CardThemeData(
        color: AppColors.bacgroundPaintColorDark,
        shadowColor: AppColors.bacgroundPaintShadowDark,
      ),
      inputDecorationTheme:
          const InputDecorationTheme(fillColor: Color(0xff585858)),
      textTheme: const TextTheme().copyWith(
        headlineLarge:
            TextStyle(fontSize: 64.sp, color: AppColors.kDarkTextColor),
        displayLarge: CustomTextStyles.kDarkW500Regular36,
        headlineMedium: CustomTextStyles.kDarkW500Regular20,
        headlineSmall: CustomTextStyles.kDarkW600Regular10,
        titleLarge: CustomTextStyles.kDarkW500Bold40,
        titleMedium:
            TextStyle(fontSize: 20.sp, color: AppColors.kDarkTextColor),
        titleSmall: CustomTextStyles.kDarkW400Regular14,
        labelLarge: CustomTextStyles.kDarkBold35,
        labelMedium: CustomTextStyles.kDarkW400Bold16,
        labelSmall: CustomTextStyles.kDarkW400Regular8,
        bodySmall: CustomTextStyles.kDarkW400Regular12,
        bodyMedium: CustomTextStyles.kDarkW500Regular13,
        bodyLarge: CustomTextStyles.kDarkBodyLarge,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              elevation: WidgetStateProperty.all(0),
              minimumSize: WidgetStateProperty.all(Size(double.infinity, 56.h)),
              shape: WidgetStateProperty.all(const StadiumBorder()),
              foregroundColor: WidgetStateProperty.all(
                AppColors.kDarkTextColor,
              ),
              textStyle: WidgetStateProperty.all(TextStyle(
                fontSize: 16.sp,
                color: AppColors.kDarkTextColor,
              )))),
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(AppColors.kButtonColor),
              textStyle: WidgetStateProperty.all(TextStyle(
                fontSize: 16.sp,
                color: AppColors.kDarkTextColor,
              )))),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.kDarkPrimary,
          selectedItemColor: AppColors.kButtonColor,
          selectedIconTheme: IconThemeData(
            color: AppColors.kButtonColor,
            size: 24.sp,
          ),
          unselectedItemColor: AppColors.kButtonColor,
          unselectedIconTheme:
              IconThemeData(color: AppColors.kButtonColor, size: 20.sp)),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.kDarkPrimary,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        iconTheme: IconThemeData(color: AppColors.kIconColorDark),
        titleTextStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.kDarkTextColor),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
          refreshBackgroundColor: AppColors.kPrimaryColor),
      canvasColor: AppColors.kLightTextColor,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColors.kDarkPrimary,
      ),
      sliderTheme: SliderThemeData(
          valueIndicatorTextStyle: TextStyle(color: AppColors.kPrimaryColor))),

  //-------------------------------------------------- Light Theme

  AppThemeEnum.Light: ThemeData.light().copyWith(
    cardColor: AppColors.white,
    unselectedWidgetColor: AppColors.kLightTextColor,
    canvasColor: AppColors.profileTilesBack,
    dividerColor: AppColors.dividerColor,
    primaryColor: AppColors.kPrimaryColor,
    scaffoldBackgroundColor: Colors.transparent,
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: AppColors.kLightPrimary),
    inputDecorationTheme:
        const InputDecorationTheme(fillColor: AppColors.lighterGray),
    textTheme: const TextTheme().copyWith(
      headlineLarge:
          TextStyle(fontSize: 64.sp, color: AppColors.kLightTextColor),
      headlineMedium: CustomTextStyles.kLightW500Regular20,
      headlineSmall: CustomTextStyles.kLightW600Regular10,
      titleLarge: CustomTextStyles.kLightW500Bold40,
      titleMedium: TextStyle(fontSize: 20.sp, color: AppColors.kLightTextColor),
      titleSmall: CustomTextStyles.kLightW400Regular14,
      labelLarge: CustomTextStyles.kLightBold35,
      displayLarge: CustomTextStyles.kLightW500Regular36,
      labelMedium: CustomTextStyles.kLightW400Bold16,
      labelSmall: CustomTextStyles.kLightW400Regular8,
      bodySmall: CustomTextStyles.kLightW400Regular12,
      bodyMedium: CustomTextStyles.kLightW500Regular13,
      bodyLarge: CustomTextStyles.klightBodyLarge,
    ),
    cardTheme: CardThemeData(
      color: AppColors.bacgroundPaintColorLight,
      shadowColor: AppColors.bacgroundPaintShadowLight,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            elevation: WidgetStateProperty.all(5),
            minimumSize: WidgetStateProperty.all(Size(double.infinity, 56.h)),
            shape: WidgetStateProperty.all(const StadiumBorder()),
            foregroundColor: WidgetStateProperty.all(AppColors.kLightTextColor),
            textStyle: WidgetStateProperty.all(TextStyle(
              fontSize: 16.sp,
              color: AppColors.kLightTextColor,
            )))),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(AppColors.kButtonColor),
          textStyle: WidgetStateProperty.all(
              TextStyle(fontSize: 16.sp, color: AppColors.kLightTextColor))),
    ),
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: AppColors.kLightPrimary,
      titleTextStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.kLightTextColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.kButtonColor,
      selectedIconTheme:
          IconThemeData(color: AppColors.kButtonColor, size: 24.sp),
      unselectedItemColor: AppColors.kButtonColor,
      unselectedIconTheme: IconThemeData(
        color: AppColors.kButtonColor,
        size: 20.sp,
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
        refreshBackgroundColor: AppColors.kButtonColor,
        color: AppColors.kPrimaryColor,
        linearTrackColor: AppColors.kPrimaryColor.withOpacity(0.1)),

    // colorScheme: ColorScheme.light().copyWith(
    //   background: kLightPlaceholder,
    //   surface: kLightPlaceholderText,
    //   primary: kLightPrimary,
    //   secondary: kLightAccent,
    // ),
  )
};

class AppTheme {
  AppTheme._();

  // ============================================
  // PRIVATE COLOR CONSTANTS (Cannot be accessed directly)
  // ============================================
  static const _primaryTeal = Color(0xFFFF7F24);
  static const _accentTeal =  Color(0xFFFF7F24);
  static const _success = Color(0xFF4CAF50);
  static const _error = Color(0xFFFF5252);
  static const _warning = Color(0xFFFFA726);

  // Dark Theme Colors
  static const _darkBackground = Color(0xFF121212);
  static const _darkSurface = Color(0xFF1E1E1E);
  static const _darkSurfaceVariant = Color(0xFF2A2A2A);
  static const _darkTextPrimary = Color(0xFFFFFFFF);
  static const _darkTextSecondary = Color(0xFFB0B0B0);
  static const _darkBorder = Color(0xFF3A3A3A);

  // Light Theme Colors
  static const _lightBackground = Color(0xFFF5F5F5);
  static const _lightSurface = Color(0xFFFFFFFF);
  static const _lightSurfaceVariant = Color(0xFFEEEEEE);
  static const _lightTextPrimary = Color(0xFF121212);
  static const _lightTextSecondary = Color(0xFF666666);
  static const _lightBorder = Color(0xFFE0E0E0);

  // ============================================
  // THEME BUILDERS
  // ============================================
  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: _darkBackground,
      colorScheme: ColorScheme.dark(
        primary: _primaryTeal,
        secondary: _accentTeal,
        surface: _darkSurface,
        error: _error,
        onPrimary: _darkBackground,
        onSurface: _darkTextPrimary,
        onError: _darkTextPrimary,
        surfaceContainerHighest: _darkSurfaceVariant,
      ),
      cardTheme: CardThemeData(
        color: _darkSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: _primaryTeal.withOpacity(0.3)),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: _darkSurface,
        foregroundColor: _darkTextPrimary,
        elevation: 0,
        centerTitle: true,
        shape: Border(
          bottom: BorderSide(color: _primaryTeal.withOpacity(0.2)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryTeal,
          foregroundColor: _darkBackground,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _primaryTeal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: _primaryTeal,
          side: BorderSide(color: _primaryTeal, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _darkSurfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: _darkBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: _darkBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: _primaryTeal, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: _error),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        hintStyle: TextStyle(color: _darkTextSecondary),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: _primaryTeal,
        linearTrackColor: _darkSurfaceVariant,
      ),
      dividerTheme: DividerThemeData(
        color: _primaryTeal.withOpacity(0.2),
        thickness: 1,
        space: 1,
      ),
    );
  }

  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: _lightBackground,
      colorScheme: ColorScheme.light(
        primary: _primaryTeal,
        secondary: _accentTeal,
        surface: _lightSurface,
        error: _error,
        onPrimary: Colors.white,
        onSurface: _lightTextPrimary,
        onError: Colors.white,
        surfaceContainerHighest: _lightSurfaceVariant,
      ),
      cardTheme: CardThemeData(
        color: _lightSurface,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: _primaryTeal.withOpacity(0.2)),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: _lightSurface,
        foregroundColor: _lightTextPrimary,
        elevation: 0,
        centerTitle: true,
        shape: Border(
          bottom: BorderSide(color: _primaryTeal.withOpacity(0.2)),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryTeal,
          foregroundColor: Colors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _primaryTeal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: _primaryTeal,
          side: BorderSide(color: _primaryTeal, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _lightSurfaceVariant,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: _lightBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: _lightBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: _primaryTeal, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: _error),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        hintStyle: TextStyle(color: _lightTextSecondary),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: _primaryTeal,
        linearTrackColor: _lightSurfaceVariant,
      ),
      dividerTheme: DividerThemeData(
        color: _primaryTeal.withOpacity(0.2),
        thickness: 1,
        space: 1,
      ),
    );
  }

  // ============================================
  // PUBLIC COLOR GETTERS (Only way to access colors)
  // ============================================

  /// Primary color (Teal) - Same in both themes
  static Color primary(BuildContext context) => _primaryTeal;

  /// Secondary/Accent color (Light Teal) - Same in both themes
  static Color secondary(BuildContext context) => _accentTeal;

  /// Background color - Adapts to theme
  static Color background(BuildContext context) {
    return _isDark(context) ? _darkBackground : _lightBackground;
  }

  /// Surface color (for cards, dialogs) - Adapts to theme
  static Color surface(BuildContext context) {
    return _isDark(context) ? _darkBackground : _lightBackground;
  }

  /// Surface variant (for inputs, sections) - Adapts to theme
  static Color surfaceVariant(BuildContext context) {
    return _isDark(context) ? _darkSurfaceVariant : _lightSurfaceVariant;
  }

  /// Primary text color - Adapts to theme
  static Color textPrimary(BuildContext context) {
    return _isDark(context) ? _darkTextPrimary : _lightTextPrimary;
  }

  /// Secondary text color - Adapts to theme
  static Color textSecondary(BuildContext context) {
    return _isDark(context) ? _darkTextSecondary : _lightTextSecondary;
  }

  /// Border color - Adapts to theme
  static Color border(BuildContext context) {
    return _isDark(context) ? _lightBorder : _lightBorder;
  }

  /// Success color - Same in both themes
  static Color success(BuildContext context) => _success;

  /// Error color - Same in both themes
  static Color error(BuildContext context) => _error;

  /// Warning color - Same in both themes
  static Color warning(BuildContext context) => _warning;

  /// Primary gradient
  static LinearGradient primaryGradient() {
    return const LinearGradient(
      colors: [_primaryTeal, _accentTeal],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }

  // ============================================
  // COMMON TEXT STYLES (Consistent across app)
  // ============================================

  static TextStyle headingLarge(BuildContext context) => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textPrimary(context),
    letterSpacing: 0.15,
  );

  static TextStyle headingMedium(BuildContext context) => TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: textPrimary(context),
    letterSpacing: 0.15,
  );

  static TextStyle headingSmall(BuildContext context) => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: textPrimary(context),
    letterSpacing: 0.1,
  );

  static TextStyle titleLarge(BuildContext context) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textPrimary(context),
  );

  static TextStyle titleMedium(BuildContext context) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: textPrimary(context),
  );

  static TextStyle titleSmall(BuildContext context) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: textPrimary(context),
  );

  static TextStyle bodyLarge(BuildContext context) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: textPrimary(context),
    height: 1.5,
  );

  static TextStyle bodyMedium(BuildContext context) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: textPrimary(context),
    height: 1.5,
  );

  static TextStyle bodySmall(BuildContext context) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: textPrimary(context),
    height: 1.5,
  );

  static TextStyle labelLarge(BuildContext context) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: textSecondary(context),
  );

  static TextStyle labelMedium(BuildContext context) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: textSecondary(context),
  );

  static TextStyle labelSmall(BuildContext context) => TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: textSecondary(context),
  );

  static TextStyle caption(BuildContext context) => TextStyle(
    fontSize: 11,
    color: textSecondary(context),
  );

  static TextStyle button(BuildContext context) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: textPrimary(context),
    letterSpacing: 0.5,
  );

  // ============================================
  // COMMON SIZES (Consistent across app)
  // ============================================

  static const double radiusSmall = 4.0;
  static const double radiusMedium = 8.0;
  static const double radiusLarge = 12.0;
  static const double radiusXLarge = 16.0;

  static const double spacingXSmall = 4.0;
  static const double spacingSmall = 8.0;
  static const double spacingMedium = 12.0;
  static const double spacingLarge = 16.0;
  static const double spacingXLarge = 20.0;
  static const double spacingXXLarge = 24.0;

  static const double iconSmall = 16.0;
  static const double iconMedium = 20.0;
  static const double iconLarge = 24.0;
  static const double iconXLarge = 32.0;

  static const double buttonHeight = 48.0;
  static const double inputHeight = 48.0;

  static const double elevationLow = 2.0;
  static const double elevationMedium = 4.0;
  static const double elevationHigh = 8.0;

  // ============================================
  // COMMON PADDINGS (Consistent across app)
  // ============================================

  static const EdgeInsets paddingXSmall = EdgeInsets.all(4.0);
  static const EdgeInsets paddingSmall = EdgeInsets.all(8.0);
  static const EdgeInsets paddingMedium = EdgeInsets.all(12.0);
  static const EdgeInsets paddingLarge = EdgeInsets.all(16.0);
  static const EdgeInsets paddingXLarge = EdgeInsets.all(20.0);
  static const EdgeInsets paddingXXLarge = EdgeInsets.all(24.0);

  static const EdgeInsets paddingHorizontalSmall = EdgeInsets.symmetric(horizontal: 8.0);
  static const EdgeInsets paddingHorizontalMedium = EdgeInsets.symmetric(horizontal: 12.0);
  static const EdgeInsets paddingHorizontalLarge = EdgeInsets.symmetric(horizontal: 16.0);

  static const EdgeInsets paddingVerticalSmall = EdgeInsets.symmetric(vertical: 8.0);
  static const EdgeInsets paddingVerticalMedium = EdgeInsets.symmetric(vertical: 12.0);
  static const EdgeInsets paddingVerticalLarge = EdgeInsets.symmetric(vertical: 16.0);

  // ============================================
  // COMMON DECORATIONS
  // ============================================

  static BoxDecoration cardDecoration(BuildContext context) => BoxDecoration(
    color: surface(context),
    borderRadius: BorderRadius.circular(radiusXLarge),
    border: Border.all(
      color: primary(context).withOpacity(_isDark(context) ? 0.3 : 0.2),
    ),
    boxShadow: _isDark(context)
        ? [
      BoxShadow(
        color: Colors.black.withOpacity(0.3),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ]
        : [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 8,
        offset: const Offset(0, 2),
      ),
    ],
  );

  static BoxDecoration inputDecoration(BuildContext context) => BoxDecoration(
    color: surfaceVariant(context),
    borderRadius: BorderRadius.circular(radiusMedium),
    border: Border.all(color: border(context)),
  );

  static BoxDecoration buttonDecoration(BuildContext context) => BoxDecoration(
    color: primary(context),
    borderRadius: BorderRadius.circular(radiusMedium),
  );

  // ============================================
  // UTILITY METHODS
  // ============================================

  static bool _isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }

  /// Get color with opacity
  static Color withOpacity(Color color, double opacity) {
    return color.withOpacity(opacity);
  }
}


// class AppTheme {
//   AppTheme._();
//
//   // ============================================
//   // PRIVATE COLOR CONSTANTS (Cannot be accessed directly)
//   // ============================================
//   static const _primaryTeal = Color(0xFFFF7F24);
//   static const _accentTeal =  Color(0xFFFF7F24);
//   static const _success = Color(0xFF4CAF50);
//   static const _error = Color(0xFFFF5252);
//   static const _warning = Color(0xFFFFA726);
//
//   // Dark Theme Colors
//   static const _darkBackground = Color(0xFF121212);
//   static const _darkSurface = Color(0xFF1E1E1E);
//   static const _darkSurfaceVariant = Color(0xFF2A2A2A);
//   static const _darkTextPrimary = Color(0xFFFFFFFF);
//   static const _darkTextSecondary = Color(0xFFB0B0B0);
//   static const _darkBorder = Color(0xFF3A3A3A);
//
//   // Light Theme Colors
//   static const _lightBackground = Color(0xFFF5F5F5);
//   static const _lightSurface = Color(0xFFFFFFFF);
//   static const _lightSurfaceVariant = Color(0xFFEEEEEE);
//   static const _lightTextPrimary = Color(0xFF121212);
//   static const _lightTextSecondary = Color(0xFF666666);
//   static const _lightBorder = Color(0xFFE0E0E0);
//
//   // ============================================
//   // THEME BUILDERS
//   // ============================================
//   static ThemeData darkTheme() {
//     return ThemeData(
//       useMaterial3: true,
//       brightness: Brightness.dark,
//       scaffoldBackgroundColor: _darkBackground,
//       colorScheme: ColorScheme.dark(
//         primary: _primaryTeal,
//         secondary: _accentTeal,
//         surface: _darkSurface,
//         error: _error,
//         onPrimary: _darkBackground,
//         onSurface: _darkTextPrimary,
//         onError: _darkTextPrimary,
//         surfaceContainerHighest: _darkSurfaceVariant,
//       ),
//       cardTheme: CardThemeData(
//         color: _darkSurface,
//         elevation: 0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//           side: BorderSide(color: _primaryTeal.withOpacity(0.3)),
//         ),
//       ),
//       appBarTheme: AppBarTheme(
//         backgroundColor: _darkSurface,
//         foregroundColor: _darkTextPrimary,
//         elevation: 0,
//         centerTitle: true,
//         shape: Border(
//           bottom: BorderSide(color: _primaryTeal.withOpacity(0.2)),
//         ),
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: _primaryTeal,
//           foregroundColor: _darkBackground,
//           elevation: 0,
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//       ),
//       textButtonTheme: TextButtonThemeData(
//         style: TextButton.styleFrom(
//           foregroundColor: _primaryTeal,
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         ),
//       ),
//       outlinedButtonTheme: OutlinedButtonThemeData(
//         style: OutlinedButton.styleFrom(
//           foregroundColor: _primaryTeal,
//           side: BorderSide(color: _primaryTeal, width: 2),
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//         filled: true,
//         fillColor: _darkSurfaceVariant,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: _darkBorder),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: _darkBorder),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: _primaryTeal, width: 2),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: _error),
//         ),
//         contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         hintStyle: TextStyle(color: _darkTextSecondary),
//       ),
//       progressIndicatorTheme: ProgressIndicatorThemeData(
//         color: _primaryTeal,
//         linearTrackColor: _darkSurfaceVariant,
//       ),
//       dividerTheme: DividerThemeData(
//         color: _primaryTeal.withOpacity(0.2),
//         thickness: 1,
//         space: 1,
//       ),
//     );
//   }
//
//   static ThemeData lightTheme() {
//     return ThemeData(
//       useMaterial3: true,
//       brightness: Brightness.light,
//       scaffoldBackgroundColor: _lightBackground,
//       colorScheme: ColorScheme.light(
//         primary: _primaryTeal,
//         secondary: _accentTeal,
//         surface: _lightSurface,
//         error: _error,
//         onPrimary: Colors.white,
//         onSurface: _lightTextPrimary,
//         onError: Colors.white,
//         surfaceContainerHighest: _lightSurfaceVariant,
//       ),
//       cardTheme: CardThemeData(
//         color: _lightSurface,
//         elevation: 2,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//           side: BorderSide(color: _primaryTeal.withOpacity(0.2)),
//         ),
//       ),
//       appBarTheme: AppBarTheme(
//         backgroundColor: _lightSurface,
//         foregroundColor: _lightTextPrimary,
//         elevation: 0,
//         centerTitle: true,
//         shape: Border(
//           bottom: BorderSide(color: _primaryTeal.withOpacity(0.2)),
//         ),
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: _primaryTeal,
//           foregroundColor: Colors.white,
//           elevation: 2,
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//       ),
//       textButtonTheme: TextButtonThemeData(
//         style: TextButton.styleFrom(
//           foregroundColor: _primaryTeal,
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         ),
//       ),
//       outlinedButtonTheme: OutlinedButtonThemeData(
//         style: OutlinedButton.styleFrom(
//           foregroundColor: _primaryTeal,
//           side: BorderSide(color: _primaryTeal, width: 2),
//           padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         ),
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//         filled: true,
//         fillColor: _lightSurfaceVariant,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: _lightBorder),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: _lightBorder),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: _primaryTeal, width: 2),
//         ),
//         errorBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: _error),
//         ),
//         contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//         hintStyle: TextStyle(color: _lightTextSecondary),
//       ),
//       progressIndicatorTheme: ProgressIndicatorThemeData(
//         color: _primaryTeal,
//         linearTrackColor: _lightSurfaceVariant,
//       ),
//       dividerTheme: DividerThemeData(
//         color: _primaryTeal.withOpacity(0.2),
//         thickness: 1,
//         space: 1,
//       ),
//     );
//   }
//
//   // ============================================
//   // PUBLIC COLOR GETTERS (Only way to access colors)
//   // ============================================
//
//   /// Primary color (Teal) - Same in both themes
//   static Color primary(BuildContext context) => _primaryTeal;
//
//   /// Secondary/Accent color (Light Teal) - Same in both themes
//   static Color secondary(BuildContext context) => _accentTeal;
//
//   /// Background color - Adapts to theme
//   static Color background(BuildContext context) {
//     return _isDark(context) ? _darkBackground : _lightBackground;
//   }
//
//   /// Surface color (for cards, dialogs) - Adapts to theme
//   static Color surface(BuildContext context) {
//     return _isDark(context) ? _darkBackground : _lightBackground;
//   }
//
//   /// Surface variant (for inputs, sections) - Adapts to theme
//   static Color surfaceVariant(BuildContext context) {
//     return _isDark(context) ? _darkSurfaceVariant : _lightSurfaceVariant;
//   }
//
//   /// Primary text color - Adapts to theme
//   static Color textPrimary(BuildContext context) {
//     return _isDark(context) ? _darkTextPrimary : _lightTextPrimary;
//   }
//
//   /// Secondary text color - Adapts to theme
//   static Color textSecondary(BuildContext context) {
//     return _isDark(context) ? _darkTextSecondary : _lightTextSecondary;
//   }
//
//   /// Border color - Adapts to theme
//   static Color border(BuildContext context) {
//     return _isDark(context) ? _lightBorder : _lightBorder;
//   }
//
//   /// Success color - Same in both themes
//   static Color success(BuildContext context) => _success;
//
//   /// Error color - Same in both themes
//   static Color error(BuildContext context) => _error;
//
//   /// Warning color - Same in both themes
//   static Color warning(BuildContext context) => _warning;
//
//   /// Primary gradient
//   static LinearGradient primaryGradient() {
//     return const LinearGradient(
//       colors: [_primaryTeal, _accentTeal],
//       begin: Alignment.topLeft,
//       end: Alignment.bottomRight,
//     );
//   }
//
//   // ============================================
//   // COMMON TEXT STYLES (Consistent across app)
//   // ============================================
//
//   static TextStyle headingLarge(BuildContext context) => TextStyle(
//     fontSize: 24,
//     fontWeight: FontWeight.bold,
//     color: textPrimary(context),
//     letterSpacing: 0.15,
//   );
//
//   static TextStyle headingMedium(BuildContext context) => TextStyle(
//     fontSize: 20,
//     fontWeight: FontWeight.w600,
//     color: textPrimary(context),
//     letterSpacing: 0.15,
//   );
//
//   static TextStyle headingSmall(BuildContext context) => TextStyle(
//     fontSize: 18,
//     fontWeight: FontWeight.w600,
//     color: textPrimary(context),
//     letterSpacing: 0.1,
//   );
//
//   static TextStyle titleLarge(BuildContext context) => TextStyle(
//     fontSize: 16,
//     fontWeight: FontWeight.w600,
//     color: textPrimary(context),
//   );
//
//   static TextStyle titleMedium(BuildContext context) => TextStyle(
//     fontSize: 14,
//     fontWeight: FontWeight.w600,
//     color: textPrimary(context),
//   );
//
//   static TextStyle titleSmall(BuildContext context) => TextStyle(
//     fontSize: 12,
//     fontWeight: FontWeight.w600,
//     color: textPrimary(context),
//   );
//
//   static TextStyle bodyLarge(BuildContext context) => TextStyle(
//     fontSize: 16,
//     fontWeight: FontWeight.normal,
//     color: textPrimary(context),
//     height: 1.5,
//   );
//
//   static TextStyle bodyMedium(BuildContext context) => TextStyle(
//     fontSize: 14,
//     fontWeight: FontWeight.normal,
//     color: textPrimary(context),
//     height: 1.5,
//   );
//
//   static TextStyle bodySmall(BuildContext context) => TextStyle(
//     fontSize: 12,
//     fontWeight: FontWeight.normal,
//     color: textPrimary(context),
//     height: 1.5,
//   );
//
//   static TextStyle labelLarge(BuildContext context) => TextStyle(
//     fontSize: 14,
//     fontWeight: FontWeight.w500,
//     color: textSecondary(context),
//   );
//
//   static TextStyle labelMedium(BuildContext context) => TextStyle(
//     fontSize: 12,
//     fontWeight: FontWeight.w500,
//     color: textSecondary(context),
//   );
//
//   static TextStyle labelSmall(BuildContext context) => TextStyle(
//     fontSize: 11,
//     fontWeight: FontWeight.w500,
//     color: textSecondary(context),
//   );
//
//   static TextStyle caption(BuildContext context) => TextStyle(
//     fontSize: 11,
//     color: textSecondary(context),
//   );
//
//   static TextStyle button(BuildContext context) => TextStyle(
//     fontSize: 14,
//     fontWeight: FontWeight.w600,
//     color: textPrimary(context),
//     letterSpacing: 0.5,
//   );
//
//   // ============================================
//   // COMMON SIZES (Consistent across app)
//   // ============================================
//
//   static const double radiusSmall = 4.0;
//   static const double radiusMedium = 8.0;
//   static const double radiusLarge = 12.0;
//   static const double radiusXLarge = 16.0;
//
//   static const double spacingXSmall = 4.0;
//   static const double spacingSmall = 8.0;
//   static const double spacingMedium = 12.0;
//   static const double spacingLarge = 16.0;
//   static const double spacingXLarge = 20.0;
//   static const double spacingXXLarge = 24.0;
//
//   static const double iconSmall = 16.0;
//   static const double iconMedium = 20.0;
//   static const double iconLarge = 24.0;
//   static const double iconXLarge = 32.0;
//
//   static const double buttonHeight = 48.0;
//   static const double inputHeight = 48.0;
//
//   static const double elevationLow = 2.0;
//   static const double elevationMedium = 4.0;
//   static const double elevationHigh = 8.0;
//
//   // ============================================
//   // COMMON PADDINGS (Consistent across app)
//   // ============================================
//
//   static const EdgeInsets paddingXSmall = EdgeInsets.all(4.0);
//   static const EdgeInsets paddingSmall = EdgeInsets.all(8.0);
//   static const EdgeInsets paddingMedium = EdgeInsets.all(12.0);
//   static const EdgeInsets paddingLarge = EdgeInsets.all(16.0);
//   static const EdgeInsets paddingXLarge = EdgeInsets.all(20.0);
//   static const EdgeInsets paddingXXLarge = EdgeInsets.all(24.0);
//
//   static const EdgeInsets paddingHorizontalSmall = EdgeInsets.symmetric(horizontal: 8.0);
//   static const EdgeInsets paddingHorizontalMedium = EdgeInsets.symmetric(horizontal: 12.0);
//   static const EdgeInsets paddingHorizontalLarge = EdgeInsets.symmetric(horizontal: 16.0);
//
//   static const EdgeInsets paddingVerticalSmall = EdgeInsets.symmetric(vertical: 8.0);
//   static const EdgeInsets paddingVerticalMedium = EdgeInsets.symmetric(vertical: 12.0);
//   static const EdgeInsets paddingVerticalLarge = EdgeInsets.symmetric(vertical: 16.0);
//
//   // ============================================
//   // COMMON DECORATIONS
//   // ============================================
//
//   static BoxDecoration cardDecoration(BuildContext context) => BoxDecoration(
//     color: surface(context),
//     borderRadius: BorderRadius.circular(radiusXLarge),
//     border: Border.all(
//       color: primary(context).withOpacity(_isDark(context) ? 0.3 : 0.2),
//     ),
//     boxShadow: _isDark(context)
//         ? [
//       BoxShadow(
//         color: Colors.black.withOpacity(0.3),
//         blurRadius: 8,
//         offset: const Offset(0, 2),
//       ),
//     ]
//         : [
//       BoxShadow(
//         color: Colors.black.withOpacity(0.1),
//         blurRadius: 8,
//         offset: const Offset(0, 2),
//       ),
//     ],
//   );
//
//   static BoxDecoration inputDecoration(BuildContext context) => BoxDecoration(
//     color: surfaceVariant(context),
//     borderRadius: BorderRadius.circular(radiusMedium),
//     border: Border.all(color: border(context)),
//   );
//
//   static BoxDecoration buttonDecoration(BuildContext context) => BoxDecoration(
//     color: primary(context),
//     borderRadius: BorderRadius.circular(radiusMedium),
//   );
//
//   // ============================================
//   // UTILITY METHODS
//   // ============================================
//
//   static bool _isDark(BuildContext context) {
//     return Theme.of(context).brightness == Brightness.light;
//   }
//
//   /// Get color with opacity
//   static Color withOpacity(Color color, double opacity) {
//     return color.withOpacity(opacity);
//   }
// }



// final lightTheme =
// ThemeData lightTheme(MaterialColor color) {
//   return ThemeData(
//     useMaterial3: false,
//     primarySwatch: color,
//     textTheme: GoogleFonts.latoTextTheme().copyWith(),
//     dialogTheme: const DialogThemeData(
//       titleTextStyle: TextStyle(),
//     ),
//     scaffoldBackgroundColor: Colors.transparent,
//     dialogBackgroundColor: Colors.white,
//     primaryColor: color.shade500,
//     iconTheme: IconThemeData(color: AppColors.black),
//     appBarTheme: AppBarTheme(
//         titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
//         foregroundColor: Colors.black,
//         color: color.shade500, // Transparent app bar
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.white)),
//     listTileTheme: ListTileThemeData(
//       iconColor: color.shade400,
//       textColor: Colors.black,
//     ),
//     buttonTheme: ThemeData.light().buttonTheme.copyWith(
//       buttonColor: color.shade500,
//       textTheme: ButtonTextTheme.primary,
//       colorScheme: ThemeData.dark().colorScheme.copyWith(
//         primary: Colors.black,
//       ),
//     ),
//     cardTheme: CardThemeData(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//     ),
//     tabBarTheme: const TabBarThemeData(
//       tabAlignment: TabAlignment.start,
//     ),
//     inputDecorationTheme: InputDecorationTheme(
//       iconColor: Colors.black,
//       fillColor: Colors.grey[300],
//       hintStyle: const TextStyle(color: Colors.black),
//       labelStyle: const TextStyle(color: Colors.black),
//       border: OutlineInputBorder(
//         borderSide: BorderSide.none,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderSide: BorderSide.none,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderSide: BorderSide.none,
//         borderRadius: BorderRadius.circular(10),
//       ),
//     ),
//     // iconTheme: const IconThemeData(color: primayColor),
//     floatingActionButtonTheme: FloatingActionButtonThemeData(
//       foregroundColor: color.shade500,
//       backgroundColor: color.shade500, // Set background color to grey
//     ),
//
//     progressIndicatorTheme: ProgressIndicatorThemeData(
//       linearTrackColor: color.shade500.withOpacity(0.1),
//     ),
//   );
// }
