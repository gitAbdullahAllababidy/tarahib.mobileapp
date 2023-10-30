import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_colors.dart';

Widget appLoaderWidget() => const SizedBox(
      width: 80,
      height: 80,
      child: SpinKitCubeGrid(
        color: kcPrimaryColor,
      ),
    );
Future<T> appLoadingCallback<T>(Future<T> future,
    {CancelToken? cancelToken, bool showLoading = true}) async {
  if (showLoading) {
    BotToast.showCustomLoading(
        toastBuilder: (cancelFunc) => appLoaderWidget(),
        onClose: () {
          cancelToken?.cancel();
        },
        crossPage: true,
        clickClose: cancelToken is CancelToken);
  }
  return await future.whenComplete(() {
    if (showLoading) {
      BotToast.closeAllLoading();
    }
  });
}
