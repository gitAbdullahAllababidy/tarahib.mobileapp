import 'package:tarahib_mobile_app/app/app.dialogs.dart';
import 'package:tarahib_mobile_app/app/app.router.dart';
import 'package:tarahib_mobile_app/core/global/global_locators.dart';

final class LogoutServices {
  static logout() async => {
        await userDataStore.dataBox?.clear(),
        navigationService.clearStackAndShow(Routes.startupView)
      };

  static void showDialog() {
    dialogService
        .showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.infoAlert,
      title: local.logoutAlertTitle,
      description: local.logoutMessage,
    )
        .then((value) {
      if (value?.confirmed ?? false) {
        LogoutServices.logout();
      }
    });
  }
}
