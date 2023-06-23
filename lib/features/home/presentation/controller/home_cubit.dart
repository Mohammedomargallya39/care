import 'package:care/core/util/widgets/loadingPage.dart';
import 'package:care/features/home/presentation/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/local/cache_helper.dart';
import '../../../../core/util/resources/constants_manager.dart';
import '../../../login/presentation/screens/login_screen.dart';
import '../../domain/usecase/profile_usecase.dart';
import '../screens/home_screen.dart';
import '../screens/section_screen.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {

  final ProfileUseCase _profileUseCase;

  HomeCubit({
    required ProfileUseCase profileUseCase,
})  :
        _profileUseCase = profileUseCase,
  super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);


  List<Widget> widgets = [
    const HomeScreen(),
    const HomeScreen(),
    const SectionScreen(),
    const ProfileScreen(),
  ];

  int currentNavIndex = 0;
  void changeNavBottomScreens(int index) {
    currentNavIndex = index;
    emit(HomeChangeNavBottomScreensState());
  }

  TextEditingController searchController = TextEditingController();
  TextEditingController nameController = TextEditingController();




  void signOut(context) {
    sl<CacheHelper>().clear('token').then((value) {
      if (value) {
        token = null;
        navigateAndFinish(
          context,
          LoginScreen(),
        );
        emit(SignOutState());
        //Restart.restartApp();
      }
    });
  }

  void profile({required int id})
  async{
    emit(LoadingProfileState());
    final result = await _profileUseCase(ProfileParams(id: id));

    result.fold((failure)
    {
      emit(ProfileErrorState(mapFailureToMessage(failure)));
    }, (data) async{
      emit(ProfileSuccessState(data));
      sl<CacheHelper>().put('id', data[0].id);
      sl<CacheHelper>().put('userName', data[0].userName);
      sl<CacheHelper>().put('email', data[0].email);
      sl<CacheHelper>().put('profilePic', data[0].profilePic);
      sl<CacheHelper>().put('isDoctor', data[0].isDoctor);
      idProfile = await sl<CacheHelper>().get('id');
      userNameProfile = await sl<CacheHelper>().get('userName');
      emailProfile = await sl<CacheHelper>().get('email');
      picProfile = await sl<CacheHelper>().get('profilePic');
      isDoctorProfile = await sl<CacheHelper>().get('isDoctor');
    });

  }


}
