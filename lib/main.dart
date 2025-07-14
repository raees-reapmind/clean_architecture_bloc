import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import 'package:navigations_routing/config/routes/routes.dart';
import 'package:navigations_routing/config/routes/routes_names.dart';
import 'package:navigations_routing/login_ui_and_code_refactor/login_bloc.dart';
import 'package:navigations_routing/repository/auth/login_http_api_repository.dart';
import 'package:navigations_routing/repository/auth/login_repository.dart';
import 'package:navigations_routing/repository/movies/movies_http_api_repository.dart';
import 'package:navigations_routing/repository/movies/movies_repository.dart';
import 'package:navigations_routing/services/session_manager/session_controller.dart';

final GetIt getIt = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
 
  serviceLocator();
 
  await SessionController().getUserFromPreferece();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(
            loginRepository: getIt<LoginRepository>(),
          ),
        ),
        // Add other Blocs here as needed
      ],
      child: const MyApp(),
    ),
  );
}

void serviceLocator() {
  getIt.registerLazySingleton<LoginRepository>(() => LoginHttpRepository());
  getIt.registerLazySingleton<MoviesRepository>(() => MoviesHttpRepository());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = SessionController().isLogin;

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: isLoggedIn
          ? RoutesNames.homeScreen
          : RoutesNames.loginBlocScreen,
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}
