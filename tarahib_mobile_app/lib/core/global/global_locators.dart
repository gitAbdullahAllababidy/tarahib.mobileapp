import 'package:stacked_services/stacked_services.dart';
import 'package:tarahib_mobile_app/app/app.locator.dart';
import 'package:tarahib_mobile_app/core/application/services/light_services/current_route_service.dart';
import 'package:tarahib_mobile_app/core/application/services/storage_service/user_data_store.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/home/models/show_contacts_model.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/invites_settings/invitation_settings_viewmodel.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/invites_settings/models/show_data_model.dart';
import 'package:tarahib_mobile_app/generated/l10n.dart';

NavigationService navigationService = locator<NavigationService>();
UserDataStore userDataStore = locator<UserDataStore>();
CurrentRouteService currentRouteService = locator<CurrentRouteService>();
DialogService dialogService = locator<DialogService>();
final invitationSettingsModel =
    locator<ShowDataModel<InvitationSettingsViewModel>>();
final contactsModel = locator<ShowContactsModel>();
S get local => S.current;
