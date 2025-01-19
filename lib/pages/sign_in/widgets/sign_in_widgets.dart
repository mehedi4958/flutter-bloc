import 'package:flutter/material.dart';
import 'package:flutter_block/common/values/colors.dart';
import 'package:flutter_block/generated/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppBar() {
  return AppBar(
    //surfaceTintColor: Colors.white,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: AppColors.primarySecondaryBackground,
        // height defines the thickness of the line
        height: 1.0,
      ),
    ),
    title: Text(
      'Log In',
      style: TextStyle(
        color: AppColors.primaryText,
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
    padding: EdgeInsets.only(left: 25.w, right: 25.w),
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

/// reusable String
Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withValues(alpha: 0.9),
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
      ),
    ),
  );
}

/// text field
Widget buildTextField(String hintText, TextInputType textType, String iconName,
    {bool? obscured}) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(bottom: 20.h),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15.r),
      border: Border.all(color: AppColors.primaryFourElementText),
    ),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 17.w),
          height: 16.w,
          width: 16.w,
          child: Image.asset(iconName),
        ),
        Container(
          padding: EdgeInsets.only(top: 4.h),
          height: 50.h,
          width: 270.w,
          child: TextField(
            keyboardType: textType,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColors.primarySecondaryElementText,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.normal,
              fontSize: 14.sp,
            ),
            autocorrect: false,
            obscureText: obscured ?? false,
          ),
        ),
      ],
    ),
  );
}

/// forgot password
Widget forgotPassword() {
  return SizedBox(
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        'Forgot Password?',
        style: TextStyle(
          color: AppColors.primaryText,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryText,
          fontSize: 12.sp,
        ),
      ),
    ),
  );
}

/// login and registration button
Widget buildLoginAndRegistrationButton(String buttonText, int buttonType) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: 350.w,
      height: 50.h,
      margin: EdgeInsets.only(top: buttonType == 0 ? 40.h : 20.h),
      decoration: BoxDecoration(
        color: buttonType == 0
            ? AppColors.primaryElement
            : AppColors.primaryBackground,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: buttonType == 0
              ? Colors.transparent
              : AppColors.primaryFourElementText,
        ),
        boxShadow: [
          BoxShadow(
            spreadRadius: 1.w,
            blurRadius: 1.w,
            offset: Offset(0, 1),
            color: Colors.grey.withValues(alpha: 0.1),
          ),
        ],
      ),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            color: buttonType == 0
                ? AppColors.primaryBackground
                : AppColors.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
