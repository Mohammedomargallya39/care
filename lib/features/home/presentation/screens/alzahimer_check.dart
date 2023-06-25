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

class AlzahimerCheckScreen extends StatelessWidget {
  AlzahimerCheckScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    return Scaffold(
      backgroundColor: ColorsManager.mainColor,
      body: BlocConsumer<HomeCubit,HomeStates>(
        listener: (context, state) {
          if(state is AlzhimerTestSuccessState)
          {
            designToastDialog(context: context, toast: TOAST.success, text: state.alzahimarCheckEntity.toString().replaceAll('AlzahimarCheckModel', ''));
          }
          if(state is AlzhimerTestErrorState)
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
                            DefaultText(title: 'Alzhimar Check', style: Style.medium,color: ColorsManager.white,fontWeight: FontWeight.bold,fontSize: 30.rSp),
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
                            controller: homeCubit.ageAlzahimer,
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
                            controller: homeCubit.genderAlzahimer,
                            type: TextInputType.number,
                            hint: 'Gender',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'isEmpty';
                              }
                              return null;
                            },


                          ),
                          DefaultTextField(
                            controller: homeCubit.eDUCAlzahimer,
                            type: TextInputType.number,
                            hint: 'EDUC',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'isEmpty';
                              }
                              return null;
                            },


                          ),
                          DefaultTextField(
                            controller: homeCubit.sESAlzahimer,
                            type: TextInputType.number,
                            hint: 'SES',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'isEmpty';
                              }
                              return null;
                            },


                          ),
                          DefaultTextField(
                            controller: homeCubit.mMSEAlzahimer,
                            type: TextInputType.number,
                            hint: 'MMSE',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'isEmpty';
                              }
                              return null;
                            },


                          ),
                          DefaultTextField(
                            controller: homeCubit.eTIVAlzahimer,
                            type: TextInputType.number,
                            hint: 'ETIV',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'isEmpty';
                              }
                              return null;
                            },


                          ),
                          DefaultTextField(
                            controller: homeCubit.nWBVAlzahimer,
                            type: TextInputType.number,
                            hint: 'NWBV',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'isEmpty';
                              }
                              return null;
                            },


                          ),
                          DefaultTextField(
                            controller: homeCubit.aSFAlzahimer,
                            type: TextInputType.number,
                            hint: 'ASF',
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
                                homeCubit.alzahimerTest(
                                    gender: int.parse(homeCubit.genderAlzahimer.text),
                                    aSF: int.parse(homeCubit.aSFAlzahimer.text),
                                    eDUC: int.parse(homeCubit.eDUCAlzahimer.text),
                                    eTIV: int.parse(homeCubit.eTIVAlzahimer.text),
                                    mMSE: int.parse(homeCubit.mMSEAlzahimer.text),
                                    nWBV: int.parse(homeCubit.nWBVAlzahimer.text),
                                    sES: int.parse(homeCubit.sESAlzahimer.text),
                                    age: int.parse(homeCubit.ageAlzahimer.text)
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
