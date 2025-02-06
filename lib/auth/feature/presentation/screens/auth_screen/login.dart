import 'package:e_commarce_rest_api/auth/feature/presentation/blocs/auth/authentication_bloc.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/blocs/password/toggle_bloc.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/widgets/custom_button.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/widgets/custom_text.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/widgets/cutsom_textField.dart';
import 'package:e_commarce_rest_api/core/constant/colorsHelper.dart';
import 'package:e_commarce_rest_api/core/constant/dimensionHelper.dart';
import 'package:e_commarce_rest_api/core/constant/fontsHelper.dart';
import 'package:e_commarce_rest_api/core/constant/stringHelper.dart';
import 'package:e_commarce_rest_api/core/constant/validation.dart';
import 'package:e_commarce_rest_api/core/utils/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController emailCon;
  late TextEditingController passCon;
  @override
  void initState() {
    super.initState();
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
                if (state is AuthFailure) {
                  Utils().toastMessage(state.message.toString());
                } else if (state is AuthSuccess) {
                  context.go("/bottom");
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
                        title: StringHelper.lTitle,
                        style: TextStyle(
                            fontSize: FontHelper.font_40.sp,
                            fontWeight: FontHelper.bold)),
                    SizedBox(
                      height: DimensionHelper.dimens_12.h,
                    ),
                    CustomText(
                        alignment: Alignment.center,
                        title: StringHelper.lSubTitle,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: Colors.grey, letterSpacingDelta: 3)),
                    SizedBox(
                      height: DimensionHelper.dimens_70.h,
                    ),
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
                                context
                                    .read<ToggleBloc>()
                                    .add(PassowrdToggleEvent());
                              },
                              icon: Icon(
                                state.isObscure
                                    ? Iconsax.eye_slash
                                    : Iconsax.eye,
                                size: DimensionHelper.dimens_30.sp,
                              )),
                        );
                      },
                    ),
                    SizedBox(
                      height: DimensionHelper.dimens_30.h,
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: TextButton(
                        onPressed: () {
                          context.go("/fPassword");
                        },
                        child: Text(
                          StringHelper.rPassword,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: DimensionHelper.dimens_50.h,
                    ),
                    state is AuthLoading
                        ? CircularProgressIndicator(
                            color: Colors.green,
                          )
                        : CustomButton(
                            title: StringHelper.login,
                            callback: () {
                              if (formKey.currentState!.validate()) {
                                context.read<AuthenticationBloc>().add(
                                    loginEvent(
                                        password: passCon.text.trim(),
                                        email: emailCon.text.trim()));
                              }
                            },
                            text: StringHelper.login),
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
                      height: MediaQuery.of(context).size.height * .15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                            alignment: Alignment.center,
                            title: StringHelper.dA,
                            style: Theme.of(context).textTheme.headlineMedium),
                        SizedBox(
                          width: DimensionHelper.dimens_4.w,
                        ),
                        CustomText(
                            callback: () {
                              context.go("/signin");
                            },
                            alignment: Alignment.center,
                            title: StringHelper.bSignIn,
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
