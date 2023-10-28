import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_colors.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_them.dart';
import 'package:tarahib_mobile_app/generated/l10n.dart';

import 'home_viewmodel.dart';

class HomeView extends HookWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return ViewModelBuilder<HomeViewModel>.nonReactive(
      disposeViewModel: false,
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        drawer: const HomeDrawerWidget(),
        appBar: AppBar(),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: SizedBox(),
          ),
        ),
      ),
    );
  }
}

class HomeDrawerWidget extends HookWidget {
  const HomeDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerButtonWidget(
            isSelected: true,
          ),
          DrawerButtonWidget(
            isSelected: false,
            label: S.current.groups,
            icon: Icons.group_outlined,
          ),
          DrawerButtonWidget(
            isSelected: false,
            label: S.current.invitationsSettings,
            icon: Icons.settings_applications_outlined,
          ),
          DrawerButtonWidget(
            isSelected: false,
            label: S.current.sendInvitations,
            icon: Icons.send_time_extension_outlined,
          ),
          DrawerButtonWidget(
            isSelected: false,
            label: S.current.alreadySentInvitations,
            icon: Icons.mark_email_read_outlined,
          ),
          DrawerButtonWidget(
            isSelected: false,
            label: S.current.scheduledInvitations,
            icon: Icons.schedule_sharp,
          ),
          DrawerButtonWidget(
            isSelected: false,
            label: S.current.audience,
            icon: Icons.nature_people_outlined,
          ),
          DrawerButtonWidget(
            isSelected: false,
            label: S.current.logout,
            icon: Icons.logout_outlined,
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
    super.key,
  });
  final bool isSelected;
  final String? label;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: isSelected ? kcPrimaryColor : null),
      child: ListTile(
        title: Text(
          label ?? S.current.contacts,
          style: getAppThem(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: isSelected ? kcWhiteColor : kcMediumGrey),
        ),
        leading: Icon(
          icon ?? Icons.contacts_outlined,
          color: isSelected ? kcWhiteColor : kcMediumGrey,
        ),
      ),
    );
  }
}
