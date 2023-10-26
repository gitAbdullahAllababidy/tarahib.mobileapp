import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_colors.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/app_them.dart';
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
    return ViewModelBuilder.nonReactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            S.current.login,
            style: getAppThem(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: kcWhiteColor),
          ),
        ),
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
                      ),
                      verticalSpaceMedium,
                      AppTextFormFieldWidget(
                        label: S.current.password,
                      ),
                      verticalSpaceSmall,
                      const AppButtonWidget()
                    ],
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
      style: const ButtonStyle(),
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
          constraints: BoxConstraints(maxHeight: 50.h),
          labelText: label ?? "Label",
          labelStyle: getAppThem(context).textTheme.bodyMedium,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: kcVeryLightGrey.withOpacity(.4))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kcPrimaryColor))),
    );
  }
}
