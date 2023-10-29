import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tarahib_mobile_app/core/global/global_locators.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_colors.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_them.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/login/login_view.dart';
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
      onViewModelReady: (viewModel) =>
          {viewModel.showContactsModel.getAllContacts()},
      builder: (context, viewModel, child) => Scaffold(
        drawer: const HomeDrawerWidget(),
        appBar: AppBar(),
        body: SafeArea(
          child: SizedBox(
            child: ListView(
              padding:
                  EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 15.0.h),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      local.contacts,
                      style: getThem.textTheme.titleLarge
                          ?.copyWith(color: kcPrimaryColorDark),
                    ),
                    AppButtonWidget(
                      label: local.addNew,
                    )
                  ],
                ),
              ],
            ),
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
    final viewModel = Provider.of<HomeViewModel>(context, listen: false);
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
            onTap: () => viewModel.showDialog(),
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
            label ?? S.current.contacts,
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
