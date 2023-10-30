// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:tarahib_mobile_app/core/global/global_locators.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/forms_helpers.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/ui_helpers.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/widgets/floating_action_with_drawer_and_appbar_app_home_view.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/widgets/root_widget.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/login/login_view.dart';

enum InvitesTypesEnum {
  contact("جهات الاتصال", 1),
  newInvite("جديد", 2);

  final String str;
  final int id;
  const InvitesTypesEnum(this.str, this.id);
}

class SendInvitesView extends HookWidget {
  const SendInvitesView({super.key});

  @override
  Widget build(BuildContext context) {
    final inviteNameController = useTextEditingController();
    final firstNameController = useTextEditingController();

    final emailController = useTextEditingController();
    final mobileController = useTextEditingController();
    final companionCountController = useTextEditingController();
    final dateTimeController = useTextEditingController();
    final surnameController = useTextEditingController();

    return ViewModelBuilder<SendInvitesViewModel>.reactive(
        viewModelBuilder: () => SendInvitesViewModel(),
        builder: (context, viewModel, _) {
          return FloatingActionWithDrawerAndAppbarAppHomeView(
              appbarSettings: AppbarSettings(title: local.sendInvitations),
              body: RootWidget(chields: [
                Text(local.generalSettings),
                spacedDivider3,
                verticalSpaceMedium,
                Form(
                    child: Column(
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          Flexible(
                            child: AppTextFormFieldWidget(
                              label: local.invitationName,
                              textEditingController: inviteNameController,
                              validator: ValidationBuilderHelper
                                  .nameValidationBuilder
                                  .build(),
                            ),
                          ),
                          horizontalSpaceMedium,
                          DropdownButton<InvitesTypesEnum>(
                              value: viewModel.selectedSendType,
                              hint: Text(local.sendType),
                              items: InvitesTypesEnum.values
                                  .map(
                                      (e) => DropdownMenuItem<InvitesTypesEnum>(
                                            value: e,
                                            child: Text(e.str),
                                          ))
                                  .toList(),
                              onChanged: (s) {
                                viewModel.selectedSendType = s;
                              }),
                        ],
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Row(
                        children: [
                          Switch(
                              value: viewModel.scheduled,
                              onChanged: (v) {
                                viewModel.scheduled = v;
                              }),
                          Text(local.scheduled),
                        ],
                      ),
                    ),
                    if (viewModel.scheduled) ...[
                      verticalSpaceMedium,
                      Row(
                        children: [
                          Text(local.dateAndTime),
                        ],
                      ),
                      spacedDivider3,
                      verticalSpaceSmall,
                      AppTextFormFieldWidget(
                        textEditingController: dateTimeController,
                        onTap: () async {
                          var selectedDate = DateTime.now().toLocal();
                          var selectedTime = TimeOfDay.now();
                          showDatePicker(
                            context: context,
                            initialDate: viewModel.selectedDateTime,
                            firstDate: viewModel.selectedDateTime,
                            lastDate: DateTime(2030),
                          ).then((value) async {
                            selectedDate = value ?? DateTime.now().toLocal();
                            selectedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now()) ??
                                TimeOfDay.now();

                            var parsedSelectedDate =
                                DateFormat.yMMMEd().format(selectedDate);
                            dateTimeController.text =
                                "$parsedSelectedDate -  ${selectedTime.format(context)}";
                          });
                        },
                        label: local.dateAndTime,
                      )
                    ],
                    verticalSpaceMedium,
                    Row(
                      children: [
                        Text(local.details),
                      ],
                    ),
                    spacedDivider3,
                    verticalSpaceSmall,
                    Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: AppTextFormFieldWidget(
                            label: local.name,
                            textEditingController: firstNameController,
                            validator: ValidationBuilderHelper
                                .nameValidationBuilder
                                .build(),
                          ),
                        ),
                        horizontalSpaceSmall,
                        Flexible(
                          child: AppTextFormFieldWidget(
                            label: local.companionsCount,
                            textEditingController: companionCountController,
                            validator: ValidationBuilderHelper
                                .numberValidationBuilder
                                .build(),
                            formatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            textInputType:
                                const TextInputType.numberWithOptions(
                                    decimal: false, signed: false),
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceMedium,
                    Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: AppTextFormFieldWidget(
                            label: local.surname,
                            textEditingController: surnameController,
                            validator: ValidationBuilderHelper
                                .nameValidationBuilder
                                .build(),
                          ),
                        ),
                        horizontalSpaceSmall,
                        Flexible(
                          flex: 3,
                          child: AppTextFormFieldWidget(
                            label: local.mobile,
                            textEditingController: mobileController,
                            validator: ValidationBuilderHelper
                                .numberValidationBuilder
                                .build(),
                            formatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            textInputType:
                                const TextInputType.numberWithOptions(
                                    decimal: false, signed: false),
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceMedium,
                    AppTextFormFieldWidget(
                      label: local.email,
                      textEditingController: emailController,
                      validator: ValidationBuilderHelper.emailValidationBuilder
                          .build(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Switch(
                            value: viewModel.saveAsNewContact,
                            onChanged: (v) {
                              viewModel.saveAsNewContact = v;
                            }),
                        Text(local.saveAsNewContact)
                      ],
                    ),
                    verticalSpaceMedium,
                    FractionallySizedBox(
                      widthFactor: .8,
                      child: AppButtonWidget(
                        label: local.submit,
                      ),
                    )
                  ],
                ))
              ]));
        });
  }
}

class SendInvitesViewModel extends BaseViewModel {
  var _selectedSendType = InvitesTypesEnum.newInvite;

  get selectedSendType => _selectedSendType;

  set selectedSendType(value) {
    _selectedSendType = value;
    rebuildUi();
  }

  var _scheduled = false;

  get scheduled => _scheduled;

  set scheduled(value) {
    _scheduled = value;
    rebuildUi();
  }

  var _saveAsNewContact = true;

  get saveAsNewContact => _saveAsNewContact;

  set saveAsNewContact(value) {
    _saveAsNewContact = value;
    rebuildUi();
  }

  var _selectedDateTime = DateTime.now().toLocal();

  get selectedDateTime => _selectedDateTime;

  set selectedDateTime(value) {
    _selectedDateTime = value;
    rebuildUi();
  }
}
