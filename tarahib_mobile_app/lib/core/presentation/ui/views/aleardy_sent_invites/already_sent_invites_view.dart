import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tarahib_mobile_app/app/app.locator.dart';
import 'package:tarahib_mobile_app/core/application/mixins/models_mixin.dart';
import 'package:tarahib_mobile_app/core/application/services/light_services/qr_code_generator.dart';
import 'package:tarahib_mobile_app/core/data/data_objects/already_sent_invites_data_object/already_sent_invites_data_object.dart';
import 'package:tarahib_mobile_app/core/data/repositories/app_repo.dart';
import 'package:tarahib_mobile_app/core/global/global_locators.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_colors.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_them.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/loading_helpers.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/widgets/floating_action_with_drawer_and_appbar_app_home_view.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/widgets/root_widget.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/login/login_view.dart';

class AlreadySentInvitesView extends StatelessWidget {
  const AlreadySentInvitesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AlreadySentInvitationsViewModel>.nonReactive(
        onViewModelReady: (viewModel) => viewModel.showDataModel
            .getData()
            .whenComplete(() => viewModel.rebuildUi()),
        viewModelBuilder: () {
          return AlreadySentInvitationsViewModel();
        },
        builder: (context, viewModel, _) {
          return FloatingActionWithDrawerAndAppbarAppHomeView(
              appbarSettings:
                  AppbarSettings(title: local.alreadySentInvitations),
              body: const RootWidget(chields: [_TableWidget()]));
        });
  }
}

class _TableWidget extends StatelessWidget {
  const _TableWidget();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AlreadySentInvitationsViewModel>(context);
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

class AlreadySentInvitationsViewModel extends BaseViewModel {
  late final ShowDataModelForAlreadySentInvites<AlreadySentInvitationsViewModel>
      showDataModel;
  AlreadySentInvitationsViewModel() {
    showDataModel = locator<
        ShowDataModelForAlreadySentInvites<AlreadySentInvitationsViewModel>>();
  }
}

final class ShowDataModelForAlreadySentInvites<ViewModel extends BaseViewModel>
    extends ModelsAbstract<ViewModel> {
  ShowDataModelForAlreadySentInvites();

  var dataList = <AlreadySentInvitesDataObject>[];

  Future getData() async {
    var appRepo = locator<AppRepo>();
    await appLoadingCallback(
        appRepo.getAllSendInvites().then((value) => value.fold(
            (l) => showError(l),
            (r) => {
                  if (r.data is List)
                    {
                      dataList = (r.data as List)
                          .map((e) => AlreadySentInvitesDataObject.fromMap(e))
                          .toList(),
                    }
                })),
        showLoading: dataList.isEmpty);
  }

  List<DataRow> get getDataRows {
    return List.generate(
        dataList.length,
        (index) => DataRow(cells: [
              DataCell(AppButtonWidget(
                outlinedStyle: true,
                label: local.sendReminder,
              )),
              DataCell(Text("${getDataObjectByIndex(index).answer}")),
              DataCell(Text(
                  "${getDataObjectByIndex(index).invitation?.invitationName}")),
              DataCell(Text(
                  "${getDataObjectByIndex(index).firstName} ${getDataObjectByIndex(index).lastName}")),
              DataCell(Text("${getDataObjectByIndex(index).surname}")),
              DataCell(getDataObjectByIndex(index).qrcode != null
                  ? InkWell(
                      onTap: () => QrCodeGenerator.show(
                          getDataObjectByIndex(index).qrcode),
                      child: Center(
                        child: Text(
                          "${local.show} ${local.qrCode}",
                          style: getThem.textTheme.labelLarge?.copyWith(
                              color: Colors.blue,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    )
                  : Text(
                      local.empty,
                      style: getThem.textTheme.bodyMedium
                          ?.copyWith(color: kcLightGrey),
                    )),
              DataCell(Text("${getDataObjectByIndex(index).email}")),
              DataCell(Text("${getDataObjectByIndex(index).mobile}")),
              DataCell(Text("${getDataObjectByIndex(index).countOfSending}")),
            ]));
  }

  List<DataColumn> get getDataColumns {
    return [
      DataColumn(label: Text(local.procedures)),
      DataColumn(label: Text(local.status)),
      DataColumn(label: Text(local.invitationName)),
      DataColumn(label: Text(local.name)),
      DataColumn(label: Text(local.surname)),
      DataColumn(label: Text(local.qrCode)),
      DataColumn(label: Text(local.email)),
      DataColumn(label: Text(local.mobile)),
      DataColumn(label: Text(local.sendCount)),
    ];
  }

  AlreadySentInvitesDataObject getDataObjectByIndex(int index) =>
      dataList[index];
}
