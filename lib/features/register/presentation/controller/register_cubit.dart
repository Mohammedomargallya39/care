import 'dart:io';

import 'package:care/features/register/presentation/controller/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/util/resources/constants_manager.dart';
import '../../domain/usecase/register_usecase.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  final RegisterUseCase _registerUseCase;
  RegisterCubit({required RegisterUseCase registerUseCase,
  })
      : _registerUseCase = registerUseCase,
        super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  File? imageFile;

  Future<File?> pickImageFromGallery(BuildContext context,ImageSource imageSource) async {
    File? image;
    try {
      final pickedImage =
      await ImagePicker().pickImage(source: imageSource);

      if (pickedImage != null) {
        image = File(pickedImage.path);
        emit(RegisterImagePickedSuccessState());
      }
    } catch (e) {
      designToastDialog(context: context, toast: TOAST.error);
      emit(RegisterImagePickedErrorState());
    }
    return image;
  }

  void selectImage(context,ImageSource imageSource) async {
    imageFile = await pickImageFromGallery(context,imageSource);
    emit(RegisterImageSelectedState());
  }


  void register({
    required String email,
    required String password,
    required File profilePicture,
    required String userName,
    context
  }) async {
    emit(RegisterLoadingState());
    final result = await _registerUseCase(
        RegisterParams(
          userName: userName,
          email: email,
          profilePicture: profilePicture,
          password: password,
        )
    );
    result.fold((failure) {
      emit(RegisterErrorState(
          failure: mapFailureToMessage(failure)
      ));
      debugPrintFullText('Error is ----------------------------- ${failure.toString()}');
    }, (data) {
      //registerModel = data;
      emit(RegisterSuccessState(
          token: data.token
      ));
      imageFile = null;
      emailController.text = '';
      passwordController.text = '';
      userNameController.text = '';
    });
  }


  IconData visibilityShowPassword = Icons.visibility_outlined;
  bool showPassword = true;

  void changePasswordVisibility(){
    showPassword = !showPassword;
    visibilityShowPassword = showPassword? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityIconState());
  }

}