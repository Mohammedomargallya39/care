

import '../../domain/entities/profile_entity.dart';

abstract class HomeStates{

}

class HomeInitialState extends HomeStates{

}class HomeChangeNavBottomScreensState extends HomeStates{

}

class SignOutState extends HomeStates{

}

class LoadingProfileState extends HomeStates{}

class ProfileErrorState extends HomeStates{
  final String failure;

  ProfileErrorState(this.failure);
}

class ProfileSuccessState extends HomeStates{
  List<ProfileEntity> profileEntity;
  ProfileSuccessState(this.profileEntity);
}
