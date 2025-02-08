import 'package:e_commarce_rest_api/auth/feature/presentation/widgets/custom_text.dart';
import 'package:e_commarce_rest_api/core/constant/dimensionHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProfile extends StatelessWidget {
  final String title;
  final String data;
  const CustomProfile({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(alignment: Alignment.centerLeft, title: title, style: Theme.of(context).textTheme.headlineLarge),
        SizedBox(height: DimensionHelper.dimens_20.h,),
        Container(width: DimensionHelper.dimens_all,
        padding:  EdgeInsets.symmetric(horizontal: DimensionHelper.dimens_30,vertical: 15),
          child: Text(data,style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.grey,letterSpacingDelta: 1,fontSizeDelta: 12),),
        )

      ],
    );
  }
}
