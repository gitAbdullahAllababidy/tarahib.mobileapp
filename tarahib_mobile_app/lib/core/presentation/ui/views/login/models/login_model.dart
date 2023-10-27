import 'package:dartz/dartz.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tarahib_mobile_app/app/app.locator.dart';
import 'package:tarahib_mobile_app/core/application/mixins/models_mixin.dart';
import 'package:tarahib_mobile_app/core/data/repositories/auth_repo.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/loading_helpers.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/login/login_viewmodel.dart';

final class LoginModel with ModelsMixin<LoginViewModel> {
  ///LoginUser
  loginUser(Tuple2<String, String> loginCreds) {
    final authRepo = locator<AuthRepo>();
    appLoadingCallback(authRepo.loginUser(loginCreds),
            cancelToken: authRepo.cancelToken)
        .then((value) {
      value.fold((l) => {showError(l)},
          (r) => {EasyLoading.showSuccess(r.data.toString())});
    });
  }
}
