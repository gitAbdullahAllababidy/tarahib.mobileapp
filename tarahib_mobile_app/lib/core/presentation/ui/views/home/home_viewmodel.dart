import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tarahib_mobile_app/app/app.bottomsheets.dart';
import 'package:tarahib_mobile_app/app/app.locator.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_strings.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/home/models/show_contacts_model.dart';

class HomeViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  late final ShowContactsModel showContactsModel;
  HomeViewModel() {
  showContactsModel = locator<ShowContactsModel>();
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
