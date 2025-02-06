import 'package:e_commarce_rest_api/core/constant/assetsHelper.dart';
import 'package:e_commarce_rest_api/core/constant/colorsHelper.dart';
import 'package:e_commarce_rest_api/core/constant/dimensionHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final String text;
  bool gIcon;
  final VoidCallback callback;
  CustomButton(
      {super.key,
      required this.title,
      required this.callback,
      required this.text,
      this.gIcon = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        height: DimensionHelper.dimens_60.h,
        width: DimensionHelper.dimens_all.w,
        decoration: BoxDecoration(
            border: text != title
                ? Border.all(width: 1.2, color: Colors.black)
                : null,
            borderRadius: BorderRadius.circular(DimensionHelper.dimens_30.r),
            color: text == title
                ? ColorsHelper.blackColor
                : ColorsHelper.transparent),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           gIcon? SizedBox(
             height: DimensionHelper.dimens_30,
              width: DimensionHelper.dimens_30.w,
              child: Image(image: AssetImage(AssetsHelper.google,),fit: BoxFit.cover,),
            ):SizedBox(),
            SizedBox(width: DimensionHelper.dimens_30,),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .apply(color: text == title ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
