import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tarahib_mobile_app/core/global/global_locators.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_colors.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/widgets/floating_action_with_drawer_and_appbar_app_home_view.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/widgets/root_widget.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/invites_settings/invitation_settings_viewmodel.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<InvitationSettingsViewModel>.nonReactive(
      onViewModelReady: (viewModel) => {
        viewModel.showDataModel.getData()
      } ,
        viewModelBuilder: () => InvitationSettingsViewModel(),
        builder: (context, viewModel, _) {
          return FloatingActionWithDrawerAndAppbarAppHomeView(
              appbarSettings: AppbarSettings(title: local.invitationsSettings),
              body: const RootWidget(chields: [_TableWidget()]));
        });
  }
}

class _TableWidget extends StatelessWidget {
  const _TableWidget();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<InvitationSettingsViewModel>(context);
    return SingleChildScrollView(
      
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          child: DataTable(
            sortAscending: true,
            headingRowColor: MaterialStateProperty.resolveWith<Color?>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return kcPrimaryColor;
              }
              return kcVeryLightGrey_2;
            }),
            columns: viewModel.showDataModel.getDataColumns,
            rows: viewModel.showDataModel.getDataRows,
          ),
        ));
  }
}
