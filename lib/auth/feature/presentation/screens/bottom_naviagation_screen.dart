import 'package:e_commarce_rest_api/auth/feature/presentation/blocs/nav/navigation_bloc.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/screens/nav_screen/home_screen.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/screens/nav_screen/profile_screen.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/screens/nav_screen/setting_screen.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/screens/nav_screen/shopping_screen.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/screens/nav_screen/wishlist_screen.dart';
import 'package:e_commarce_rest_api/core/constant/dimensionHelper.dart';
import 'package:e_commarce_rest_api/core/constant/fontsHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

class BottomNavigationScreen extends StatelessWidget {
   BottomNavigationScreen({super.key});
List<Widget>screen = [
  HomeScreen(),
  WishListScreen(),
  ShoppingScreen(),
  ProfileScreen(),
  SettingScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBloc,NavigationState>(builder: (context, state) {
        int count = 0;
        if(state is NavigationSelectedSttae){
          count = state.selectedIndex;
        }
        return screen[count];
        return Center(child: Text("No screen"),);
      },),
bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
  builder: (context, state) {
    int count = 0;
    if(state is NavigationSelectedSttae){
count = state.selectedIndex;
    }
    return Container(
      margin: EdgeInsets.all(20),
      child: ResponsiveNavigationBar(textStyle: TextStyle(
        fontSize: FontHelper.font_30.sp,
        fontWeight: FontHelper.bold
      ),
        padding: EdgeInsets.all(DimensionHelper.dimens_12.sp),
        fontSize: FontHelper.font_16.sp,
        selectedIndex: count,
      onTabChange: (value) {
      context.read<NavigationBloc>().add(NavigationIndexEvent(index: value));
      },
        navigationBarButtons: [
      NavigationBarButton(
        text: 'Home',
        icon: Icons.home,
        backgroundGradient: LinearGradient(
          colors: [Colors.yellow, Colors.green, Colors.blue],
        ),
      ),
      NavigationBarButton(
        text: 'WishList',
        icon: Icons.shopping_cart,
        backgroundGradient: LinearGradient(
          colors: [Colors.cyan, Colors.teal],
        ),
      ),
      NavigationBarButton(
        text: 'Shopping',
        icon: Icons.shopping_bag,
        backgroundGradient: LinearGradient(
          colors: [Colors.green, Colors.yellow],
        ),
      ),
      NavigationBarButton(
        text: 'Person',
        icon: Icons.person,
        backgroundGradient: LinearGradient(
          colors: [Colors.green, Colors.yellow],
        ),
      ),
      NavigationBarButton(
        text: 'Setting',
        icon: Icons.settings,
        backgroundGradient: LinearGradient(
          colors: [Colors.green, Colors.yellow],
        ),
      ),
        ],
      ),
    );
  },
)
    );
  }
}
