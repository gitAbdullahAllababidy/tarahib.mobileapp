import 'package:stacked_services/stacked_services.dart';
import 'package:tarahib_mobile_app/app/app.locator.dart';
import 'package:tarahib_mobile_app/core/application/services/storage_service/user_data_store.dart';

NavigationService get navigationService => locator<NavigationService>();
UserDataStore get userDataStore => locator<UserDataStore>();
