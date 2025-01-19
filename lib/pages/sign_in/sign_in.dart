import 'package:flutter/material.dart';
import 'package:flutter_block/generated/assets.dart';
import 'package:flutter_block/pages/sign_in/widgets/sign_in_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildAppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildThirdPartyLogin(context),
                Center(
                  child: reusableText('Or use your email account to login'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 66.h),
                  padding: EdgeInsets.only(left: 25.w, right: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      reusableText('Email'),
                      Gap(5.h),
                      buildTextField(
                        'Enter your email address',
                        TextInputType.emailAddress,
                        Assets.iconsUser,
                      ),
                      reusableText('Password'),
                      Gap(5.h),
                      buildTextField(
                        'Enter your password',
                        TextInputType.text,
                        Assets.iconsLock,
                        obscured: true,
                      ),
                      forgotPassword(),
                      buildLoginAndRegistrationButton('Log in', 0),
                      buildLoginAndRegistrationButton('Register', 1),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
