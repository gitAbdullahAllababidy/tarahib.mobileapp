import 'package:dartz/dartz.dart';
import 'package:tarahib_mobile_app/core/application/mixins/data_store_mixin.dart';
import 'package:tarahib_mobile_app/core/application/types/types.dart';
import 'package:tarahib_mobile_app/core/data/data_objects/login_data_object/login_data_object.dart';

final class UserDataStore with DataStoreMixin<Map> {
  @override
  String get dataBoxTitle => "USER_DATA_BOX";

  AppResponseType<LoginDataObject> getUser() {
    return getAllData().fold((l) => left(l), (r) {
      return right(LoginDataObject.fromMap((r.first)));
    });
  }

  String get getUserToken {
    var userToken = getUser().getOrElse(() => LoginDataObject()).token;
    return userToken ?? "";
  }

  String get getUserName {
    var data = getUser().getOrElse(() => LoginDataObject()).user?.name;
    return data ?? "";
  }

  String get getUserEmail {
    var data = getUser().getOrElse(() => LoginDataObject()).user?.email;
    return data ?? "";
  }
}
