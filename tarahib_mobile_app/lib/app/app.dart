import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tarahib_mobile_app/core/application/services/light_services/current_route_service.dart';
import 'package:tarahib_mobile_app/core/application/services/network_services.dart';
import 'package:tarahib_mobile_app/core/application/services/storage_service/user_data_store.dart';
import 'package:tarahib_mobile_app/core/data/repositories/auth_repo.dart';
import 'package:tarahib_mobile_app/core/data/repositories/contacts_repo.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/aleardy_sent_invites/already_sent_invites_view.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/groups/groups_view.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/home/home_view.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/home/models/show_contacts_model.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/invites_settings/invites_settings_view.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/login/login_view.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/scheduled_invites/invites_settings_view.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/send_invites/send_invites_view.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/startup/startup_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: GroupsView),
    MaterialRoute(page: SendInvitesView),
    MaterialRoute(page: ScheduledInvitesView),
    MaterialRoute(page: AlreadySentInvitesView),
    MaterialRoute(page: InvitesSettingsView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: UserDataStore),
    LazySingleton(classType: CurrentRouteService),
    LazySingleton(classType: ShowContactsModel),
    Factory(classType: NetworkService),
    Factory(classType: AuthRepo),
    Factory(classType: ContactsRepo)
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
  static const devSettings =
      (EAppEnv.dev, "https://invite.event-reg.app/public");
}

enum EAppEnv {
  dev('dev');

  final String title;
  const EAppEnv(this.title);
}
