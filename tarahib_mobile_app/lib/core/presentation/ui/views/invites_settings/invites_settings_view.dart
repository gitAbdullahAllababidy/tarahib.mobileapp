import 'package:flutter/material.dart';
import 'package:tarahib_mobile_app/core/global/global_locators.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/widgets/floating_action_with_drawer_and_appbar_app_home_view.dart';

class InvitesSettingsView extends StatelessWidget {
  const InvitesSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionWithDrawerAndAppbarAppHomeView(
        appbarSettings: AppbarSettings(title: local.invitationsSettings),
        body: const SizedBox());
  }
}
