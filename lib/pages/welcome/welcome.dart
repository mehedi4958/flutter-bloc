import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: 34.h),
          width: 375.w,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              PageView(
                children: [
                  _page(
                    context,
                    1,
                    'Next',
                    'First See Learning',
                    'Forget about a paper. All knowledge in one learning!',
                    'image path',
                  ),
                  _page(
                    context,
                    2,
                    'Next',
                    'Connect with Everyone',
                    'Always keep in touch with your tutor & friends. Let\'s get connected!',
                    'image path',
                  ),
                  _page(
                    context,
                    3,
                    'Get Started',
                    'Always Fascinated Learning',
                    'Anywhere, anytime. The time is at your discretion. So, study whenever you want.',
                    'image path',
                  ),
                ],
              ),
              Positioned(
                bottom: 100.h,
                child: DotsIndicator(
                  dotsCount: 3,
                  decorator: DotsDecorator(
                    color: Colors.grey,
                    activeColor: Colors.blue,
                    size: Size.square(8.w),
                    activeSize: Size(10.w, 8.w),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
          child: Text(imagePath),
        ),
        SizedBox(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black,
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
                color: Colors.black.withValues(alpha: 0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 100.h, left: 25.w, right: 25.w),
          width: 325.w,
          height: 50.h,
          decoration: BoxDecoration(
            color: Colors.blue,
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
        )
      ],
    );
  }
}
