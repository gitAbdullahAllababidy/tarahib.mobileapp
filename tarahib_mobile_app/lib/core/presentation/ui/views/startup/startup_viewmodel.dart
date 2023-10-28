import 'package:stacked/stacked.dart';
import 'package:tarahib_mobile_app/app/app.router.dart';
import 'package:tarahib_mobile_app/core/application/services/cache_store_service.dart';
import 'package:tarahib_mobile_app/core/application/services/storage_service/storage_service.dart';
import 'package:tarahib_mobile_app/core/global/global_locators.dart';

class StartupViewModel extends BaseViewModel {
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 1));
    await CacheStoreService.initCacheStore();
    await StorageService.init();
    if (userDataStore.getUser().isLeft()) {
      return navigationService.replaceWithLoginView();
    }
    return navigationService.replaceWithHomeView();
  }
}
