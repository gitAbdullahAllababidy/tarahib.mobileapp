import 'package:dartz/dartz.dart';
import 'package:tarahib_mobile_app/core/application/services/storage_service/user_data_store.dart';
import 'package:tarahib_mobile_app/core/data/data_objects/login_data_object/login_data_object.dart';

final class GetUserStateService {
  static Either<dynamic, LoginDataObject> getUser() {
    try {
      final loggedUser = LoginDataObject.fromMap(
          UserDataStore.userDataBox?.values.firstOrNull ?? {});
      return right(loggedUser);
    } on Exception catch (e) {
      return left(e);
    }
  }
}
