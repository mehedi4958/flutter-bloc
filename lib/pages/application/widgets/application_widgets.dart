import 'package:flutter/material.dart';
import 'package:flutter_block/common/values/colors.dart';
import 'package:flutter_block/generated/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildPage(int index) {
  List<Widget> widgets = [
    Center(child: Text('Home')),
    Center(child: Text('Search')),
    Center(child: Text('Courses')),
    Center(child: Text('Chat')),
    Center(child: Text('Profile')),
  ];
  return widgets[index];
}

var bottomNavItems = [
  BottomNavigationBarItem(
    label: 'Home',
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(Assets.iconsHome),
    ),
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        Assets.iconsHome,
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: 'Search',
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(Assets.iconsSearch2),
    ),
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        Assets.iconsSearch2,
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: 'Courses',
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(Assets.iconsPlayCircle1),
    ),
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        Assets.iconsPlayCircle1,
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: 'Chat',
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(Assets.iconsMessageCircle),
    ),
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        Assets.iconsMessageCircle,
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
    label: 'Account',
    icon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(Assets.iconsPerson2),
    ),
    activeIcon: SizedBox(
      height: 15.h,
      width: 15.w,
      child: Image.asset(
        Assets.iconsPerson2,
        color: AppColors.primaryElement,
      ),
    ),
  ),
];
