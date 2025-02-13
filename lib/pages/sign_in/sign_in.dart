import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/generated/assets.dart';
import 'package:flutter_block/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:flutter_block/pages/sign_in/bloc/sign_in_events.dart';
import 'package:flutter_block/pages/sign_in/bloc/sign_in_states.dart';
import 'package:flutter_block/pages/sign_in/sign_in_controller.dart';
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
    return BlocBuilder<SignInBlocs, SignInStates>(builder: (context, state) {
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
                    margin: EdgeInsets.only(top: 36.h),
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
                          (value) {
                            context.read<SignInBlocs>().add(EmailEvent(value));
                          },
                        ),
                        reusableText('Password'),
                        Gap(5.h),
                        buildTextField(
                          'Enter your password',
                          TextInputType.text,
                          Assets.iconsLock,
                          (value) {
                            context
                                .read<SignInBlocs>()
                                .add(PasswordEvent(value));
                          },
                          obscured: true,
                        ),
                        forgotPassword(),
                        buildLoginAndRegistrationButton('Log in', 0, () {
                          print('Login Button Clicked');
                          SignInController(context: context)
                              .handleSignIn('email');
                        }),
                        buildLoginAndRegistrationButton('Register', 1, () {
                          print('Register Button Clicked');
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
