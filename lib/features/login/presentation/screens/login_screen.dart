import 'package:care/core/util/resources/extensions_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/network/local/cache_helper.dart';
import '../../../../core/util/resources/assets.gen.dart';
import '../../../../core/util/resources/colors.dart';
import '../../../../core/util/resources/colors_manager.dart';
import '../../../../core/util/resources/constants_manager.dart';
import '../../../../core/util/widgets/default_button.dart';
import '../../../../core/util/widgets/default_text.dart';
import '../../../../core/util/widgets/default_text_field.dart';
import '../../../home/presentation/screens/main_screen.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../../register/presentation/screens/register_screen.dart';
import '../controller/login_cubit.dart';
import '../controller/login_states.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ScreenSizes.screenHeight = MediaQuery.of(context).size.height;
    ScreenSizes.screenWidth = MediaQuery.of(context).size.width;
    LoginCubit loginCubit = LoginCubit.get(context);

    return  Scaffold(
      backgroundColor: ColorsManager.mainColor,
      body: Form(
        key: formKey,

        child: Stack(
          children: [
            Image.asset(Assets.images.png.up
              ,
              alignment: Alignment.topLeft,
            ),

            Padding(
              padding: EdgeInsets.all(15.rSp),
              child: BlocConsumer<LoginCubit,LoginStates>(
                listener: (context, state) {
                  if(state is LoginSuccessState)
                  {
                    designToastDialog(context: context, toast: TOAST.success,text: 'Success');
                    navigateAndFinish(context, const MainScreen());
                    sl<CacheHelper>().put('token', state.loginEntity.token);
                    sl<CacheHelper>().put('userId', state.loginEntity.userId);
                    sl<CacheHelper>().put('email', state.loginEntity.email);
                    userId = state.loginEntity.userId;
                    token = state.loginEntity.token;
                    email = state.loginEntity.email;
                  }

                  if (state is LoginErrorState) {
                    designToastDialog(
                        context: context,
                        toast: TOAST.error,
                        text: state.failure.toString());
                  }
                },
                builder: (context, state) {
                 return SingleChildScrollView(
                   physics: const BouncingScrollPhysics(),
                   child: Column(
                      children: [
                        verticalSpace(12.h),
                        Image.asset(
                          Assets.images.png.logo,
                        ),
                        verticalSpace(4.h),
                        DefaultTextField(
                          controller: loginCubit.userName,
                          hint: 'User name',
                          svgImg: Assets.images.svg.email,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'isEmpty';
                            }
                            return null;
                          },


                        ),
                        verticalSpace(2.h),
                        DefaultTextField(
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'isEmpty';
                              }
                              return null;
                            },
                            controller: loginCubit.password,
                            hint: 'Password',
                            svgImg: Assets.images.svg.lock,
                            isPassword: loginCubit.showPassword,
                            suffixIcon: IconButton(
                              onPressed: ()
                              {
                                loginCubit.changePasswordVisibility();
                              },
                              icon: Icon(loginCubit.visibilityShowPassword),
                            ),
                        ),
                        verticalSpace(4.h),

                        DefaultButton(
                            elevation: 0.0,
                            textOnly: false,
                            iconWidget: svgImage(
                              path: Assets.images.svg.login,
                              color: ColorsManager.white,
                            ),
                            color: ColorsManager.secondryColor,
                            height: 3.h,
                            text: 'Login',
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                loginCubit.logIn(
                                    email: loginCubit.userName.text,
                                    password: loginCubit.password.text);
                              } else {
                                designToastDialog(
                                    context: context,
                                    toast: TOAST.warning,
                                    text: 'please fill ur data');
                              }
                            }),
                        verticalSpace(4.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DefaultText(
                              title: "Don't have an account?",
                              style: Style.medium,
                              color: Colors.white,
                              fontSize: 15.rSp,
                            ),
                            GestureDetector(
                              onTap: () {
                                navigateTo(context, RegisterScreen());
                              },
                              child: DefaultText(
                                title: " Register",
                                style: Style.medium,
                                fontWeight: FontWeight.bold,
                                color: ColorsManager.secondryColor,
                                fontSize: 15.rSp,
                              ),
                            ),
                          ],
                        ),


                      ],
                    ),
                 );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
