import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
    final companioCountController = useTextEditingController();

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
                            validator: ValidationBuilderHelper
                                .nameValidationBuilder
                                .build(),
                          ),
                        ),
                        horizontalSpaceSmall,
                        Flexible(
                          child: AppTextFormFieldWidget(
                            label: local.companionsCount,
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
                      validator: ValidationBuilderHelper.emailValidationBuilder
                          .build(),
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
