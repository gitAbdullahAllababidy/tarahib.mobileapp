import 'package:tarahib_mobile_app/core/application/mixins/data_src_mixin.dart';

final class AuthDataSrc with DataSrcInterface {
  
  String get loginApi => "$api$admin/auth/login";
}
