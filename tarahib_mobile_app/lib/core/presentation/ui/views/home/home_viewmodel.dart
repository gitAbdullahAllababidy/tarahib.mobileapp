import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tarahib_mobile_app/app/app.bottomsheets.dart';
import 'package:tarahib_mobile_app/app/app.dialogs.dart';
import 'package:tarahib_mobile_app/app/app.locator.dart';
import 'package:tarahib_mobile_app/core/application/services/light_services/logout_service.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_strings.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/home/models/show_contacts_model.dart';
import 'package:tarahib_mobile_app/generated/l10n.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  late final ShowContactsModel showContactsModel;
  HomeViewModel() {
    showContactsModel = locator<ShowContactsModel>();
    showContactsModel.viewModel = this;
  }
  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService
        .showCustomDialog(
      barrierDismissible: true,
      variant: DialogType.infoAlert,
      title: S.current.logoutAlertTitle,
      description: S.current.logoutMessage,
    )
        .then((value) {
      if (value?.confirmed ?? false) {
        LogoutServices.logout();
      }
    });
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

}
