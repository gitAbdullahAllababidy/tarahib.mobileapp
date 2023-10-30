import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:redacted/redacted.dart';
import 'package:stacked/stacked.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_colors.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/widgets/floating_action_with_drawer_and_appbar_app_home_view.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/widgets/root_widget.dart';

import 'home_viewmodel.dart';

class HomeView extends HookWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return ViewModelBuilder<HomeViewModel>.nonReactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (viewModel) => {
        viewModel.showContactsModel
            .getAllContacts()
            .whenComplete(() => viewModel.rebuildUi()),
      },
      builder: (context, viewModel, child) =>
          const FloatingActionWithDrawerAndAppbarAppHomeView(
        body: RootWidget(
          chields: [TableWidget()],
        ),
      ),
    );
  }
}

class TableWidget extends StatelessWidget {
  const TableWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
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
          columns: viewModel.showContactsModel.getDataColumns,
          rows: viewModel.showContactsModel.getDataRows,
        ),
      ).redacted(
          context: context,
          configuration: RedactedConfiguration(
              autoFillTexts: true,
              animationDuration: const Duration(milliseconds: 400)),
          redact: viewModel.busy(viewModel.showContactsModel.contactsList)),
    );
  }
}
