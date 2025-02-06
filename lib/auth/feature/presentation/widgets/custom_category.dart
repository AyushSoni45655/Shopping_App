import 'package:e_commarce_rest_api/core/constant/dimensionHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategory extends StatelessWidget {
  final String title;
  final VoidCallback ?callback;
  final String image;
  const CustomCategory({super.key, required this.title, this.callback, required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding:  EdgeInsets.all(DimensionHelper.dimens_6.sp),
        child: Column(
          children: [
            Container(
              height: DimensionHelper.dimens_80.h,
              width: DimensionHelper.dimens_80.w,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(DimensionHelper.dimens_50.r),
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: NetworkImage(image))
              ),
            ),
            SizedBox(height: DimensionHelper.dimens_4.h,),
            Text(title,style: Theme.of(context).textTheme.headlineMedium,)
          ],
        ),
      ),
    );
  }
}
