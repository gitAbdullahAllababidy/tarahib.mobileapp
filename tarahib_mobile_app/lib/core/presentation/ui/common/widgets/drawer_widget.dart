import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:tarahib_mobile_app/app/app.router.dart';
import 'package:tarahib_mobile_app/core/global/global_locators.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_colors.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_them.dart';

class HomeDrawerWidget extends HookWidget {
  const HomeDrawerWidget({
    this.logout,
    super.key,
    this.selectedRoute = Routes.homeView,
  });
  final VoidCallback? logout;
  final String? selectedRoute;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerButtonWidget(
            isSelected: selectedRoute == Routes.homeView,
          ),
          DrawerButtonWidget(
            isSelected: false,
            label: local.groups,
            icon: Icons.group_outlined,
          ),
          DrawerButtonWidget(
            isSelected: false,
            label: local.invitationsSettings,
            icon: Icons.settings_applications_outlined,
          ),
          DrawerButtonWidget(
            isSelected: false,
            label: local.sendInvitations,
            icon: Icons.send_time_extension_outlined,
          ),
          DrawerButtonWidget(
            isSelected: false,
            label: local.alreadySentInvitations,
            icon: Icons.mark_email_read_outlined,
          ),
          DrawerButtonWidget(
            isSelected: false,
            label: local.scheduledInvitations,
            icon: Icons.schedule_sharp,
          ),
          DrawerButtonWidget(
            isSelected: false,
            label: local.audience,
            icon: Icons.nature_people_outlined,
          ),
          DrawerButtonWidget(
            isSelected: false,
            label: local.logout,
            icon: Icons.logout_outlined,
            onTap: () => logout?.call(),
          ),
        ],
      ),
    );
  }
}

class DrawerButtonWidget extends HookWidget {
  const DrawerButtonWidget({
    this.isSelected = false,
    this.label,
    this.icon,
    this.onTap,
    super.key,
  });
  final bool isSelected;
  final String? label;
  final IconData? icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Container(
        decoration: BoxDecoration(color: isSelected ? kcPrimaryColor : null),
        child: ListTile(
          title: Text(
            label ?? local.contacts,
            style: getThem.textTheme.bodyLarge
                ?.copyWith(color: isSelected ? kcWhiteColor : kcMediumGrey),
          ),
          leading: Icon(
            icon ?? Icons.contacts_outlined,
            color: isSelected ? kcWhiteColor : kcMediumGrey,
          ),
        ),
      ),
    );
  }
}
