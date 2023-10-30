import 'package:stacked/stacked.dart';
import 'package:tarahib_mobile_app/app/app.router.dart';
import 'package:tarahib_mobile_app/core/application/services/cache_store_service.dart';
import 'package:tarahib_mobile_app/core/application/services/storage_service/storage_service.dart';
import 'package:tarahib_mobile_app/core/global/global_locators.dart';

class StartupViewModel extends BaseViewModel {
  Future runStartupLogic() async {
    ///Required
    {
      await CacheStoreService.initCacheStore();
      await StorageService.init();
    }

    if (userDataStore.getUser().isLeft()) {
      return navigationService.replaceWithLoginView();
    }
    await contactsModel.getAllContacts(showLoader: false);
    await invitationSettingsModel.getData(showLoader: false);
    return navigationService.replaceWithSendInvitesView();
  }
}
