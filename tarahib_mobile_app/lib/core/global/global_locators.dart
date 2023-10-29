import 'package:stacked_services/stacked_services.dart';
import 'package:tarahib_mobile_app/app/app.locator.dart';
import 'package:tarahib_mobile_app/core/application/services/light_services/current_route_service.dart';
import 'package:tarahib_mobile_app/core/application/services/storage_service/user_data_store.dart';
import 'package:tarahib_mobile_app/generated/l10n.dart';

NavigationService get navigationService => locator<NavigationService>();
UserDataStore get userDataStore => locator<UserDataStore>();
CurrentRouteService currentRouteService = locator<CurrentRouteService>();
S get local => S.current;
