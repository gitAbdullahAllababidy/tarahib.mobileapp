import 'package:tarahib_mobile_app/core/application/services/storage_service/user_data_store.dart';

final class LogoutServices {
  static logout() => {UserDataStore.userDataBox?.clear()};
}
