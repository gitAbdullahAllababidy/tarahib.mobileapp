import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:tarahib_mobile_app/core/application/types/types.dart';

mixin DataStoreMixin<T> {
  String get dataBoxTitle;
  Box<T>? dataBox;

  Future openDataBox() async {
    try {
      return dataBox = await Hive.openBox<T>(dataBoxTitle);
    } on Exception catch (e) {
      return e;
    }
  }

  Future<AppResponseType<bool>> add(T data) async {
    try {
      var addData = await dataBox?.add(data);
      return right(addData == 1);
    } on Exception catch (e) {
      return left(e);
    }
  }

  Future<AppResponseType> putData(String key, T value) async {
    try {
      await dataBox?.put(key, value);
      return right("");
    } on Exception catch (e) {
      return left(e);
    }
  }

  AppResponseType<T?> getData(String key) {
    try {
      return right(dataBox?.get(
        key,
      ));
    } on Exception catch (e) {
      return left(e);
    }
  }

  AppResponseType<Iterable<T>> getAllData() {
    try {
      if (dataBox?.isEmpty ?? false) {
        return left("");
      }
      return right(dataBox?.values ?? []);
    } on Exception catch (e) {
      return left(e);
    }
  }
}
