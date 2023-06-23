import 'package:care/features/home/presentation/controller/home_cubit.dart';
import 'package:care/features/home/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/injection.dart';
import 'core/network/local/cache_helper.dart';
import 'core/util/cubit/cubit.dart';
import 'core/util/resources/bloc_observer_manager.dart';
import '/core/di/injection.dart' as di;
import 'core/util/resources/constants_manager.dart';
import 'features/login/presentation/controller/login_cubit.dart';
import 'features/login/presentation/screens/login_screen.dart';
import 'features/register/presentation/controller/register_cubit.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  await di.init();

  token = await sl<CacheHelper>().get('token');
  userId = await sl<CacheHelper>().get('userId');
  email = await sl<CacheHelper>().get('email');
  idProfile = await sl<CacheHelper>().get('id');
  userNameProfile = await sl<CacheHelper>().get('userName');
  emailProfile = await sl<CacheHelper>().get('email');
  picProfile = await sl<CacheHelper>().get('profilePic');
  isDoctorProfile = await sl<CacheHelper>().get('isDoctor');

  runApp(MyApp(
    home: token != null ? const MainScreen() : LoginScreen(),
    token: token,
    id: userId,
    email:email,
  ));
}

class MyApp extends StatelessWidget {

  const MyApp({
    Key? key,
    required this.home,
    required this.token,
    required this.email,
    required this.id,

  }) : super(key: key);

  final Widget home;
  final String? token;
  final int? id;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => sl<AppBloc>()..connectivityListener(),
          ),
          BlocProvider(
            create: (context) => sl<LoginCubit>(),
          ),
          BlocProvider(
            create: (context) => sl<RegisterCubit>(),
          ),
          BlocProvider(
            create: (context) => sl<HomeCubit>(),
          ),
        ],
        child: MaterialApp(
          title: 'Care Medical',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: home,
        )
    );
  }
}
