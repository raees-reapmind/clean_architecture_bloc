import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:navigations_routing/config/routes/routes.dart';
import 'package:navigations_routing/config/routes/routes_names.dart';
import 'package:navigations_routing/login_bloc_and_validations/login_bloc_screen.dart';
import 'package:navigations_routing/login_ui_and_code_refactor/login_bloc.dart'; 
import 'app_exceptions_handle/Views/exception_screen_test.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData( 
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const ExceptionScreenTest(), 
      home : MultiBlocProvider(
        providers: [
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(),
          ),
        ],
        child: const LoginBlocScreen(),
      ),
      // initialRoute: RoutesNames.splashScreen,
      // onGenerateRoute: Routes.generateRoutes,
    );
  }
}
 