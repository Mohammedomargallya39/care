import 'package:care/core/util/resources/extensions_manager.dart';
import 'package:care/core/util/widgets/default_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/util/resources/colors_manager.dart';
import '../../../../core/util/resources/constants_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                DefaultText(title: 'User name: $userNameProfile', style: Style.small,color: Colors.white,),
                DefaultText(title: 'Email: $email', style: Style.small,color: Colors.white,),
                DefaultText(title: 'Doctor: ${isDoctorProfile! ?'yes' : 'No'}', style: Style.small,color: Colors.white,),
              ],
            ),
          )
      ),
    );
  }
}
