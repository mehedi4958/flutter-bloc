import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/common/values/colors.dart';
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
                items: bottomNavItems,
              ),
            ),
          ),
        ),
      );
    });
  }
}
