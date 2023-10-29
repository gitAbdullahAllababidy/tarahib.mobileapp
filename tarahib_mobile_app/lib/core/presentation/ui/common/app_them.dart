import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_colors.dart';

ThemeData setAppThem() => ThemeData(
    drawerTheme: const DrawerThemeData(),
    appBarTheme: const AppBarTheme(color: kcPrimaryColor),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.cairo(
        fontSize: 26,
        fontWeight: FontWeight.bold
      ),
      titleMedium: GoogleFonts.cairo(fontSize: 20),
      titleSmall: GoogleFonts.cairo(fontSize: 16),
      bodyLarge: GoogleFonts.cairo(fontSize: 16),
      bodyMedium: GoogleFonts.cairo(fontSize: 14),
      bodySmall: GoogleFonts.cairo(fontSize: 12),
      labelLarge: GoogleFonts.cairo(fontSize: 12),
      labelMedium: GoogleFonts.cairo(fontSize: 10),
      labelSmall: GoogleFonts.cairo(fontSize: 8),
    ));

ThemeData get getThem {
  var appThem = Theme.of(StackedService.navigatorKey!.currentContext!);
  return appThem;
}
