import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/home/home_view.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/startup/startup_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {
  final devSettings = (EAppEnv.dev, "https://invite.event-reg.app/public");
}

enum EAppEnv {
  dev('dev');

  final String title;
  const EAppEnv(this.title);
}
