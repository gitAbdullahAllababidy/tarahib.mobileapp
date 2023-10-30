import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tarahib_mobile_app/app/app.locator.dart';
import 'package:tarahib_mobile_app/core/application/mixins/models_mixin.dart';
import 'package:tarahib_mobile_app/core/data/data_objects/scheduled_invitations_data_object/scheduled_invitations_data_object.dart';
import 'package:tarahib_mobile_app/core/data/repositories/app_repo.dart';
import 'package:tarahib_mobile_app/core/global/global_locators.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_colors.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/loading_helpers.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/widgets/floating_action_with_drawer_and_appbar_app_home_view.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/widgets/root_widget.dart';

class ScheduledInvitesView extends StatelessWidget {
  const ScheduledInvitesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ScheduledInvitationsViewModel>.nonReactive(
        onViewModelReady: (viewModel) => viewModel.showDataModel
            .getData()
            .whenComplete(() => viewModel.rebuildUi()),
        viewModelBuilder: () {
          return ScheduledInvitationsViewModel();
        },
        builder: (context, viewModel, _) {
          return FloatingActionWithDrawerAndAppbarAppHomeView(
              appbarSettings: AppbarSettings(title: local.scheduledInvitations),
              body: const RootWidget(chields: [_TableWidget()]));
        });
  }
}

class _TableWidget extends StatelessWidget {
  const _TableWidget();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ScheduledInvitationsViewModel>(context);
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

class ScheduledInvitationsViewModel extends BaseViewModel {
  late final ShowDataModelForScheduledInvites<ScheduledInvitationsViewModel>
      showDataModel;
  ScheduledInvitationsViewModel() {
    showDataModel = locator<
        ShowDataModelForScheduledInvites<ScheduledInvitationsViewModel>>();
  }
}

final class ShowDataModelForScheduledInvites<ViewModel extends BaseViewModel>
    extends ModelsAbstract<ViewModel> {
  ShowDataModelForScheduledInvites();

  var dataList = <ScheduledInvitationsDataObject>[];

  Future getData() async {
    var appRepo = locator<AppRepo>();
    await appLoadingCallback(
        appRepo.getAllScheduledInvites().then((value) => value.fold(
            (l) => showError(l),
            (r) => {
                  if (r.data is List)
                    {
                      dataList = (r.data as List)
                          .map((e) => ScheduledInvitationsDataObject.fromMap(e))
                          .toList(),
                    }
                })),
        showLoading: dataList.isEmpty);
  }

  List<DataRow> get getDataRows {
    return List.generate(
        dataList.length,
        (index) => DataRow(cells: [
              DataCell(Text(
                  "${getDataObjectByIndex(index).invitation?.invitationName}")),
              DataCell(Text(
                  "${getDataObjectByIndex(index).firstName} ${getDataObjectByIndex(index).lastName}")),
              DataCell(Text("${getDataObjectByIndex(index).surname}")),
              DataCell(Text("${getDataObjectByIndex(index).sendTime}")),
            ]));
  }

  List<DataColumn> get getDataColumns {
    return [
      DataColumn(label: Text(local.invitationName)),
      DataColumn(label: Text(local.name)),
      DataColumn(label: Text(local.surname)),
      DataColumn(label: Text(local.sentDate))
    ];
  }

  ScheduledInvitationsDataObject getDataObjectByIndex(int index) =>
      dataList[index];
}
