import 'package:e_commarce_rest_api/core/constant/dimensionHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListSeprator extends StatelessWidget {
  final int count;
  final double ?height;
  final Widget Function(BuildContext context, int index)itembuilder;
  const CustomListSeprator({super.key, required this.count, required this.itembuilder,  this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height??120,
      child: ListView.separated(
        primary: true,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          itemBuilder: itembuilder,
          separatorBuilder: (context, index) {
            return SizedBox(width:  DimensionHelper.dimens_6.w,);
          },
          itemCount: count
      ),
    );
  }
}
