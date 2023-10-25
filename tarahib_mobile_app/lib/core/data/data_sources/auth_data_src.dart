import 'package:tarahib_mobile_app/core/data/data_sources/data_src_interface.dart';

final class AuthDataSrc with DataSrcInterface {
  
  String get loginApi => "$api$admin/auth/login";
}
