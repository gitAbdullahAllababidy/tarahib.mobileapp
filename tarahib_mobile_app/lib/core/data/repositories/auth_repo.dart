import 'package:dartz/dartz.dart';
import 'package:tarahib_mobile_app/core/application/mixins/repo_mixin.dart';
import 'package:tarahib_mobile_app/core/data/data_sources/auth_data_src.dart';

final class AuthRepo with RepoMixin {
  ///LoginUser

  Future loginUser(Tuple2<String, String> loginCreds) async {
    final userCreds = {
      "email": loginCreds.value1,
      "password": loginCreds.value2
    };
    await networkService.postRequest(AuthDataSrc().loginApi,
        data: userCreds, cancelToken: cancelToken);
  }
}
