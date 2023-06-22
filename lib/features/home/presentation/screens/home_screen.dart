import 'package:care/core/util/resources/colors_manager.dart';
import 'package:care/core/util/resources/constants_manager.dart';
import 'package:care/core/util/resources/extensions_manager.dart';
import 'package:care/core/util/widgets/default_text.dart';
import 'package:care/core/util/widgets/default_text_field.dart';
import 'package:care/features/home/presentation/screens/doctors_screen.dart';
import 'package:flutter/material.dart';
import '../../../../core/util/resources/assets.gen.dart';
import '../controller/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    HomeCubit homeCubit = HomeCubit.get(context);

    List<String> images = [
      Assets.images.png.doc,
      Assets.images.png.microScope,
      Assets.images.png.capsules,
      Assets.images.png.virus,
      Assets.images.png.virusButton
    ];

    return Scaffold(
      backgroundColor: ColorsManager.mainColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15.rSp),
          child: SingleChildScrollView(
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
                verticalSpace(2.h),
                DefaultTextField(
                    controller: homeCubit.searchController,
                    hint: 'Search medical..',
                    svgImg: Assets.images.svg.search,
                    suffixIcon: IconButton(
                        onPressed: ()
                        {

                        },
                        icon: const Icon(Icons.filter_list)),
                ),
                verticalSpace(2.h),
                DefaultText(title: 'Service', style: Style.medium , color: ColorsManager.white,fontWeight: FontWeight.w600,fontSize: 30.rSp,align: TextAlign.start),
                verticalSpace(1.h),
                SizedBox(
                  height: 20.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            navigateTo(context, const DoctorsScreen());
                          },
                          child: Padding(
                            padding: EdgeInsets.only(right: 5.w),
                            child: Container(
                              height: 0.1.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: ColorsManager.secondary),
                                  borderRadius: BorderRadius.circular(5.rSp),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(images[index])
                                  )
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
          ),
        ),
      ),
    );
  }
}
