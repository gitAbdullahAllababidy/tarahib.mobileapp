import 'package:flutter/material.dart';
import 'package:tarahib_mobile_app/core/global/global_locators.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_colors.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_them.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/widgets/drawer_widget.dart';

class FloatingActionWithDrawerAndAppbarAppHomeView extends StatelessWidget {
  const FloatingActionWithDrawerAndAppbarAppHomeView({
    super.key,
    required this.body,
    this.appbarSettings,
    this.drawerSettings,
    this.floatingAcSettings,
  });
  final Widget body;
  final AppbarSettings? appbarSettings;
  final DrawerSettings? drawerSettings;
  final FloatingAcSettings? floatingAcSettings;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: floatingAcSettings?.onTap != null
          ? GestureDetector(
              onTap: floatingAcSettings?.onTap,
              child: const CircleAvatar(
                  backgroundColor: kcPrimaryColor,
                  radius: 30,
                  child: Center(
                    child: Icon(
                      Icons.add,
                      color: kcWhiteColor,
                      size: 25,
                    ),
                  )),
            )
          : const SizedBox(),
      drawer: const HomeDrawerWidget(),
      appBar: AppBar(
        title: Text(
          appbarSettings?.title ?? local.contacts,
          style: getThem.textTheme.titleMedium?.copyWith(color: kcWhiteColor),
        ),
      ),
      body: body,
    );
  }
}

class FloatingAcSettings {
  final VoidCallback? onTap;

  FloatingAcSettings({this.onTap});
}

class DrawerSettings {}

class AppbarSettings {
  final String title;

  AppbarSettings({required this.title});
}
