
import 'package:e_commarce_rest_api/core/constant/fontsHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/colorsHelper.dart';
import '../../../../core/constant/dimensionHelper.dart';
import '../../../../core/constant/stringHelper.dart';

class CustomSearchBar extends StatelessWidget {
  final String ?hint;
  final TextEditingController ?controller;
  final Function(String)?onchange;
  const CustomSearchBar({super.key, this.onchange,  this.controller, this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: DimensionHelper.dimens_60.h,
      width: DimensionHelper.dimens_all.w,
      decoration: BoxDecoration(
        border: Border.all(width: DimensionHelper.dimens_2,color: ColorsHelper.blackColor),
          color: ColorsHelper.whiteColor,
          borderRadius: BorderRadius.circular(DimensionHelper.dimens_15.r)),
      child: TextFormField(
        style:  TextStyle(
          fontSize: FontHelper.font_24.sp
        ),
        controller: controller,
        onChanged: onchange,
        decoration:  InputDecoration(
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
            disabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
            suffixIcon: Icon(Icons.mic,size: DimensionHelper.dimens_40.sp,),
            contentPadding: EdgeInsets.only(top: DimensionHelper.dimens_15),
            hintText: hint,
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: FontHelper.font_22.sp
            ),
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search,size: DimensionHelper.dimens_40.sp,)
        ),
      ),
    );
  }
}
