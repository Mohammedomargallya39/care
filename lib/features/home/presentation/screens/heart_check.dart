import 'package:care/core/util/resources/colors_manager.dart';
import 'package:care/core/util/resources/extensions_manager.dart';
import 'package:care/core/util/widgets/default_button.dart';
import 'package:care/core/util/widgets/default_text_field.dart';
import 'package:care/features/home/presentation/controller/home_cubit.dart';
import 'package:care/features/home/presentation/controller/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/util/resources/constants_manager.dart';
import '../../../../core/util/widgets/default_text.dart';

class HeartCheckScreen extends StatelessWidget {
  HeartCheckScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    return Scaffold(
      backgroundColor: ColorsManager.mainColor,
      body: BlocConsumer<HomeCubit,HomeStates>(
        listener: (context, state) {
          if(state is HeartTestSuccessState)
          {
            designToastDialog(context: context, toast: TOAST.success, text: state.heartCheckEntity.toString().replaceAll('HeartCheckModel', ''));
          }
          if(state is HeartTestErrorState)
          {
            designToastDialog(context: context, toast: TOAST.error, text: state.failure);
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    verticalSpace(2.h),
                    Container(
                      height: 8.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.rSp),topRight: Radius.circular(20.rSp)),
                          gradient: const LinearGradient(colors: [Colors.blue,Colors.purple],)
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.rSp),
                        child: Row(
                          children: [
                            IconButton(onPressed: ()
                            {
                              Navigator.pop(context);
                            }, icon:const Icon( Icons.arrow_back,color: ColorsManager.white,)),
                            DefaultText(title: 'Heart Check', style: Style.medium,color: ColorsManager.white,fontWeight: FontWeight.bold,fontSize: 30.rSp),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.rSp),
                      child: Column(
                        children: [
                          verticalSpace(4.h),
                          DefaultTextField(
                            controller: homeCubit.ageHeart,
                            type: TextInputType.number,
                            hint: 'Age',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'isEmpty';
                              }
                              return null;
                            },
                          ),
                          DefaultTextField(
                            controller: homeCubit.sexHeart,
                            type: TextInputType.number,
                            hint: 'Sex',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'isEmpty';
                              }
                              return null;
                            },
                          ),
                          DefaultTextField(
                            controller: homeCubit.chestPainTypeHeart,
                            type: TextInputType.number,
                            hint: 'Chest Pain Type',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'isEmpty';
                              }
                              return null;
                            },
                          ),
                          DefaultTextField(
                            controller: homeCubit.cholesterolHeart,
                            type: TextInputType.number,
                            hint: 'Cholesterol',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'isEmpty';
                              }
                              return null;
                            },
                          ),
                          DefaultTextField(
                            controller: homeCubit.fastingBSHeart,
                            type: TextInputType.number,
                            hint: 'Fasting BS',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'isEmpty';
                              }
                              return null;
                            },
                          ),
                          DefaultTextField(
                            controller: homeCubit.maxHRHeart,
                            type: TextInputType.number,
                            hint: 'Max HR',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'isEmpty';
                              }
                              return null;
                            },
                          ),
                          DefaultTextField(
                            controller: homeCubit.exerciseAnginaHeart,
                            type: TextInputType.number,
                            hint: 'Exercise Angina',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'isEmpty';
                              }
                              return null;
                            },
                          ),
                          DefaultTextField(
                            controller: homeCubit.oldPeakHeart,
                            type: TextInputType.number,
                            hint: 'Old Peak',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'isEmpty';
                              }
                              return null;
                            },
                          ),
                          DefaultTextField(
                            controller: homeCubit.sTSlopeHeart,
                            type: TextInputType.number,
                            hint: 'ST Slope',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'isEmpty';
                              }
                              return null;
                            },
                          ),
                          verticalSpace(4.h),
                          DefaultButton(
                            text: 'Show Result',
                            color: ColorsManager.secondary,
                            onPressed: ()
                            {
                              if (formKey.currentState!.validate())
                              {
                                homeCubit.heartTest(
                                    chestPainType: int.parse(homeCubit.chestPainTypeHeart.text),
                                    cholesterol: int.parse(homeCubit.cholesterolHeart.text),
                                    exerciseAngina: int.parse(homeCubit.exerciseAnginaHeart.text),
                                    fastingBS: int.parse(homeCubit.fastingBSHeart.text),
                                    maxHR: int.parse(homeCubit.maxHRHeart.text),
                                    oldpeak: int.parse(homeCubit.oldPeakHeart.text),
                                    sex: int.parse(homeCubit.sexHeart.text),
                                    sT_Slope: int.parse(homeCubit.sTSlopeHeart.text),
                                    age: int.parse(homeCubit.ageHeart.text)
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}