import 'package:e_commarce_rest_api/auth/feature/data/models/product_modal.dart';
import 'package:e_commarce_rest_api/auth/feature/domain/entity/product_entity.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/screens/auth_screen/forgot_password.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/screens/auth_screen/login.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/screens/auth_screen/sign_in.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/screens/auth_screen/splash_screen.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/screens/bottom_naviagation_screen.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/screens/nav_screen/details_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRoutes = GoRouter(routes: [
  GoRoute(
    path: '/',
    name: 'splash',
    builder: (context, state) => SplashScreen(),
  ),
  GoRoute(
    path: '/bottom',
    name: 'bottomNav',
    builder: (context, state) => BottomNavigationScreen(),
  ),
  GoRoute(
    path: "/details",
    name: "detailsPage",
    builder:
        (context, state) {
      final product = state.extra as  ProductEntity;
      return DetailsScreen(productEntity: product,);},
  ),
  GoRoute(
    path: "/login",
    name: "login",
    builder: (context, state) => LoginScreen(),
  ),
  GoRoute(
    path: "/fPassword",
    name: "fPassword",
    builder: (context, state) => ForgotPasswordScreen(),
  ),
  GoRoute(
    path: "/signin",
    name: "signin",
  builder: (context, state) => SignInScreen(),
  )
]);
