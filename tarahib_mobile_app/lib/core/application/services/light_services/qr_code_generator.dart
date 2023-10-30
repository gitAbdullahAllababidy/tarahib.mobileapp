import 'package:flutter/material.dart';
import 'package:qr_bar_code/code/src/code_generate.dart';
import 'package:qr_bar_code/code/src/code_type.dart';
import 'package:tarahib_mobile_app/core/global/global_locators.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_colors.dart';

final class QrCodeGenerator {
  static show(String data) => {
        navigationService.navigateToView(Scaffold(
          body: Code(
            data: data,
            codeType: CodeType.qrCode(),
            color: kcPrimaryColor,
            backgroundColor: kcWhiteColor,
          ),
        ))
      };
}
