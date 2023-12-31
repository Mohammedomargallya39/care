import 'package:care/core/util/resources/colors_manager.dart';
import 'package:care/core/util/resources/constants_manager.dart';
import 'package:care/core/util/resources/extensions_manager.dart';
import 'package:care/core/util/widgets/default_button.dart';
import 'package:care/core/util/widgets/default_text.dart';
import 'package:care/core/util/widgets/loadingPage.dart';
import 'package:care/features/home/presentation/controller/home_cubit.dart';
import 'package:care/features/home/presentation/controller/home_states.dart';
import 'package:care/features/home/presentation/screens/book_appointment_screen.dart';
import 'package:care/features/home/presentation/screens/doctor_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/profile_entity.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    HomeCubit homeCubit = HomeCubit.get(context);
    homeCubit.doctor();
    List<ProfileEntity>? results;

    return Scaffold(
      backgroundColor: ColorsManager.mainColor,
      body: SafeArea(
        child: BlocConsumer<HomeCubit,HomeStates>(
          listener: (context, state) {
            if(state is DoctorSuccessState)
            {
              results = state.doctorEntity;
            }
          },
          builder: (context, state) {
            return results == null?  const LoadingPage(): Column(
              children: [
                verticalSpace(2.h),
                Container(
                  height: 8.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(20.rSp),topRight: Radius.circular(20.rSp)),
                      gradient: const LinearGradient(colors: [Colors.blue,Colors.purple],)
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.rSp),
                        child: IconButton(
                            onPressed: ()
                            {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back , color: Colors.white,size: 30.rSp,)
                        ),
                      ),
                      horizontalSpace(5.w),
                      DefaultText(title: 'Doctor List', style: Style.medium,color: ColorsManager.white,fontWeight: FontWeight.bold,fontSize: 30.rSp),
                    ],
                  ),
                ),
                verticalSpace(4.h),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.rSp),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(15.rSp),
                          child: Container(
                            padding: EdgeInsets.all(15.rSp),
                            height: 28.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.rSp),
                                border: Border.all(color: ColorsManager.white)
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: CircleAvatar(
                                        radius: 40.rSp,
                                        backgroundImage: NetworkImage(results![index].profilePic),
                                      ),
                                    ),
                                    horizontalSpace(5.w),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          DefaultText(title:  results![index].userName, style: Style.small,color: ColorsManager.white,fontWeight: FontWeight.bold,fontSize: 22.rSp),
                                          DefaultText(title:  results![index].email, style: Style.small,color: ColorsManager.white,fontWeight: FontWeight.w300,fontSize: 18.rSp),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                verticalSpace(2.h),
                                Row(
                                  children: [
                                    Expanded(
                                      child: DefaultButton(
                                        text: 'View Profile',
                                        fontSize: 16.rSp,
                                        color: ColorsManager.secondary,
                                        onPressed: ()
                                        {
                                          navigateTo(context, DoctorProfileScreen(result: results,index: index,));
                                        },

                                      ),
                                    ),
                                    horizontalSpace(10.rSp),
                                    Expanded(
                                      child: DefaultButton(
                                        text: 'Appointment',
                                        fontSize: 16.rSp,
                                        color: ColorsManager.secondary,
                                        onPressed: ()
                                        {
                                          navigateTo(context, BookAppointmentScreen(id: results![index].id,));
                                        },

                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: results!.length,
                    ),
                  ),
                )
              ],
            );
          },

        ),
      ),
    );
  }
}
