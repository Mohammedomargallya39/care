import 'package:care/core/util/resources/extensions_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/util/resources/assets.gen.dart';
import '../../../../core/util/resources/colors_manager.dart';
import '../../../../core/util/resources/constants_manager.dart';
import '../../../../core/util/widgets/default_action_button.dart';
import '../../../../core/util/widgets/default_button.dart';
import '../../../../core/util/widgets/default_text_field.dart';
import '../../../../core/util/widgets/two_option_dialog.dart';
import '../controller/register_cubit.dart';
import '../controller/register_states.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    RegisterCubit registerCubit = RegisterCubit. get(context);

    return Scaffold(
      backgroundColor: ColorsManager.mainColor,
      body: Form(
        key: formKey,
        child: SafeArea(
            child: Stack(
              children: [
                Image.asset(Assets.images.png.up
                  ,
                  alignment: Alignment.topLeft,
                ),
                BlocConsumer<RegisterCubit,RegisterStates>(
                  listener: (context, state) {
                    if(state is RegisterSuccessState)
                    {
                      debugPrintFullText('Login Success');
                      designToastDialog(context: context, toast: TOAST.success,text: 'Register Successfully');
                    }

                    if (state is RegisterErrorState) {
                      designToastDialog(
                          context: context,
                          toast: TOAST.error,
                          text: state.failure.toString());
                    }
                  },
                  builder: (context, state) {
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.all(20.rSp),
                        child: Column(
                          children: [
                            verticalSpace(12.h),
                            Stack(
                              alignment: AlignmentDirectional.bottomEnd,
                              children: [
                                registerCubit.imageFile == null
                                    ? svgImage(
                                    path: Assets.images.svg.user,
                                    height: 16.h,
                                    width: 16.w)
                                    : CircleAvatar(
                                  radius: 70.rSp,
                                  backgroundImage:
                                  FileImage(registerCubit.imageFile!),
                                ),
                                defaultActionButton(
                                    backgroundColor: ColorsManager.secondryColor,
                                    icon: Icons.add,
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return TwoOptionsDialog(
                                              height: 20.h,
                                              message: 'Choose source picker!',
                                              popButtonText: 'Gallery',
                                              pushButtonText: 'Camera',
                                              pushButtonVoidCallback: ()
                                              {
                                                registerCubit.selectImage(context, ImageSource.camera);
                                              },
                                              popButtonVoidCallback: ()
                                              {
                                                registerCubit.selectImage(context, ImageSource.gallery);
                                              }
                                          )
                                          ;
                                        },
                                      );
                                    }),
                              ],
                            ),
                            verticalSpace(4.h),
                            DefaultTextField(
                              hint: 'user name',
                              svgImg: Assets.images.svg.user,
                              controller: registerCubit.userNameController,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'isEmpty';
                                }
                                return null;
                              },
                            ),
                            DefaultTextField(
                              hint: 'email',
                              svgImg: Assets.images.svg.email,
                              controller: registerCubit.emailController,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'isEmpty';
                                }
                                return null;
                              },
                            ),
                            DefaultTextField(
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'isEmpty';
                                }
                                return null;
                              },
                              controller: registerCubit.passwordController,
                              hint: 'Password',
                              svgImg: Assets.images.svg.lock,
                              isPassword: registerCubit.showPassword,
                              suffixIcon: IconButton(
                                onPressed: ()
                                {
                                  registerCubit.changePasswordVisibility();
                                },
                                icon: Icon(registerCubit.visibilityShowPassword),
                              ),
                            ),
                            verticalSpace(4.h),
                            DefaultButton(
                                elevation: 0.0,
                                color: ColorsManager.secondryColor,
                                height: 3.h,
                                text: 'Register',
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    registerCubit.register(
                                      email: registerCubit.emailController.text,
                                      userName: registerCubit.userNameController.text,
                                      password: registerCubit.passwordController.text,
                                      profilePicture: registerCubit.imageFile!,
                                    );
                                  } else {
                                    designToastDialog(
                                        context: context,
                                        toast: TOAST.warning,
                                        text: 'please fill ur data');
                                  }
                                }),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            )
        ),
      ),
    );
  }
}
