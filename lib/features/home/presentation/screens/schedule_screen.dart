import 'package:care/core/util/resources/colors_manager.dart';
import 'package:care/core/util/resources/constants_manager.dart';
import 'package:care/core/util/resources/extensions_manager.dart';
import 'package:care/core/util/widgets/default_text.dart';
import 'package:care/core/util/widgets/loadingPage.dart';
import 'package:care/features/home/presentation/controller/home_cubit.dart';
import 'package:care/features/home/presentation/controller/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/get_appointment_entity.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {

    HomeCubit homeCubit = HomeCubit.get(context);
    homeCubit.getAppointment();
    List<GetAppointmentEntity>? result;

    return Scaffold(
      backgroundColor: ColorsManager.mainColor,
      body: SafeArea(
        child: BlocConsumer<HomeCubit,HomeStates>(
          listener: (context, state) {
            if(state is GetAppointmentSuccessState)
            {
              result = state.getAppointmentEntity;
            }
          },
          builder: (context, state) {
            return Column(
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
                      DefaultText(title: 'Appointment List', style: Style.medium,color: ColorsManager.white,fontWeight: FontWeight.bold,fontSize: 30.rSp),
                    ],
                  ),
                ),
                verticalSpace(4.h),
                result == null ? const LoadingPage():
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
                            height: 16.h,
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
                                        backgroundImage: NetworkImage(result![index].doctorData.doctorPic),
                                      ),
                                    ),
                                    horizontalSpace(5.w),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          DefaultText(title:  result![index].doctorData.doctorUserName, style: Style.small,color: ColorsManager.white,fontWeight: FontWeight.bold,fontSize: 22.rSp),
                                          DefaultText(title:  result![index].doctorData.doctorEmail, style: Style.small,color: ColorsManager.white,fontWeight: FontWeight.w300,fontSize: 18.rSp),
                                          DefaultText(title:  'Date: ${ result![index].date}', style: Style.small,color: ColorsManager.white,fontWeight: FontWeight.w300,fontSize: 16.rSp),
                                          DefaultText(title:  'Schedule: ${ result![index].time}', style: Style.small,color: ColorsManager.white,fontWeight: FontWeight.w300,fontSize: 16.rSp),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: result!.length,
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
