import 'package:e_commarce_rest_api/auth/feature/presentation/blocs/auth/authentication_bloc.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/widgets/custom_appvar.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/widgets/custom_button.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/widgets/custom_profile.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/widgets/custom_text.dart';
import 'package:e_commarce_rest_api/core/constant/assetsHelper.dart';
import 'package:e_commarce_rest_api/core/constant/dimensionHelper.dart';
import 'package:e_commarce_rest_api/core/constant/stringHelper.dart';
import 'package:e_commarce_rest_api/core/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leding: Icons.arrow_back,
        title: "Profile",
        child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.mode_edit_outlined,
              size: 40,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(DimensionHelper.dimens_20.sp),
          child: Column(
            children: [
              Container(
                width: DimensionHelper.dimens_all,
                child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  buildWhen: (previous, current) => current is AuthSuccess,
                  builder: (context, state) {
                    if(state is AuthLoading){
                      Utils().toastMessage("No Data");
                    }else if(state is AuthSuccess){
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: DimensionHelper.dimens_40.h,
                          ),
                          CircleAvatar(
                            radius: DimensionHelper.dimens_100.r,
                            backgroundImage: AssetImage(AssetsHelper.person),
                            backgroundColor: Colors.green,
                          ),
                          SizedBox(
                            height: DimensionHelper.dimens_20.h,
                          ),
                          CustomText(
                              alignment: Alignment.center,
                              title: state.user.name,
                              style: Theme.of(context).textTheme.headlineLarge),
                          SizedBox(
                            height: DimensionHelper.dimens_20.h,
                          ),
                          CustomProfile(title: "Full Name", data: state.user.name),
                          SizedBox(
                            height: DimensionHelper.dimens_20.h,
                          ),
                          CustomProfile(title: "Email Address", data: state.user.email),
                          SizedBox(
                            height: DimensionHelper.dimens_20.h,
                          ),
                          CustomProfile(title: "Date Of Birth", data: state.user.dateOfBirth),
                          SizedBox(
                            height: DimensionHelper.dimens_20.h,
                          ),
                          CustomProfile(title: "Phone Number", data: state.user.phoneNumber),

                        ],
                      );
                    }
                    return Center(child: Text("No Data Found"),);
                  },
                ),
              ),
              SizedBox(
                height: DimensionHelper.dimens_20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
