import 'package:care/core/util/resources/colors_manager.dart';
import 'package:care/core/util/resources/constants_manager.dart';
import 'package:care/core/util/resources/extensions_manager.dart';
import 'package:care/core/util/widgets/default_button.dart';
import 'package:care/core/util/widgets/default_text.dart';
import 'package:care/core/util/widgets/loadingPage.dart';
import 'package:care/features/home/presentation/controller/home_cubit.dart';
import 'package:care/features/home/presentation/controller/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/get_labs_entity.dart';

class LabsScreen extends StatelessWidget {
  const LabsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    HomeCubit homeCubit = HomeCubit.get(context);
    homeCubit.getLabs();
    List<GetLabsEntity>? result;


    return Scaffold(
      backgroundColor: ColorsManager.mainColor,
      body: SafeArea(
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
                  DefaultText(title: 'Labs', style: Style.medium,color: ColorsManager.white,fontWeight: FontWeight.bold,fontSize: 30.rSp),
                ],
              ),
            ),
            verticalSpace(4.h),
            BlocConsumer<HomeCubit,HomeStates>(
              listener: (context, state) {
                if(state is GetLabsSuccessState)
                {
                  result = state.getLabs;
                }
              },
              builder: (context, state) {
                return result == null ? const LoadingPage():
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
                            height: 22.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.rSp),
                                border: Border.all(color: ColorsManager.white)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [

                                Center(child: DefaultText(title: result![index].labName, style: Style.small, fontSize: 22.rSp, color: ColorsManager.white,fontWeight: FontWeight.w600)),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DefaultText(title: 'Address: ${result![index].labCountry}, ${result![index].labAddress}', style: Style.small, fontSize: 18.rSp, color: ColorsManager.white,fontWeight: FontWeight.w300),
                                    DefaultText(title: 'Email: ${result![index].labEmail}', style: Style.small, fontSize: 18.rSp, color: ColorsManager.white,fontWeight: FontWeight.w300),
                                    DefaultText(title: 'Phone: ${result![index].labPhone}', style: Style.small, fontSize: 18.rSp, color: ColorsManager.white,fontWeight: FontWeight.w300),
                                    DefaultText(title: 'Start time : ${result![index].labStartTime}', style: Style.small, fontSize: 18.rSp, color: ColorsManager.white,fontWeight: FontWeight.w300),
                                    DefaultText(title: 'End time : ${result![index].labEndTime}', style: Style.small, fontSize: 18.rSp, color: ColorsManager.white,fontWeight: FontWeight.w300),
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
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
