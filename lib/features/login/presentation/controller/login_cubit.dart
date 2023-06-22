import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failures.dart';
import '../../domain/usecase/log_in_usecase.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginUseCase _logInUseCase;

  LoginCubit({required LoginUseCase logInUseCase})
      : _logInUseCase = logInUseCase,
        super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();

  void logIn({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());

    final result = await _logInUseCase(
        LoginParams(
            userName: email,
            password: password
        )
    );

    result.fold((failure) {
      emit(LoginErrorState(
          failure: mapFailureToMessage(failure)
      ));
    }, (data) {
      emit(LoginSuccessState(
        loginEntity: data
      ));
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
