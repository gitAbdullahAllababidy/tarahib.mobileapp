import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:tarahib_mobile_app/core/data/data_objects/response_data_object/response_data_object.dart';

class ModelsAbstract<ViewModel extends BaseViewModel> {
  @mustCallSuper
  showError(error) {
    if (error is DioException) {
      return switch (error.type) {
        DioExceptionType.cancel => BotToast.showText(text: error.message ?? ""),
        DioExceptionType.connectionError => BotToast.showText(text: ""),
        DioExceptionType.connectionTimeout => BotToast.showText(text: ""),
        _ => BotToast.showText(text: error.message ?? "")
      };
    }
    if (error is ResponseDataObject) {
      BotToast.showText(text: error.data?.values.join(", ") ?? "");
    }
  }
}
