import 'package:care/core/util/resources/colors_manager.dart';
import 'package:care/core/util/resources/constants_manager.dart';
import 'package:care/core/util/resources/extensions_manager.dart';
import 'package:care/core/util/widgets/default_text.dart';
import 'package:care/features/home/presentation/controller/home_cubit.dart';
import 'package:care/features/home/presentation/controller/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/ai_result_entity.dart';

class HistoryAIResultsScreen extends StatelessWidget {
  const HistoryAIResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    homeCubit.aiResults(id: userId!);
    AiResultsEntity? results;

    return Scaffold(
      backgroundColor: ColorsManager.mainColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: BlocConsumer<HomeCubit,HomeStates>(
            listener: (context, state) {
              if(state is AiResultsSuccessState)
              {
                results = state.aiResultsEntity;
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
                    child: Padding(
                      padding: EdgeInsets.all(10.rSp),
                      child: DefaultText(title: 'History AI Results', style: Style.medium,color: ColorsManager.white,fontWeight: FontWeight.bold,fontSize: 30.rSp),
                    ),
                  ),

                  if(results != null)
                  Column(
                    children: [
                      verticalSpace(4.h),
                      Padding(
                        padding: EdgeInsets.all(10.rSp),
                        child: Card(
                          color: ColorsManager.secondryColor,
                          elevation: 10.rSp,
                          child: ExpansionTile(
                            controlAffinity: ListTileControlAffinity.leading,
                            childrenPadding: EdgeInsets.symmetric(vertical: 10.rSp, horizontal: 10.rSp),
                            expandedAlignment: Alignment.centerLeft,
                            expandedCrossAxisAlignment: CrossAxisAlignment.start,
                            maintainState: true,
                            title: DefaultText(
                              title: 'Last Blood Result',
                              style: Style.small,
                              color: ColorsManager.white,
                              fontSize: 18.rSp,
                            ),
                            // contents
                            children: [
                              DefaultText(
                                title: 'Patient Name: ${results!.bloodTest.patient_username}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'Age: ${results!.bloodTest.age}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'BMI: ${results!.bloodTest.bmi}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'Glucouse: ${results!.bloodTest.glucouse}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'Insuline: ${results!.bloodTest.insuline}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'Homa: ${results!.bloodTest.homa}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'Leptin: ${results!.bloodTest.leptin}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'Adiponcetin: ${results!.bloodTest.adiponcetin}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'MCP: ${results!.bloodTest.mcp}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'date: ${results!.bloodTest.date}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'result: ${results!.bloodTest.result}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                            ],
                          ),
                        ),
                      ),

                      verticalSpace(4.h),
                      Padding(
                        padding: EdgeInsets.all(10.rSp),
                        child: Card(
                          color: ColorsManager.secondryColor,
                          elevation: 10.rSp,
                          child: ExpansionTile(
                            expandedAlignment: Alignment.centerLeft,
                            expandedCrossAxisAlignment: CrossAxisAlignment.start,
                            controlAffinity: ListTileControlAffinity.leading,
                            childrenPadding: EdgeInsets.symmetric(vertical: 10.rSp, horizontal: 10.rSp),
                            maintainState: true,
                            title: DefaultText(
                              title: 'Last Heart Result',
                              style: Style.small,
                              color: ColorsManager.white,
                              fontSize: 18.rSp,
                            ),
                            // contents
                            children: [
                              DefaultText(
                                title: 'Patient Name: ${results!.heartTest.patient_username}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'Age:  ${results!.heartTest.age}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'Sex:  ${results!.heartTest.sex}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'Chest Pain:  ${results!.heartTest.chestPainType}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'Cholesterol:  ${results!.heartTest.cholesterol}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'Fasting BS:  ${results!.heartTest.fastingBS}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'Max HR:  ${results!.heartTest.maxHR}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'Exercise Angina:  ${results!.heartTest.exerciseAngina}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'Old Peak:  ${results!.heartTest.oldpeak}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'ST Slope:  ${results!.heartTest.sT_Slope}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'date:  ${results!.heartTest.date}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'result:  ${results!.heartTest.result}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                            ],
                          ),
                        ),
                      ),

                      verticalSpace(4.h),
                      Padding(
                        padding: EdgeInsets.all(10.rSp),
                        child: Card(
                          color: ColorsManager.secondryColor,
                          elevation: 10.rSp,
                          child: ExpansionTile(
                            expandedAlignment: Alignment.centerLeft,
                            expandedCrossAxisAlignment: CrossAxisAlignment.start,
                            controlAffinity: ListTileControlAffinity.leading,
                            childrenPadding: EdgeInsets.symmetric(vertical: 10.rSp, horizontal: 10.rSp),
                            maintainState: true,
                            title: DefaultText(
                              title: 'Last Alzheimer Result',
                              style: Style.small,
                              color: ColorsManager.white,
                              fontSize: 18.rSp,
                            ),
                            // contents
                            children: [
                              DefaultText(
                                title: 'Patient Name:  ${results!.alzhimarTest.patient_username}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'Age: ${results!.alzhimarTest.age}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'Gender: ${results!.alzhimarTest.gender}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'EDUC: ${results!.alzhimarTest.eDUC}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'SES: ${results!.alzhimarTest.sES}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'mMSE: ${results!.alzhimarTest.mMSE}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'eTIV: ${results!.alzhimarTest.eTIV}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'nWBV: ${results!.alzhimarTest.nWBV}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'ASF: ${results!.alzhimarTest.aSF}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'date: ${results!.alzhimarTest.date}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                              DefaultText(
                                title: 'result: ${results!.alzhimarTest.result}',
                                style: Style.small,
                                color: ColorsManager.white,
                                fontSize: 18.rSp,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
