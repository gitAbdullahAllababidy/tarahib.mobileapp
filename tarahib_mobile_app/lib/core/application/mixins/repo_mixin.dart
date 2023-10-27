import 'package:tarahib_mobile_app/app/app.locator.dart';
import 'package:tarahib_mobile_app/core/application/services/network_services.dart';

mixin RepoMixin {
  final networkService = locator<NetworkService>();
}
