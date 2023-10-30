import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tarahib_mobile_app/app/app.bottomsheets.dart';
import 'package:tarahib_mobile_app/app/app.locator.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_strings.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/invites_settings/models/show_data_model.dart';

class InvitationSettingsViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  late final ShowDataModel showDataModel;
  InvitationSettingsViewModel() {
    showDataModel = locator<ShowDataModel<InvitationSettingsViewModel>>();
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
