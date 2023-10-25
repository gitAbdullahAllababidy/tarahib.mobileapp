import 'package:hive_flutter/hive_flutter.dart';
import 'package:tarahib_mobile_app/core/application/services/storage_service/user_data_store.dart';

final class StorageService {
  static Future _openStoreBoxes() async {
    await Future.wait([UserDataStore.open()]);
  }

  static Future init() async => [await Hive.initFlutter(), _openStoreBoxes()];
}
