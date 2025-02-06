import 'package:e_commarce_rest_api/auth/feature/presentation/blocs/auth/authentication_bloc.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/blocs/fetched/product_bloc.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/blocs/nav/navigation_bloc.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/blocs/password/toggle_bloc.dart';
import 'package:e_commarce_rest_api/core/constant/firebase_option.dart';
import 'package:e_commarce_rest_api/core/constant/routes.dart';
import 'package:e_commarce_rest_api/core/theme/theme.dart';
import 'package:e_commarce_rest_api/getit_dependency.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: optionss,
  );
  setupLocator();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => GetIt.I<NavigationBloc>(),),
    BlocProvider(create: (context) => GetIt.I<ToggleBloc>(),),
    BlocProvider(create: (context) => GetIt.I<AuthenticationBloc>(),),
    BlocProvider(
      create: (context) =>
          GetIt.I<ProductBloc>()..add(FetchCategoryEvent())..add(FetchProductEvent()),
    ),

  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          builder: (context, child) => ResponsiveWrapper.builder(
            child,
            maxWidth: 1280,
            minWidth: 640,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.resize(640, name: 'SM'),
              ResponsiveBreakpoint.autoScale(768, name: 'MD'),
              ResponsiveBreakpoint.autoScale(1024, name: 'LG'),
              ResponsiveBreakpoint.autoScale(1280, name: 'XL'),
            ],
          ),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          darkTheme: AAppTheme.darkTheme,
          theme: AAppTheme.lightTheme,
          themeMode: ThemeMode.system,
          routerConfig: appRoutes,
        );
      },
    );
  }
}
