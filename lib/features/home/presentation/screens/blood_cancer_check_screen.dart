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

class BloodCancerCheckScreen extends StatelessWidget {
  BloodCancerCheckScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    return Scaffold(
      backgroundColor: ColorsManager.mainColor,
      body: BlocConsumer<HomeCubit,HomeStates>(
        listener: (context, state) {
          if(state is BloodTestSuccessState)
          {
            designToastDialog(context: context, toast: TOAST.success, text: 'For result Go to Report Screen');
            debugPrintFullText(state.bloodCheckEntity.toString());
          }
          if(state is BloodTestErrorState)
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
                            DefaultText(title: 'Blood Cancer Check', style: Style.medium,color: ColorsManager.white,fontWeight: FontWeight.bold,fontSize: 30.rSp),
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
                            controller: homeCubit.ageBlood,
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
                            controller: homeCubit.bmiBlood,
                            type: TextInputType.number,
                            hint: 'BMI',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'isEmpty';
                              }
                              return null;
                            },


                          ),
                          DefaultTextField(
                            controller: homeCubit.glucouseBlood,
                            type: TextInputType.number,
                            hint: 'Glucouse',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'isEmpty';
                              }
                              return null;
                            },


                          ),
                          DefaultTextField(
                            controller: homeCubit.insulineBlood,
                            type: TextInputType.number,
                            hint: 'Insuline',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'isEmpty';
                              }
                              return null;
                            },


                          ),
                          DefaultTextField(
                            controller: homeCubit.homaBlood,
                            type: TextInputType.number,
                            hint: 'Homa',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'isEmpty';
                              }
                              return null;
                            },


                          ),
                          DefaultTextField(
                            controller: homeCubit.leptinBlood,
                            type: TextInputType.number,
                            hint: 'Leptin',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'isEmpty';
                              }
                              return null;
                            },


                          ),
                          DefaultTextField(
                            controller: homeCubit.adiponcetinBlood,
                            type: TextInputType.number,
                            hint: 'Adiponcetin',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'isEmpty';
                              }
                              return null;
                            },


                          ),
                          DefaultTextField(
                            controller: homeCubit.resistiinBlood,
                            type: TextInputType.number,
                            hint: 'Resistiin',
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'isEmpty';
                              }
                              return null;
                            },


                          ),
                          DefaultTextField(
                            controller: homeCubit.mcpBlood,
                            type: TextInputType.number,
                            hint: 'MCP',
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
                                homeCubit.bloodTest(
                                    resistiin: int.parse(homeCubit.resistiinBlood.text),
                                    mcp: int.parse(homeCubit.mcpBlood.text),
                                    leptin: int.parse(homeCubit.leptinBlood.text),
                                    insuline: int.parse(homeCubit.insulineBlood.text),
                                    homa: int.parse(homeCubit.homaBlood.text),
                                    glucouse: int.parse(homeCubit.glucouseBlood.text),
                                    bmi: int.parse(homeCubit.bmiBlood.text),
                                    adiponcetin: int.parse(homeCubit.adiponcetinBlood.text),
                                    age: int.parse(homeCubit.ageBlood.text)
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
