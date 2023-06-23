import 'package:care/core/util/resources/extensions_manager.dart';
import 'package:care/core/util/widgets/default_text.dart';
import 'package:care/core/util/widgets/default_text_field.dart';
import 'package:care/features/home/presentation/controller/home_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../core/util/resources/colors_manager.dart';
import '../../../../core/util/resources/constants_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    return Scaffold(
      backgroundColor: ColorsManager.mainColor,
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10.rSp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                verticalSpace(10.h),
                Center(
                  child: CircleAvatar(
                    radius: 100.rSp,
                    backgroundImage: NetworkImage(picProfile!),
                  ),
                ),
                verticalSpace(5.h),
                DefaultTextField(controller: homeCubit.nameController, hint: 'Name:  $userNameProfile',disabled: true,label: 'Name',),
                DefaultTextField(controller: homeCubit.nameController, hint: 'E-mail:  $email',disabled: true,label: 'Name'),
                DefaultTextField(controller: homeCubit.nameController, hint: 'Doctor:  ${isDoctorProfile! ? 'yes' : 'No'}' ,disabled: true,label: 'Name'),
              ],
            ),
          )
      ),
    );
  }
}
