import 'package:e_commarce_rest_api/auth/feature/presentation/blocs/auth/authentication_bloc.dart';
import 'package:e_commarce_rest_api/core/constant/assetsHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _navigate();
//   }
//   void _navigate()async{
//     await Future.delayed(Duration(seconds: 3));
//     context.read<AuthenticationBloc>().add(isLoggedInEvent());
//   }
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<AuthenticationBloc,AuthenticationState>(
//         listener: (context, state) {
//           if(state is AuthLoggedIn){
//             context.go("/bottom");
//           }else if(state is AuthLoggedOut){
//             context.go("/login");
//           }
//         },
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Container(
//             width: double.infinity,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image(image: AssetImage(AssetsHelper.splash))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//
//   }
// }

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // hii
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigate();
    });
  }

  void _navigate() async {
    try {
      await Future.delayed(Duration(seconds: 3));
      context.read<AuthenticationBloc>().add(isLoggedInEvent());
    } catch (e) {
      debugPrint("Error in  the navigation: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthLoggedIn) {
          context.go("/bottom");
        } else if (state is AuthLoggedOut) {
          context.go("/login");
        }
      },
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AssetsHelper.splash, height: 200),
                SizedBox(height: 20),
                CircularProgressIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

