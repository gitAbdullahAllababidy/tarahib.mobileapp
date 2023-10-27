import 'package:hive/hive.dart';

final class UserDataStore {
  static const userDataBoxTitle = 'USER_DATA_BOX';
  static Box<Map<String, dynamic>>? userDataBox;
  static Future open() async {
    var storedUserData =
        await Hive.openBox<Map<String, dynamic>>(userDataBoxTitle);
    userDataBox = storedUserData;
  }
}
