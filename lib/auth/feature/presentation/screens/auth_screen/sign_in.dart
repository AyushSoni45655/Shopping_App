
import 'package:e_commarce_rest_api/auth/feature/domain/entity/user_entity.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/blocs/auth/authentication_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/constant/colorsHelper.dart';
import '../../../../../core/constant/dimensionHelper.dart';
import '../../../../../core/constant/fontsHelper.dart';
import '../../../../../core/constant/stringHelper.dart';
import '../../../../../core/constant/validation.dart';
import '../../../../../core/utils/utility.dart';
import '../../blocs/password/toggle_bloc.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/cutsom_textField.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController emailCon;
  late TextEditingController passCon;
  late TextEditingController nameCon;
  late TextEditingController dOBirth;
  late TextEditingController phoneNumber;

  @override
  void initState() {
    super.initState();
    nameCon = TextEditingController();
    phoneNumber = TextEditingController();
    dOBirth = TextEditingController();
    emailCon = TextEditingController();
    passCon = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailCon.dispose();
    passCon.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              size: DimensionHelper.dimens_60.sp,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(DimensionHelper.dimens_22.sp),
          child: Form(
            key: formKey,
            child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
  listener: (context, state) {
    if(state is AuthSuccess){
      context.go("/bottom");
    }
    else if(state is AuthFailure){
      Utils().toastMessage(state.message.toString());
    }
    // TODO: implement listener
  },
  builder: (context, state) {
    return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: DimensionHelper.dimens_40.h,
                ),
                CustomText(
                    alignment: Alignment.center,
                    title: StringHelper.sTitle,
                    style: TextStyle(
                        fontSize: FontHelper.font_40.sp,
                        fontWeight: FontHelper.bold)),
                SizedBox(
                  height: DimensionHelper.dimens_12.h,
                ),
                CustomText(
                    alignment: Alignment.center,
                    title: StringHelper.sSubTitle,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: Colors.grey, letterSpacingDelta: 3)),
                SizedBox(
                  height: DimensionHelper.dimens_70.h,
                ),
                CutsomTextfield(
                  controller: nameCon,
                  inputType: TextInputType.name,
                  prefixIcon: Icons.person,
                  hintText: StringHelper.nHint,
                  levelText: StringHelper.nLevel,
                  validatre: (value) {
                    return AValidator.validateEmptyText("Name", value);
                  },
                ),
                SizedBox(height: DimensionHelper.dimens_30.h,),
                CutsomTextfield(
                  controller: emailCon,
                  inputType: TextInputType.emailAddress,
                  prefixIcon: Icons.mail,
                  hintText: StringHelper.eHint,
                  levelText: StringHelper.eLevel,
                  validatre: (value) {
                    return AValidator.validateEmail(value);
                  },
                ),
                SizedBox(
                  height: DimensionHelper.dimens_30.h,
                ),
                BlocBuilder<ToggleBloc, TogglePassowrdSTtae>(
                  builder: (context, state) {
                    return CutsomTextfield(
                      obscure: state.isObscure,
                      validatre: (value) {
                        return AValidator.validatePassword(value);
                      },
                      controller: passCon,
                      inputType: TextInputType.visiblePassword,
                      prefixIcon: Iconsax.password_check,
                      hintText: StringHelper.pHint,
                      levelText: StringHelper.pLevel,
                      suffixIcon: IconButton(
                          onPressed: () {
                            context.read<ToggleBloc>().add(PassowrdToggleEvent());
                          },
                          icon: Icon(
                            state.isObscure?  Iconsax.eye_slash:Iconsax.eye,
                            size: DimensionHelper.dimens_30.sp,
                          )),
                    );
                  },
                ),
                SizedBox(height: DimensionHelper.dimens_30.h,),
                CutsomTextfield(
                  controller: phoneNumber,
                  inputType: TextInputType.phone,
                  prefixIcon: Icons.phone,
                  hintText: StringHelper.phoneHint,
                  levelText: StringHelper.phoneLaval,
                  validatre: (value) {
                    return AValidator.validateEmptyText("Phone Number", value);
                  },
                ),
                SizedBox(height: DimensionHelper.dimens_30.h,),
                CutsomTextfield(
                  controller: dOBirth,
                  inputType: TextInputType.name,
                  prefixIcon: Icons.date_range,
                  hintText: StringHelper.dobHint,
                  levelText: StringHelper.dobLevel,
                  validatre: (value) {
                    return AValidator.validateEmptyText("Date Of Birth", value);
                  },
                ),
                SizedBox(
                  height: DimensionHelper.dimens_50.h,
                ),
                state is AuthLoading? CircularProgressIndicator(color: Colors.green,):CustomButton(
                    title: StringHelper.bSignIn,
                    callback: () {
                      if (formKey.currentState!.validate()) {
                        final user = UserEntity(
                            id: "",
                            name: nameCon.text.trim(),
                            email: emailCon.text.trim(),
                            password: passCon.text.trim(),
                            phoneNumber: phoneNumber.text.trim(),
                            dateOfBirth: dOBirth.text.trim()
                        );
                        Utils().toastMessage("Data Processed");
                        context.read<AuthenticationBloc>().add(SigninEvent(userEntity: user));
                      }
                    },
                    text: StringHelper.bSignIn),
                SizedBox(
                  height: DimensionHelper.dimens_50.h,
                ),
                CustomButton(
                  title: StringHelper.sInWGoogle,
                  callback: () {},
                  text: StringHelper.rPassword,
                  gIcon: true,
                ),
                SizedBox(
                  height: DimensionHelper.dimens_70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        alignment: Alignment.center,
                        title: StringHelper.aA,
                        style: Theme.of(context).textTheme.headlineMedium),
                    SizedBox(
                      width: DimensionHelper.dimens_4.w,
                    ),
                    CustomText(
                        callback: () {
                          context.go("/login");
                        },
                        alignment: Alignment.center,
                        title: StringHelper.login,
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .apply(color: ColorsHelper.nBlue))
                  ],
                )
              ],
            );
  },
),
          ),
        ),
      ),
    );
  }
}
