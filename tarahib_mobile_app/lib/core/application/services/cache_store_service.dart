// ignore_for_file: depend_on_referenced_packages

import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';

final class CacheStoreService {
  static CacheStore? _cacheStore;
  static CacheOptions cacheOptions = CacheOptions(
    store: _cacheStore,
    allowPostMethod: true,
    priority: CachePriority.high,
    hitCacheOnErrorExcept: [],
  );
  static Future initCacheStore() async => await getTemporaryDirectory()
      .then((value) => _cacheStore = HiveCacheStore(value.path));
}
