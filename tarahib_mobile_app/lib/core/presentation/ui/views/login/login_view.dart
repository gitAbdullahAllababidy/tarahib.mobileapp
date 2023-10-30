import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_validator/form_validator.dart';
import 'package:stacked/stacked.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_colors.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_them.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/forms_helpers.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/ui_helpers.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/views/login/login_viewmodel.dart';
import 'package:tarahib_mobile_app/generated/l10n.dart';

class LoginView extends HookWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    useEffect(() {
      return null;
    });
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final loginFormKey = GlobalKey<FormState>();
    return ViewModelBuilder<LoginViewModel>.nonReactive(
      disposeViewModel: false,
      onViewModelReady: (viewModel) => {},
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: screenHeight(context),
            width: screenWidth(context),
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                  width: screenWidthFraction(
                    context,
                  ),
                  decoration: BoxDecoration(
                      color: kcWhiteColor,
                      borderRadius: BorderRadius.circular(4.r),
                      boxShadow: const [
                        BoxShadow(
                            color: kcVeryLightGrey,
                            spreadRadius: 2,
                            blurRadius: 10)
                      ]),
                  child: Form(
                    key: loginFormKey,
                    child: Column(
                      children: [
                        Text(
                          S.current.taraheeb,
                          style: getThem.textTheme.titleMedium
                              ?.copyWith(color: kcPrimaryColor),
                        ),
                        Text(
                          S.current.login_and_planing,
                          style: getThem.textTheme.bodyMedium
                              ?.copyWith(color: kcDarkGreyColor),
                        ),
                        verticalSpaceMedium,
                        AppTextFormFieldWidget(
                          label: S.current.email,
                          textEditingController: emailController,
                          validator:
                              ValidationBuilder().required().email().build(),
                        ),
                        verticalSpaceMedium,
                        AppTextFormFieldWidget(
                          label: S.current.password,
                          textEditingController: passwordController,
                          validator: ValidationBuilderHelper
                              .passwordValidationBuilder
                              .build(),
                        ),
                        verticalSpaceSmall,
                        AppButtonWidget(
                          voidCallback: () {
                            if (loginFormKey.currentState?.validate() ??
                                false) {
                              viewModel.loginModel.loginUser(Tuple2(
                                  emailController.value.text,
                                  passwordController.value.text));
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppButtonWidget extends StatelessWidget {
  const AppButtonWidget(
      {super.key, this.voidCallback, this.label, this.outlinedStyle = false});
  final VoidCallback? voidCallback;
  final String? label;
  final bool outlinedStyle;
  @override
  Widget build(BuildContext context) {
    return outlinedStyle
        ? OutlinedButton(
            style: OutlinedButton.styleFrom(
                side: const BorderSide(color: kcPrimaryColor, width: .3)),
            onPressed: voidCallback?.call,
            child: Text(
              label ?? S.current.submit,
              style:
                  getThem.textTheme.bodyMedium?.copyWith(color: kcPrimaryColor),
            ),
          )
        : ElevatedButton(
            onPressed: () {
              voidCallback?.call();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kcPrimaryColor,
            ),
            child: Text(label ?? S.current.submit),
          );
  }
}

class AppTextFormFieldWidget extends StatelessWidget {
  const AppTextFormFieldWidget({
    super.key,
    this.textEditingController,
    this.validator,
    this.label,
    this.textInputType,
    this.formatters,
    this.onTap,
    this.withBorders = true,
  });
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final String? label;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? formatters;
  final VoidCallback? onTap;
  final bool withBorders;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: onTap,
        child: TextFormField(
          enabled: onTap == null,
          controller: textEditingController,
          validator: validator,
          cursorColor: kcDarkGreyColor,
          cursorRadius: const Radius.circular(10),
          cursorWidth: 1,
          keyboardType: textInputType,
          inputFormatters: formatters,
          decoration: withBorders
              ? InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                  labelText: label ?? "Label" "....",
                  labelStyle: getThem.textTheme.bodyMedium,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: kcWhiteColor)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: kcVeryLightGrey)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: kcPrimaryColor)))
              : InputDecoration(
                  labelText: label ?? "Label" "....",
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: kcPrimaryColor)),
                  enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: kcVeryLightGrey)),
                ),
        ),
      ),
    );
  }
}
