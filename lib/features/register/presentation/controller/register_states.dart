abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}
class ChangePasswordVisibilityIconState extends RegisterStates{}



class RegisterImagePickedSuccessState extends RegisterStates {}
class RegisterImagePickedErrorState extends RegisterStates {}
class RegisterImageSelectedState extends RegisterStates {}


class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final String token;
  RegisterSuccessState({required this.token});
}

class RegisterErrorState extends RegisterStates {
  final String failure;
  RegisterErrorState({required this.failure});
}

