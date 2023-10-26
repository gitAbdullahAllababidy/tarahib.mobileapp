import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_colors.dart';
import 'package:tarahib_mobile_app/generated/l10n.dart';

ThemeData setAppThem() => ThemeData(
    appBarTheme: const AppBarTheme(color: kcPrimaryColor),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.cairo(
        fontSize: 23.sp,
      ),
      titleMedium: GoogleFonts.cairo(fontSize: 18.sp),
      titleSmall: GoogleFonts.cairo(fontSize: 16.sp),
      bodyLarge: GoogleFonts.cairo(fontSize: 16.sp),
      bodyMedium: GoogleFonts.cairo(fontSize: 14.sp),
      bodySmall: GoogleFonts.cairo(fontSize: 12.sp),
    ));

ThemeData getAppThem(BuildContext context) {
  var appThem = Theme.of(context);
  return appThem;
}
