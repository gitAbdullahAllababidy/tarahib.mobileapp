import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:tarahib_mobile_app/core/application/mixins/repo_mixin.dart';
import 'package:tarahib_mobile_app/core/application/types/types.dart';
import 'package:tarahib_mobile_app/core/data/data_objects/response_data_object/response_data_object.dart';
import 'package:tarahib_mobile_app/core/data/data_sources/contact_data_src.dart';

final class ContactsRepo with RepoMixin {
  ///LoginUser

  Future<AppResponseType<ResponseDataObject>> getAllContacts() async {
    return await networkService.getRequest(ContactDataSrc().getAllContactsApi,
        authorized: true, cancelToken: cancelToken,interceptors: [
          
        ]);
  }
}
