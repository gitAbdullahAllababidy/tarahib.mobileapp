import 'package:flutter/material.dart';
import 'package:tarahib_mobile_app/app/app.locator.dart';
import 'package:tarahib_mobile_app/core/application/mixins/models_mixin.dart';
import 'package:tarahib_mobile_app/core/data/data_objects/contacts_list_object/contacts_list_object.dart';
import 'package:tarahib_mobile_app/core/data/repositories/contacts_repo.dart';
import 'package:tarahib_mobile_app/core/global/global_locators.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/loading_helpers.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/home/home_viewmodel.dart';

final class ShowContactsModel extends ModelsAbstract<HomeViewModel> {
  ShowContactsModel();

  var contactsList = <ContactsListObject>[];

  getAllContacts() {
    var contactRepo = locator<ContactsRepo>();
    appLoadingCallback(
        viewModel.runBusyFuture(
          contactRepo.getAllContacts().then((value) => value.fold(
              (l) => showError(l),
              (r) => {
                    if (r.data is List)
                      {
                        contactsList = (r.data as List)
                            .map((e) => ContactsListObject.fromMap(e))
                            .toList(),
                      }
                  })),
        ),
        showLoading: contactsList.isEmpty);
  }

  List<DataRow> get getDataRows {
    return List.generate(
        contactsList.length,
        (index) => DataRow(cells: [
              DataCell(IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.miscellaneous_services_sharp))),
              DataCell(Text(
                  "${getContactByIndex(index).firstName} ${getContactByIndex(index).lastName}")),
              DataCell(Text("${getContactByIndex(index).email}")),
              DataCell(Text("${getContactByIndex(index).mobile}")),
              DataCell(Text("${getContactByIndex(index).surname}")),
              DataCell(Text("${getContactByIndex(index).companionCount}")),
            ]));
  }

  List<DataColumn> get getDataColumns {
    return [
      DataColumn(label: Text(local.procedures)),
      DataColumn(label: Text(local.name)),
      DataColumn(label: Text(local.email)),
      DataColumn(label: Text(local.mobile)),
      DataColumn(label: Text(local.surname)),
      DataColumn(label: Text(local.companionsCount)),
    ];
  }

  ContactsListObject getContactByIndex(int index) => contactsList[index];
}
