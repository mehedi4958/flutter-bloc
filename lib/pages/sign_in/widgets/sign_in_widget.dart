import 'package:flutter/material.dart';
import 'package:flutter_block/generated/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    // backgroundColor: Colors.white,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: Colors.grey.withValues(alpha: 0.5),
        // height defines the thickness of the line
        height: 1.0,
      ),
    ),
    title: Text(
      'Log In',
      style: TextStyle(
        color: Colors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}

/// we need context here to access bloc
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        reusableIcon(Assets.iconsGoogle),
        reusableIcon(Assets.iconsApple),
        reusableIcon(Assets.iconsFacebook),
      ],
    ),
  );
}

/// reusable icon
Widget reusableIcon(String iconName) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      height: 40.w,
      width: 40.w,
      child: Image.asset(iconName),
    ),
  );
}
