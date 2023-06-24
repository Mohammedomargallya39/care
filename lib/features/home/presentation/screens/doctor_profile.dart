import 'package:care/core/util/resources/extensions_manager.dart';
import 'package:care/core/util/widgets/default_text_field.dart';
import 'package:care/features/home/presentation/controller/home_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../core/util/resources/colors_manager.dart';
import '../../../../core/util/resources/constants_manager.dart';
import '../../domain/entities/profile_entity.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({super.key, required this.result, required this.index});

  final List<ProfileEntity>? result;
  final int? index;


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
                    backgroundImage: NetworkImage(result![index!].profilePic),
                  ),
                ),
                verticalSpace(5.h),
                DefaultTextField(controller: homeCubit.nameController, hint: 'Name:  ${result![index!].userName}',disabled: true,label: 'Name',),
                DefaultTextField(controller: homeCubit.nameController, hint: 'E-mail:  ${result![index!].email}',disabled: true,label: 'Name'),
              ],
            ),
          )
      ),
    );
  }
}
