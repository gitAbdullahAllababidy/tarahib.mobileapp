import 'package:dartz/dartz.dart';
import 'package:tarahib_mobile_app/core/application/mixins/repo_mixin.dart';
import 'package:tarahib_mobile_app/core/application/types/types.dart';
import 'package:tarahib_mobile_app/core/data/data_objects/response_data_object/response_data_object.dart';
import 'package:tarahib_mobile_app/core/data/data_sources/auth_data_src.dart';

final class AuthRepo with RepoMixin {
  ///LoginUser

  Future<AppResponseType<ResponseDataObject>> loginUser(
      Tuple2<String, String> loginCreds) async {
    final userCreds = {
      "email": loginCreds.value1,
      "password": loginCreds.value2
    };
    return await networkService.postRequest(AuthDataSrc().loginApi,
        data: userCreds, cancelToken: cancelToken);
  }
}
