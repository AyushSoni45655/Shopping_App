import 'package:e_commarce_rest_api/core/constant/dimensionHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/stringHelper.dart';
import '../../../../../core/utils/utility.dart';
import '../../blocs/auth/authentication_bloc.dart';
import '../../widgets/custom_button.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,size: 40,)),
        centerTitle: true,
        title: Text("Setting_Screen",style: Theme.of(context).textTheme.headlineLarge,),
      ),
      body: SingleChildScrollView(child: Padding(padding: EdgeInsets.all(DimensionHelper.dimens_20),child: Container(
        width: DimensionHelper.dimens_all,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .4,),
            BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if(state is AuthLoggedOut){
                  context.go("/login");
                }
                else if(state is AuthFailure){
                  Utils().toastMessage(state.message.toString());
                }
              },
              child: CustomButton(title: "LogOut", callback: (){
                context.read<AuthenticationBloc>().add(logoutEvent());
              }, text: "LogOut"),
            )
          ],
        ),
      ),),),
    );
  }
}
