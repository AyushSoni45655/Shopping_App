import 'package:e_commarce_rest_api/core/constant/dimensionHelper.dart';
import 'package:e_commarce_rest_api/core/constant/fontsHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CutsomTextfield extends StatelessWidget {
  final String? Function(String?)?validatre;
  final TextEditingController controller;
  final String ?levelText;
  final String ?hintText;
  final IconData ?prefixIcon;
  final Widget ?suffixIcon;
  final TextInputType inputType;
  bool obscure;
   CutsomTextfield({super.key, required this.controller, this.levelText, this.hintText, this.prefixIcon, this.suffixIcon, required this.inputType,this.obscure = false, this.validatre});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontWeight: FontHelper.regular,
        fontSize: FontHelper.font_26
      ),
      validator: validatre,
      controller: controller,
       keyboardType: inputType,
      obscureText: obscure,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(DimensionHelper.dimens_40.r)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(DimensionHelper.dimens_14.r)),
        hintText: hintText,
        prefixIcon: Icon(prefixIcon,size: DimensionHelper.dimens_30.sp,),
        //contentPadding: EdgeInsets.symmetric(horizontal: DimensionHelper.dimens_20.w),
        suffixIcon: suffixIcon,
        labelText: levelText,
        hintStyle: Theme.of(context).textTheme.headlineMedium,
        labelStyle: Theme.of(context).textTheme.labelLarge
      ),
    );
  }
}
