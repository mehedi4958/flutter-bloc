import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/common/values/colors.dart';
import 'package:flutter_block/generated/assets.dart';
import 'package:flutter_block/pages/application/bloc/application_blocs.dart';
import 'package:flutter_block/pages/application/bloc/application_events.dart';
import 'package:flutter_block/pages/application/bloc/application_sates.dart';
import 'package:flutter_block/pages/application/widgets/application_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBlocs, ApplicationStates>(
        builder: (context, state) {
      return Container(
        color: Colors.white,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: buildPage(state.index),
            bottomNavigationBar: Container(
              // width: 375.w,
              height: 58.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                  ),
                ],
              ),
              child: BottomNavigationBar(
                currentIndex: state.index,
                onTap: (value) {
                  context
                      .read<ApplicationBlocs>()
                      .add(TriggerApplicationEvent(value));
                },
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: AppColors.primaryElement,
                unselectedItemColor: AppColors.primaryFourElementText,
                backgroundColor: Colors.white,
                items: [
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
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
