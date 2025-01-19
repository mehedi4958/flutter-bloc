import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/common/values/colors.dart';
import 'package:flutter_block/generated/assets.dart';
import 'package:flutter_block/pages/welcome/bloc/welcome_blocs.dart';
import 'package:flutter_block/pages/welcome/bloc/welcome_events.dart';
import 'package:flutter_block/pages/welcome/bloc/welcome_states.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 34.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      BlocProvider.of<WelcomeBloc>(context).add(WelcomeEvent());
                    },
                    children: [
                      _page(
                        context,
                        1,
                        'Next',
                        'First See Learning',
                        'Forget about a paper. All knowledge in one learning!',
                        Assets.imagesReading,
                      ),
                      _page(
                        context,
                        2,
                        'Next',
                        'Connect with Everyone',
                        'Always keep in touch with your tutor & friends. Let\'s get connected!',
                        Assets.imagesBoy,
                      ),
                      _page(
                        context,
                        3,
                        'Get Started',
                        'Always Fascinated Learning',
                        'Anywhere, anytime. The time is at your discretion. So, study whenever you want.',
                        Assets.imagesMan,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 100.h,
                    child: DotsIndicator(
                      position: state.page,
                      dotsCount: 3,
                      decorator: DotsDecorator(
                        color: AppColors.primaryThreeElementText,
                        activeColor: AppColors.primaryElement,
                        size: Size.square(8.w),
                        activeSize: Size(18.w, 8.w),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _page(BuildContext context, int index, String buttonName, String title,
      String subtitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          width: 375.w,
          child: SizedBox(
            child: Text(
              subtitle,
              style: TextStyle(
                color: AppColors.primarySecondaryElementText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
              );
            } else {
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => MyHomePage()));
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('signIn', (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  blurRadius: 1.w,
                  spreadRadius: 2.w,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
