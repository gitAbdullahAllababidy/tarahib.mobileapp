import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:tarahib_mobile_app/app/app.locator.dart';
import 'package:tarahib_mobile_app/core/application/mixins/models_mixin.dart';
import 'package:tarahib_mobile_app/core/data/data_objects/attendance_data_object/attendance_data_object.dart';
import 'package:tarahib_mobile_app/core/data/repositories/app_repo.dart';
import 'package:tarahib_mobile_app/core/global/global_locators.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_colors.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/loading_helpers.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/widgets/floating_action_with_drawer_and_appbar_app_home_view.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/widgets/root_widget.dart';

class AttendanceView extends StatelessWidget {
  const AttendanceView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AttendanceViewModel>.nonReactive(
        onViewModelReady: (viewModel) => {
              viewModel.showDataModel
                  .getData()
                  .whenComplete(() => viewModel.rebuildUi())
            },
        viewModelBuilder: () => AttendanceViewModel(),
        builder: (context, viewModel, _) {
          return FloatingActionWithDrawerAndAppbarAppHomeView(
              appbarSettings: AppbarSettings(title: local.audience),
              body: const RootWidget(chields: [_TableWidget()]));
        });
  }
}

class AttendanceViewModel extends BaseViewModel {
  final showDataModel = locator<ShowDataModelForAttendance<AttendanceViewModel>>();
}

final class ShowDataModelForAttendance<ViewModel extends BaseViewModel>
    extends ModelsAbstract<ViewModel> {
  ShowDataModelForAttendance();

  var dataList = <AttendanceDataObject>[];

  Future getData() async {
    var appRepo = locator<AppRepo>();
    await appLoadingCallback(
        appRepo.getAllAttendanceInvites().then((value) => value.fold(
            (l) => showError(l),
            (r) => {
                  if (r.data is List)
                    {
                      dataList = (r.data as List)
                          .map((e) => AttendanceDataObject.fromMap(e))
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
              DataCell(Text("${getDataObjectByIndex(index).user?.fullName}")),
              DataCell(Text("${getDataObjectByIndex(index).user?.email}")),
              DataCell(Text("${getDataObjectByIndex(index).user?.mobile}")),
            ]));
  }

  List<DataColumn> get getDataColumns {
    return [
      DataColumn(label: Text(local.invitationName)),
      DataColumn(label: Text(local.name)),
      DataColumn(label: Text(local.email)),
      DataColumn(label: Text(local.mobile)),
    ];
  }

  AttendanceDataObject getDataObjectByIndex(int index) => dataList[index];
}

class _TableWidget extends StatelessWidget {
  const _TableWidget();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AttendanceViewModel>(context);
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
