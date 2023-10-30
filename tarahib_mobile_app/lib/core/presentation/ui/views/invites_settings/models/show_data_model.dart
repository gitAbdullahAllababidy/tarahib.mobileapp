import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:stacked/stacked.dart';
import 'package:tarahib_mobile_app/app/app.locator.dart';
import 'package:tarahib_mobile_app/core/application/mixins/models_mixin.dart';
import 'package:tarahib_mobile_app/core/application/services/light_services/map_launcher_service.dart';
import 'package:tarahib_mobile_app/core/data/data_objects/invitation_settings_data_object/invitation_settings_data_object.dart';
import 'package:tarahib_mobile_app/core/data/repositories/app_repo.dart';
import 'package:tarahib_mobile_app/core/global/global_locators.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_colors.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/loading_helpers.dart';

final class ShowDataModel<ViewModel extends BaseViewModel>
    extends ModelsAbstract<ViewModel> {
  ShowDataModel();

  var dataList = <InvitationSettingsDataObject>[];

  Future getData({bool showLoader = true}) async {
    var appRepo = locator<AppRepo>();
    await appLoadingCallback(
        appRepo.getAllInvites().then((value) => value.fold(
            (l) => showError(l),
            (r) => {
                  if (r.data is List)
                    {
                      dataList = (r.data as List)
                          .map((e) => InvitationSettingsDataObject.fromMap(e))
                          .toList(),
                    }
                })),
        showLoading: showLoader && dataList.isEmpty);
  }

  List<DataRow> get getDataRows {
    return List.generate(
        dataList.length,
        (index) => DataRow(cells: [
              DataCell(IconButton(
                  onPressed: () {}, icon: const Icon(Icons.more_vert))),
              DataCell(Text("${getDataObjectByIndex(index).invitationName}")),
              DataCell(Text("${getDataObjectByIndex(index).code}")),
              DataCell(Text("${getDataObjectByIndex(index).invitationType}")),
              DataCell(getDataObjectByIndex(index).withBarcode == 1
                  ? const Center(
                      child: CircleAvatar(
                        backgroundColor: kcAppGreenColor_1,
                        radius: 8,
                      ),
                    )
                  : const SizedBox()),
              DataCell(IconButton(
                  onPressed: () {
                    MapLauncherService.run(
                        zoom: 5,
                        description: getDataObjectByIndex(index).code,
                        coords: Coords(
                            getDataObjectByIndex(index)
                                    .location
                                    ?.data
                                    ?.first
                                    .lat
                                    ?.toDouble() ??
                                0.0,
                            getDataObjectByIndex(index)
                                    .location
                                    ?.data
                                    ?.first
                                    .lang
                                    ?.toDouble() ??
                                0.0),
                        title:
                            getDataObjectByIndex(index).invitationName ?? "");
                  },
                  icon: const Icon(
                    Icons.map_outlined,
                    color: kcPrimaryColor,
                  ))),
            ]));
  }

  List<DataColumn> get getDataColumns {
    return [
      DataColumn(label: Text(local.procedures)),
      DataColumn(label: Text(local.invitationName)),
      DataColumn(label: Text(local.secretNum)),
      DataColumn(label: Text(local.invitationType)),
      DataColumn(label: Text(local.withBarcode)),
      DataColumn(label: Text(local.location)),
    ];
  }

  InvitationSettingsDataObject getDataObjectByIndex(int index) =>
      dataList[index];
}
