import 'package:hive_flutter/hive_flutter.dart';
import 'package:tarahib_mobile_app/core/global/global_locators.dart';

final class StorageService {
  static Future _openStoreBoxes() async {
    await Future.wait([userDataStore.openDataBox()]);
  }

  static Future init() async =>
      [await Hive.initFlutter(), await _openStoreBoxes()];
}
