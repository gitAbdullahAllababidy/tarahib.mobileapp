// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/invites_settings/invitation_settings_viewmodel.dart';

import '../core/application/services/light_services/current_route_service.dart';
import '../core/application/services/network_services.dart';
import '../core/application/services/storage_service/user_data_store.dart';
import '../core/data/repositories/app_repo.dart';
import '../core/data/repositories/auth_repo.dart';
import '../core/data/repositories/contacts_repo.dart';
import '../core/presentation/ui/views/aleardy_sent_invites/already_sent_invites_view.dart';
import '../core/presentation/ui/views/home/models/show_contacts_model.dart';
import '../core/presentation/ui/views/invites_settings/models/show_data_model.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => UserDataStore());
  locator.registerLazySingleton(() => CurrentRouteService());
  locator.registerLazySingleton(() => ShowContactsModel());
  locator.registerLazySingleton(
      () => ShowDataModel<InvitationSettingsViewModel>());
  locator.registerLazySingleton(() =>
      ShowDataModelForAlreadySentInvites<AlreadySentInvitationsViewModel>());
  locator.registerFactory(() => NetworkService());
  locator.registerFactory(() => AuthRepo());
  locator.registerFactory(() => ContactsRepo());
  locator.registerFactory(() => AppRepo());
}
