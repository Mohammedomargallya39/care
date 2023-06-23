import 'package:care/core/util/resources/colors_manager.dart';
import 'package:care/core/util/resources/constants_manager.dart';
import 'package:care/core/util/resources/extensions_manager.dart';
import 'package:care/core/util/widgets/default_button.dart';
import 'package:care/core/util/widgets/default_text.dart';
import 'package:flutter/material.dart';

class LabsScreen extends StatelessWidget {
  const LabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                        height: 20.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.rSp),
                            border: Border.all(color: ColorsManager.white)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 40.rSp,
                                  backgroundImage: NetworkImage(picProfile!),
                                ),
                                horizontalSpace(5.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    DefaultText(title: 'تحاليل الدم الكامل', style: Style.small, fontSize: 22.rSp, color: ColorsManager.white,fontWeight: FontWeight.w600),
                                    Row(
                                      children: [
                                        const Icon(Icons.star , color: Colors.blue),
                                        DefaultText(title: '4.9 (400 reviewer)', style: Style.small, fontSize: 16.rSp, color: ColorsManager.white,fontWeight: FontWeight.w300),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: 5,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
