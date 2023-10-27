import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
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
    return ViewModelBuilder.nonReactive(
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
                          style: getAppThem(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: kcPrimaryColor),
                        ),
                        Text(
                          S.current.login_and_planing,
                          style: getAppThem(context)
                              .textTheme
                              .bodyMedium
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
                            viewModel.loginModel.loginUser(Tuple2(
                                emailController.value.text,
                                passwordController.value.text));
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
  const AppButtonWidget({
    super.key,
    this.voidCallback,
    this.label,
  });
  final VoidCallback? voidCallback;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        voidCallback?.call();
      },
      style: ElevatedButton.styleFrom(backgroundColor: kcPrimaryColor),
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
  });
  final TextEditingController? textEditingController;
  final String? Function(String?)? validator;
  final String? label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: validator,
      cursorColor: kcDarkGreyColor,
      cursorRadius: const Radius.circular(10),
      cursorWidth: 1,
      decoration: InputDecoration(
          labelText: label ?? "Label",
          labelStyle: getAppThem(context).textTheme.bodyMedium,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: kcVeryLightGrey.withOpacity(.4))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kcPrimaryColor))),
    );
  }
}
