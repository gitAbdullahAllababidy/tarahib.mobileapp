//! Only for preview purpose, you must avoid this in production apps

// ignore: depend_on_referenced_packages
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:tarahib_mobile_app/core/application/mixins/repo_mixin.dart';
import 'package:tarahib_mobile_app/core/application/services/cache_store_service.dart';
import 'package:tarahib_mobile_app/core/application/types/types.dart';
import 'package:tarahib_mobile_app/core/data/data_objects/response_data_object/response_data_object.dart';
import 'package:tarahib_mobile_app/core/data/data_sources/app_data_src.dart';

final class AppRepo with RepoMixin {
  Future<AppResponseType<ResponseDataObject>> getAllInvites() async {
    return await networkService.getRequest(AppDataSrc().getAllInvitesApi,
        authorized: true,
        cancelToken: cancelToken,
        interceptors: [
          DioCacheInterceptor(options: CacheStoreService.cacheOptions)
        ]);
  }

  Future<AppResponseType<ResponseDataObject>> getAllSendInvites() async {
    return await networkService.getRequest(AppDataSrc().getAllSentInvitesApi,
        authorized: true, cancelToken: cancelToken, interceptors: []);
  }

  Future<AppResponseType<ResponseDataObject>> getAllScheduledInvites() async {
    return await networkService.getRequest(
        AppDataSrc().getAllScheduledInvitesApi,
        authorized: true,
        cancelToken: cancelToken,
        interceptors: []);
  }

  Future<AppResponseType<ResponseDataObject>> getAllAttendanceInvites() async {
    return await networkService.getRequest(
        AppDataSrc().getAllAttendanceInvitesApi,
        authorized: true,
        cancelToken: cancelToken,
        interceptors: [
          DioCacheInterceptor(options: CacheStoreService.cacheOptions)
        ]);
  }
}
