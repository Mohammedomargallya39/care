import 'package:care/features/home/domain/usecase/doctor_profile_usecase.dart';
import 'package:care/features/home/domain/usecase/doctor_usecase.dart';
import 'package:care/features/home/domain/usecase/get_appointment_usecase.dart';
import 'package:care/features/home/domain/usecase/get_labs_usecase.dart';
import 'package:care/features/home/domain/usecase/profile_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/home/data/data_source/home_remote_data_source.dart';
import '../../features/home/data/repository/home_repository.dart';
import '../../features/home/domain/repository/home_base_repository.dart';
import '../../features/home/domain/usecase/book_appointment_usecase.dart';
import '../../features/home/presentation/controller/home_cubit.dart';
import '../../features/login/data/data_source/login_remote_data_source.dart';
import '../../features/login/data/repository/login_repository.dart';
import '../../features/login/domain/repository/login_base_rebository.dart';
import '../../features/login/domain/usecase/log_in_usecase.dart';
import '../../features/login/presentation/controller/login_cubit.dart';
import '../../features/register/data/data_source/register_remote_data_source.dart';
import '../../features/register/data/repository/register_repository.dart';
import '../../features/register/domain/repository/register_base_rebository.dart';
import '../../features/register/domain/usecase/register_usecase.dart';
import '../../features/register/presentation/controller/register_cubit.dart';
import '/core/network/local/cache_helper.dart';
import '/core/network/remote/dio_helper.dart';
import '/core/network/repository.dart';
import '/core/util/cubit/cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerLazySingleton(
        () => AppBloc(),
  );

  sl.registerLazySingleton<LoginCubit>(() => LoginCubit(logInUseCase: sl()));
  sl.registerLazySingleton<RegisterCubit>(() => RegisterCubit(
    registerUseCase: sl(),
  ));
  sl.registerLazySingleton<HomeCubit>(() => HomeCubit(
    profileUseCase: sl(),
    doctorUseCase: sl(),
    doctorProfileUseCase: sl(),
    appointmentUseCase: sl(),
    getAppointmentUseCase: sl(),
    getLabsUseCase: sl(),

  ));
  sl.registerLazySingleton<Repository>(
        () => RepoImplementation(
      dioHelper: sl(),
      cacheHelper: sl(),
    ),
  );

  // Repository
  sl.registerLazySingleton<LogInBaseRepository>(
        () => LoginRepoImplementation(remoteDataSource: sl()),
  );

  sl.registerLazySingleton<RegisterBaseRepository>(
        () => RegisterRepoImplementation(remoteDataSource: sl()),
  );

  sl.registerLazySingleton<HomeBaseRepository>(
        () => HomeRepository(remoteDataSource: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(sl()));
  sl.registerLazySingleton(() => RegisterUseCase(sl()));
  sl.registerLazySingleton(() => ProfileUseCase(sl()));
  sl.registerLazySingleton(() => DoctorUseCase(sl()));
  sl.registerLazySingleton(() => DoctorProfileUseCase(sl()));
  sl.registerLazySingleton(() => BookAppointmentUseCase(sl()));
  sl.registerLazySingleton(() => GetAppointmentUseCase(sl()));
  sl.registerLazySingleton(() => GetLabsUseCase(sl()));

  //Data sources
  sl.registerLazySingleton<LogInBaseRemoteDataSource>(
        () => LogInRemoteDataSourceImpl(dioHelper: sl()),
  );

  sl.registerLazySingleton<RegisterBaseRemoteDataSource>(
        () => RegisterRemoteDataSourceImpl(dioHelper: sl()),
  );

  sl.registerLazySingleton<HomeBaseDataSource>(
        () => HomeDataSourceImpl(dioHelper: sl()),
  );

  // Core
  sl.registerLazySingleton<DioHelper>(
        () => DioImpl(),
  );

  sl.registerLazySingleton<CacheHelper>(
        () => CacheImpl(
      sl(),
    ),
  );

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
