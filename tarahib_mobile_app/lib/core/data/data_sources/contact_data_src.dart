




import 'package:tarahib_mobile_app/core/application/mixins/data_src_mixin.dart';

final class ContactDataSrc with DataSrcInterface {
  String get getAllContactsApi => "$api/contacts";
 }