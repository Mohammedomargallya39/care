import 'package:care/features/home/domain/usecase/blood_check_usecase.dart';
import 'package:care/features/home/domain/usecase/doctor_usecase.dart';
import 'package:care/features/home/domain/usecase/get_appointment_usecase.dart';
import 'package:care/features/home/presentation/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/local/cache_helper.dart';
import '../../../../core/util/resources/constants_manager.dart';
import '../../../login/presentation/screens/login_screen.dart';
import '../../domain/usecase/alzahimar_usecase.dart';
import '../../domain/usecase/book_appointment_usecase.dart';
import '../../domain/usecase/doctor_profile_usecase.dart';
import '../../domain/usecase/get_labs_usecase.dart';
import '../../domain/usecase/heart_usecase.dart';
import '../../domain/usecase/profile_usecase.dart';
import '../screens/home_screen.dart';
import '../screens/schedule_screen.dart';
import '../screens/section_screen.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {

  final ProfileUseCase _profileUseCase;
  final DoctorUseCase _doctorUseCase;
  final DoctorProfileUseCase _doctorProfileUseCase;
  final BookAppointmentUseCase _appointmentUseCase;
  final GetAppointmentUseCase _getAppointmentUseCase;
  final GetLabsUseCase _getLabsUseCase;
  final BloodCheckUseCase _bloodCheckUseCase;
  final HeartCheckUseCase _heartCheckUseCase;
  final AlzahimarCheckUseCase _alzahimarCheckUseCase;

  HomeCubit({
    required ProfileUseCase profileUseCase,
    required DoctorUseCase doctorUseCase,
    required DoctorProfileUseCase doctorProfileUseCase,
    required BookAppointmentUseCase appointmentUseCase,
    required GetAppointmentUseCase getAppointmentUseCase,
    required GetLabsUseCase getLabsUseCase,
    required BloodCheckUseCase bloodCheckUseCase,
    required HeartCheckUseCase heartCheckUseCase,
    required AlzahimarCheckUseCase alzahimarCheckUseCase,
})  :
        _profileUseCase = profileUseCase,
        _doctorUseCase = doctorUseCase,
        _doctorProfileUseCase = doctorProfileUseCase,
        _appointmentUseCase = appointmentUseCase,
        _getAppointmentUseCase = getAppointmentUseCase,
        _getLabsUseCase = getLabsUseCase,
        _bloodCheckUseCase = bloodCheckUseCase,
        _heartCheckUseCase = heartCheckUseCase,
        _alzahimarCheckUseCase =alzahimarCheckUseCase,
  super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);


  List<Widget> widgets = [
    const HomeScreen(),
    const ScheduleScreen(),
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

  void doctor() async{
    emit(LoadingDoctorState());
    final result = await _doctorUseCase(const DoctorParams(isDoctor: true));

    result.fold((failure)
    {
      emit(DoctorErrorState(mapFailureToMessage(failure)));
    }, (data) async{
      emit(DoctorSuccessState(data));
    });
  }



  void doctorProfile({required int id}) async{
    emit(LoadingDoctorProfileState());
    final result = await _doctorProfileUseCase(DoctorProfileParams(id: id));

    result.fold((failure)
    {
      emit(DoctorProfileErrorState(mapFailureToMessage(failure)));
    }, (data) async{
      emit(DoctorProfileSuccessState(data));
    });
  }


  List<String> dateToday = [];
  List<String> morningTimes = [];
  List<String> eveningTimes = [];

  bool isMorning = true;

  void chooseAppointmentTime(bool timeNow)
  {
    isMorning = timeNow;
    emit(ChangeTimeState());
  }


  bool isTimeSelected = false;
  int? pressedIndex;

  void selectedTime(bool isSelected)
  {
    isTimeSelected = isSelected;
    emit(SelectedTimeState());
  }

  void bookAppointment({required int id, required String date, required String time}) async{
    emit(LoadingBookAppointmentState());
    final result = await _appointmentUseCase(BookAppointmentParams(
        id: id,
        date: date,
        time: time
    ));
    result.fold((failure)
    {
      emit(ErrorBookAppointmentState(mapFailureToMessage(failure)));
    }, (data) async{
      emit(SuccessBookAppointmentState());
    });
  }


  void getAppointment() async{

    emit(LoadingGetAppointmentState());
    final result = await _getAppointmentUseCase(const GetAppointmentParams());
    result.fold((failure)
    {
      emit(GetAppointmentErrorState(mapFailureToMessage(failure)));
    }, (data) async{
      emit(GetAppointmentSuccessState(data));
    });
  }



  void getLabs() async{
    emit(LoadingGetLabsState());
    final result = await _getLabsUseCase(const GetLabsParams());
    result.fold((failure)
    {
      emit(GetLabsErrorState(mapFailureToMessage(failure)));
    }, (data) async{
      emit(GetLabsSuccessState(data));
    });
  }

  final TextEditingController ageBlood = TextEditingController();
  final TextEditingController bmiBlood = TextEditingController();
  final TextEditingController glucouseBlood = TextEditingController();
  final TextEditingController insulineBlood = TextEditingController();
  final TextEditingController homaBlood = TextEditingController();
  final TextEditingController leptinBlood = TextEditingController();
  final TextEditingController adiponcetinBlood = TextEditingController();
  final TextEditingController resistiinBlood = TextEditingController();
  final TextEditingController mcpBlood = TextEditingController();


  final TextEditingController ageHeart = TextEditingController();
  final TextEditingController sexHeart = TextEditingController();
  final TextEditingController chestPainTypeHeart = TextEditingController();
  final TextEditingController cholesterolHeart = TextEditingController();
  final TextEditingController fastingBSHeart = TextEditingController();
  final TextEditingController maxHRHeart = TextEditingController();
  final TextEditingController exerciseAnginaHeart = TextEditingController();
  final TextEditingController oldPeakHeart = TextEditingController();
  final TextEditingController sTSlopeHeart = TextEditingController();


  final TextEditingController ageAlzahimer = TextEditingController();
  final TextEditingController genderAlzahimer = TextEditingController();
  final TextEditingController eDUCAlzahimer = TextEditingController();
  final TextEditingController sESAlzahimer = TextEditingController();
  final TextEditingController mMSEAlzahimer = TextEditingController();
  final TextEditingController eTIVAlzahimer = TextEditingController();
  final TextEditingController nWBVAlzahimer = TextEditingController();
  final TextEditingController aSFAlzahimer = TextEditingController();



  void bloodTest({
    required int resistiin,
    required int mcp,
    required int leptin,
    required int insuline,
    required int homa,
    required int glucouse,
    required int bmi,
    required int adiponcetin,
    required int age,
}) async{
    emit(LoadingBloodTestState());
    final result = await _bloodCheckUseCase( BloodCheckParams(
      resistiin: resistiin,
      mcp: mcp,
      leptin: leptin,
      insuline: insuline,
      homa: homa,
      glucouse: glucouse,
      bmi: bmi,
      adiponcetin: adiponcetin,
      age: age,
    ));

    result.fold((failure)
    {
      emit(BloodTestErrorState(mapFailureToMessage(failure)));
    }, (data) async{
      emit(BloodTestSuccessState(data));
    });
  }



  void heartTest({
    required int age,
    required int sex,
    required int chestPainType,
    required int cholesterol,
    required int fastingBS,
    required int exerciseAngina,
    required int maxHR,
    required int oldpeak,
    required int sT_Slope,
  }) async{
    emit(LoadingHeartTestState());
    final result = await _heartCheckUseCase( HeartCheckParams(
      sex: sex,
      chestPainType: chestPainType,
      cholesterol: cholesterol,
      fastingBS: fastingBS,
      exerciseAngina: exerciseAngina,
      maxHR: maxHR,
      oldpeak: oldpeak,
      sT_Slope: sT_Slope,
      age: age,
    ));

    result.fold((failure)
    {
      emit(HeartTestErrorState(mapFailureToMessage(failure)));
    }, (data) async{
      emit(HeartTestSuccessState(data));
    });
  }


  void alzahimerTest({
    required int age,
    required int gender,
    required int eDUC,
    required int sES,
    required int eTIV,
    required int mMSE,
    required int nWBV,
    required int aSF,
  }) async{
    emit(LoadingAlzhimerTestState());
    final result = await _alzahimarCheckUseCase( AlzahimarCheckParams(
      gender: gender,
      eDUC: eDUC,
      sES: sES,
      eTIV: eTIV,
      mMSE: mMSE,
      nWBV: nWBV,
      aSF: aSF,
      age: age,
    ));

    result.fold((failure)
    {
      emit(AlzhimerTestErrorState(mapFailureToMessage(failure)));
    }, (data) async{
      emit(AlzhimerTestSuccessState(data));
    });
  }



}
