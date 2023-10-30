import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:tarahib_mobile_app/app/app.locator.dart';
import 'package:tarahib_mobile_app/app/app.router.dart';
import 'package:tarahib_mobile_app/core/application/mixins/models_mixin.dart';
import 'package:tarahib_mobile_app/core/data/data_objects/response_data_object/response_data_object.dart';
import 'package:tarahib_mobile_app/core/data/repositories/auth_repo.dart';
import 'package:tarahib_mobile_app/core/global/global_locators.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/loading_helpers.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/login/login_viewmodel.dart';
import 'package:tarahib_mobile_app/generated/l10n.dart';

final class LoginModel extends ModelsAbstract<LoginViewModel> {
  ///LoginUser
  loginUser(Tuple2<String, String> loginCreds) {
    final authRepo = locator<AuthRepo>();
    appLoadingCallback(authRepo.loginUser(loginCreds),
            cancelToken: authRepo.cancelToken)
        .then((value) {
      value.fold((l) => {showError(l)}, (r) {
        _success(r);
      });
    });
  }

  void _success(ResponseDataObject r) {
    BotToast.showText(text: S.current.success);
    final userInfo = r.data;
    if (userInfo != null) {
      ///Save user data
      userDataStore.add(Map<String, dynamic>.from(userInfo));
      navigationService.replaceWithSendInvitesView();
    }
  }
}
