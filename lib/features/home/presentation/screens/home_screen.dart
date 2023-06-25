import 'package:care/core/util/resources/colors_manager.dart';
import 'package:care/core/util/resources/constants_manager.dart';
import 'package:care/core/util/resources/extensions_manager.dart';
import 'package:care/core/util/widgets/default_text.dart';
import 'package:care/core/util/widgets/default_text_field.dart';
import 'package:care/core/util/widgets/loadingPage.dart';
import 'package:care/features/home/presentation/screens/doctors_screen.dart';
import 'package:care/features/home/presentation/screens/labs_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/util/resources/assets.gen.dart';
import '../../domain/entities/profile_entity.dart';
import '../controller/home_cubit.dart';
import '../controller/home_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);
    homeCubit.profile(id: userId!);
    List<ProfileEntity>? results;


    List<String> images = [
      Assets.images.svg.doctor,
      Assets.images.svg.telescope,
      Assets.images.svg.capsule,
      Assets.images.svg.virus,
      Assets.images.svg.donate
    ];

    return Scaffold(
      backgroundColor: ColorsManager.mainColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.rSp),
          child: BlocConsumer<HomeCubit,HomeStates>(
            listener: (context, state) {
              if(state is ProfileSuccessState){
                results = state.profileEntity;
              }
            },
            builder: (context, state) {
              return results == null ? const LoadingPage() : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(3.h),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(Assets.images.png.hi),
                                horizontalSpace(1.w),
                                const DefaultText(title: 'Hello!', style: Style.small , color: ColorsManager.white),
                              ],
                            ),
                            DefaultText(title: userNameProfile!, style: Style.medium , color: ColorsManager.white,fontWeight: FontWeight.bold,fontSize: 30.rSp),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          height: 6.h,
                          width: 10.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.rSp),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(picProfile!)
                              )
                          ),
                        )
                      ],
                    ),
                    verticalSpace(10.h),
                    DefaultText(title: 'Service', style: Style.medium , color: ColorsManager.white,fontWeight: FontWeight.w600,fontSize: 30.rSp,align: TextAlign.start),
                    verticalSpace(1.h),
                    SizedBox(
                      height: 10.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              if(index == 0) {
                                navigateTo(context, const DoctorsScreen());
                              }
                              if(index == 1)
                              {
                                navigateTo(context, const LabsScreen());
                              }
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 5.w),
                              child: Container(
                                height: 0.1.h,
                                width: 20.w,
                                padding: EdgeInsets.all(5.rSp),
                                decoration: BoxDecoration(
                                    border: Border.all(color: ColorsManager.secondary),
                                    borderRadius: BorderRadius.circular(5.rSp),
                                ),
                                child: SvgPicture.asset(
                                    images[index],
                                    color: ColorsManager.green,
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: 5,
                      ),
                    ),


                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
