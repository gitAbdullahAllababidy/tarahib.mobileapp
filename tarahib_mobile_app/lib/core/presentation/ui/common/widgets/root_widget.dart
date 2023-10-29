import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tarahib_mobile_app/core/presentation/ui/common/ui_helpers.dart';

class RootWidget extends StatelessWidget {
  const RootWidget({
    super.key,
    required this.chields,
  });
  final List<Widget> chields;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 15.0.h),
          children: [verticalSpaceMedium, ...chields],
        ),
      ),
    );
  }
}
