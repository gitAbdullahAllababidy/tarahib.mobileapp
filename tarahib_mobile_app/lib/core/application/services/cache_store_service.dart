import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';

final class CacheStoreService {
  static HiveCacheStore? _cacheStore;
  static HiveCacheStore? get cacheStorage => _cacheStore;
  static Future initCacheStore() async => await getTemporaryDirectory()
      .then((value) => _cacheStore = HiveCacheStore(value.path));
}
