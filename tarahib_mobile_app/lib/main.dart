import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tarahib_mobile_app/app/app.bottomsheets.dart';
import 'package:tarahib_mobile_app/app/app.dialogs.dart';
import 'package:tarahib_mobile_app/app/app.locator.dart';
import 'package:tarahib_mobile_app/app/app.router.dart';
import 'package:tarahib_mobile_app/core/application/services/light_services/current_route_service.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_them.dart';
import 'package:tarahib_mobile_app/generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  runApp(const MainApp());
}

class MainApp extends HookWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();

    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
            home: child,
            builder: (context, child) {
              child = botToastBuilder(context, child);

              return child;
            },
            initialRoute: Routes.startupView,
            onGenerateRoute: StackedRouter().onGenerateRoute,
            debugShowCheckedModeBanner: kDebugMode,
            navigatorKey: StackedService.navigatorKey,
            title: "تراحيب",
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: const Locale('ar'),
            supportedLocales: S.delegate.supportedLocales,
            navigatorObservers: [
              StackedService.routeObserver,
              locator<CurrentRouteService>()
            ],
            theme: setAppThem());
      },
    );
  }
}
