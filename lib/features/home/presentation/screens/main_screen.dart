import 'package:care/core/util/resources/colors_manager.dart';
import 'package:care/core/util/resources/extensions_manager.dart';
import 'package:care/features/home/presentation/controller/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../../../core/util/resources/appString.dart';
import '../controller/home_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    ScreenSizes.screenHeight = MediaQuery.of(context).size.height;
    ScreenSizes.screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<HomeCubit,HomeStates>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: Container(
            height: 7.h,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(18.rSp),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black,
                  )
                ]
            ),
            margin: EdgeInsetsDirectional.only(bottom:20.rSp,start: 20.rSp,end: 20.rSp),
            child: SafeArea(
              child: GNav(
                rippleColor: Colors.grey,
                hoverColor: Colors.grey,
                gap: 2,
                activeColor: ColorsManager.secondary,
                iconSize: 30.rSp,
                padding: EdgeInsets.symmetric( horizontal: 5.w),
                duration: const Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey,
                color: Colors.black,
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: AppString.home,
                  ),
                  GButton(
                    icon: Icons.date_range,
                    text: AppString.schedule,
                  ),
                  GButton(
                    icon: Icons.task,
                    text: AppString.report,
                  ),
                  GButton(
                    icon: Icons.person,
                    text: AppString.profile,
                  ),
                ],
                selectedIndex: homeCubit.currentNavIndex,
                onTabChange: (index)
                {
                  homeCubit.changeNavBottomScreens(index);
                },
              ),
            ),
          ),
          backgroundColor: ColorsManager.mainColor,
          body: homeCubit.widgets.elementAt(homeCubit.currentNavIndex),
        );
      },
    );
  }
}
