import 'package:care/core/util/resources/colors_manager.dart';
import 'package:care/core/util/resources/constants_manager.dart';
import 'package:care/core/util/resources/extensions_manager.dart';
import 'package:care/core/util/widgets/default_button.dart';
import 'package:care/core/util/widgets/default_text.dart';
import 'package:care/features/home/presentation/controller/home_cubit.dart';
import 'package:care/features/home/presentation/controller/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/util/resources/assets.gen.dart';
import '../../domain/entities/doctor_profile_entity.dart';

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({super.key , required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {

    HomeCubit homeCubit = HomeCubit.get(context);

    List<DoctorProfileEntity> result;
    homeCubit.doctorProfile(id: id);

    DateTime today = DateTime.now();
   // String dateMonth = '0${today.month}';
    String dateMonth = today.month.toString();
    if(dateMonth.length == 1)
    {
      dateMonth = '0${today.month}';
    }
    String dateNow = '${today.year}-$dateMonth-${today.day}';
    String? timeAppointment;


    return Scaffold(
      backgroundColor: ColorsManager.mainColor,
      body: SafeArea(
        child: BlocConsumer<HomeCubit,HomeStates>(
          listener: (context, state) {
            if(state is DoctorProfileSuccessState)
            {
              result = state.doctorProfileEntity;
              for(var i =0; i< result.length ; i++)
              {
                if(result[i].date == dateNow){
                  homeCubit.dateToday.add(result[i].date);
                  if(int.parse(result[i].timeStart.split(':').first) <= 12){
                    homeCubit.morningTimes.add(result[i].timeStart);
                  }
                  if(int.parse(result[i].timeEnd.split(':').first) >= 12){
                    homeCubit.eveningTimes.add(result[i].timeEnd);
                  }
                }

              }

              debugPrintFullText(homeCubit.dateToday.toString());
              debugPrintFullText(homeCubit.morningTimes.toString());
              debugPrintFullText(homeCubit.eveningTimes.toString());

            }

            if(state is SuccessBookAppointmentState)
            {
              designToastDialog(context: context, toast: TOAST.success,text: 'Success');
            }

            if(state is ErrorBookAppointmentState)
            {
              designToastDialog(context: context, toast: TOAST.error,text: state.failure);
            }
          },
          builder: (context, state) {
            return  Column(
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
                      DefaultText(title: 'Book Appointment', style: Style.medium,color: ColorsManager.white,fontWeight: FontWeight.bold,fontSize: 30.rSp),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20.rSp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpace(4.h),
                      DefaultText(title:  '${DateTime.now().d},${DateTime.now().month} ${DateTime.now().year}', style: Style.small,color: ColorsManager.white,fontWeight: FontWeight.w600,fontSize: 16.rSp),
                      verticalSpace(2.h),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                homeCubit.chooseAppointmentTime(true);
                              },
                              child: Container(
                                height: 6.h,
                                padding: EdgeInsets.all(5.rSp),
                                decoration: BoxDecoration(
                                  color: homeCubit.isMorning == true ? ColorsManager.thirdColor : ColorsManager.white,
                                  borderRadius: BorderRadius.all(Radius.circular(10.rSp)),
                                  border: Border.all(color: ColorsManager.thirdColor)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.sunny,
                                      color: homeCubit.isMorning == true ? ColorsManager.white : ColorsManager.thirdColor,
                                    ),
                                    horizontalSpace(5.w),
                                    DefaultText(title:  'Morning', style: Style.small,
                                        color: homeCubit.isMorning == true ? ColorsManager.white : ColorsManager.thirdColor,
                                        fontWeight: FontWeight.w600,fontSize: 14.rSp),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          horizontalSpace(5.w),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                homeCubit.chooseAppointmentTime(false);
                              },
                              child: Container(
                                height: 6.h,
                                padding: EdgeInsets.all(5.rSp),
                                decoration: BoxDecoration(
                                    color: homeCubit.isMorning == true ? ColorsManager.white : ColorsManager.thirdColor,
                                  borderRadius: BorderRadius.all(Radius.circular(10.rSp)),
                                  border: Border.all(color: ColorsManager.thirdColor)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.dark_mode,
                                      color: homeCubit.isMorning == true ? ColorsManager.thirdColor : ColorsManager.white,
                                    ),
                                    horizontalSpace(5.w),
                                    DefaultText(title:  'Evening', style: Style.small,
                                        color: homeCubit.isMorning == true ? ColorsManager.thirdColor : ColorsManager.white,
                                        fontWeight: FontWeight.w600,fontSize: 14.rSp),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      verticalSpace(4.h),
                      DefaultText(title:  'Choose the Hour', style: Style.small,color: ColorsManager.white,fontWeight: FontWeight.w600,fontSize: 16.rSp),
                      verticalSpace(2.h),
                      SizedBox(
                        height: 30.h,
                        child: GridView.count(
                          physics: const BouncingScrollPhysics(),
                          crossAxisCount: 3,
                          crossAxisSpacing: 15.w,
                          mainAxisSpacing: 1.h,
                          shrinkWrap: true,
                          children: List.generate(homeCubit.isMorning == true ? homeCubit.morningTimes.length: homeCubit.eveningTimes.length, (index)
                          {
                            return InkWell(
                                onTap: () {
                                  {
                                    homeCubit.pressedIndex = index;
                                    homeCubit.selectedTime(true);
                                    timeAppointment = homeCubit.isMorning == true ? homeCubit.morningTimes [index]: homeCubit.eveningTimes [index];
                                  }
                                },
                                child: Container(
                                padding: EdgeInsets.all(5.rSp),
                                decoration: BoxDecoration(
                                    color: homeCubit.pressedIndex == index ? ColorsManager.thirdColor: ColorsManager.white,
                                    borderRadius: BorderRadius.all(Radius.circular(10.rSp)),
                                    border: Border.all(color: ColorsManager.thirdColor)
                                ),
                                child: Center(child: DefaultText(
                                    title:  homeCubit.isMorning == true ? '${homeCubit.morningTimes [index]} AM': '${homeCubit.eveningTimes [index]} PM',
                                    style: Style.small,
                                    color: homeCubit.pressedIndex == index ? ColorsManager.white : ColorsManager.thirdColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12.rSp)
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      Center(child: Image.asset(Assets.images.png.logo,height: 18.h,width: 20.w,)),
                      DefaultButton(
                          text: 'Book',
                          color: ColorsManager.secondary,
                          onPressed: ()
                          {
                            homeCubit.bookAppointment(
                                id: id,
                                date: dateNow,
                                time: timeAppointment!,
                            );
                          },
                      ),
                    ],
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
