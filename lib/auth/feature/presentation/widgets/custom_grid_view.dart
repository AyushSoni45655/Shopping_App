import 'package:e_commarce_rest_api/core/constant/dimensionHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGridView extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext context,int index)itemBuilder;
  const CustomGridView({super.key, required this.itemCount, required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        primary: true,
        itemCount: itemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            //mainAxisExtent: DimensionHelper.dimens_200,
            crossAxisSpacing: DimensionHelper.dimens_12.sp,
            mainAxisSpacing: DimensionHelper.dimens_12.sp),
        itemBuilder: itemBuilder
    );
  }
}
