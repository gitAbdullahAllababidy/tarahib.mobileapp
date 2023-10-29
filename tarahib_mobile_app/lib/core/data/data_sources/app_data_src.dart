//! Only for preview purpose, you must avoid this in production apps

import 'package:tarahib_mobile_app/core/application/mixins/data_src_mixin.dart';

final class AppDataSrc with DataSrcInterface {
  String get getAllContactsApi => "$api/contacts";
  String get getAllInvitesApi => "$api/invitation-settings";
}