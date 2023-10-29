//! Only for preview purpose, you must avoid this in production apps

import 'package:tarahib_mobile_app/core/application/mixins/repo_mixin.dart';
import 'package:tarahib_mobile_app/core/application/types/types.dart';
import 'package:tarahib_mobile_app/core/data/data_objects/response_data_object/response_data_object.dart';
import 'package:tarahib_mobile_app/core/data/data_sources/app_data_src.dart';

final class AppRepo with RepoMixin {
  Future<AppResponseType<ResponseDataObject>> getAllInvites() async {
    return await networkService.getRequest(AppDataSrc().getAllInvitesApi,
        authorized: true, cancelToken: cancelToken, interceptors: []);
  }
}
