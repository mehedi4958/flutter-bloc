import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/generated/assets.dart';
import 'package:flutter_block/pages/register/bloc/register_blocs.dart';
import 'package:flutter_block/pages/register/bloc/register_events.dart';
import 'package:flutter_block/pages/register/bloc/register_states.dart';
import 'package:flutter_block/pages/welcome/common_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterStates>(
        builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: buildAppBar('Sign Up'),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(20.h),
                  Center(
                    child: reusableText(
                        'Enter your details for free registration'),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 36.h),
                    padding: EdgeInsets.only(left: 25.w, right: 25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText('User Name'),
                        buildTextField(
                          'Enter your user name',
                          TextInputType.text,
                          Assets.iconsUser,
                          (value) {
                            context
                                .read<RegisterBlocs>()
                                .add(UserNameEvent(value));
                          },
                        ),
                        reusableText('Email'),
                        buildTextField(
                          'Enter your email address',
                          TextInputType.emailAddress,
                          Assets.iconsUser,
                          (value) {
                            context
                                .read<RegisterBlocs>()
                                .add(EmailEvent(value));
                          },
                        ),
                        reusableText('Password'),
                        buildTextField(
                          'Enter your password',
                          TextInputType.text,
                          Assets.iconsLock,
                          (value) {
                            context
                                .read<RegisterBlocs>()
                                .add(PasswordEvent(value));
                          },
                          obscured: true,
                        ),
                        reusableText('Confirm Password'),
                        buildTextField(
                          'Re-enter your password',
                          TextInputType.text,
                          Assets.iconsLock,
                          (value) {
                            context
                                .read<RegisterBlocs>()
                                .add(RePasswordEvent(value));
                          },
                          obscured: true,
                        ),
                        reusableText(
                            'By creating an account you agree to our terms & conditions.'),
                        buildLoginAndRegistrationButton('Register', 0, () {
                          Navigator.of(context).pushNamed('register');
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
