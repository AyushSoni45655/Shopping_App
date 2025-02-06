import 'package:e_commarce_rest_api/core/constant/colorsHelper.dart';
import 'package:e_commarce_rest_api/core/constant/dimensionHelper.dart';
import 'package:e_commarce_rest_api/core/constant/fontsHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRowTextSpaceBetween extends StatelessWidget {
  final String title1;
  final VoidCallback? callback;
  final String title2;
  const CustomRowTextSpaceBetween(
      {super.key, required this.title1, required this.title2, this.callback});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: DimensionHelper.dimens_6.h,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            title1,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          TextButton(
              onPressed: callback,
              child: Text(
                title2,
                style: TextStyle(
                  color: ColorsHelper.nBlue,
                  fontSize: FontHelper.font_24,
                  fontWeight: FontWeight.bold,
                ),
              ))
        ]),
        SizedBox(
          height: DimensionHelper.dimens_16.h,
        )
      ],
    );
  }
}
