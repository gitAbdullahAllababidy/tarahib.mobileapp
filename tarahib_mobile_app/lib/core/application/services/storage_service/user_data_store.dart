import 'package:hive/hive.dart';

final class UserDataStore {
  static const userDataBoxTitle = 'USER_DATA_BOX';
  static late Box<Map> userDataBox;
  static Future open() async =>
      userDataBox = await Hive.openBox<Map>(userDataBoxTitle);
}
