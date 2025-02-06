import 'package:e_commarce_rest_api/core/constant/colorsHelper.dart';
import 'package:e_commarce_rest_api/core/constant/dimensionHelper.dart';
import 'package:e_commarce_rest_api/core/constant/fontsHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final IconData ?leding;
  final String ?title;
  final Widget ?child;
  final bool isDropDown;
  final String ?subtitle;
  final VoidCallback ?trailingCall;
  final IconData ?trailing;
  bool  hometitle;
   CustomAppBar({super.key, this.leding, this.title, this.subtitle, this.trailing,this.hometitle = false, this.trailingCall, this.child,  this.isDropDown = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(leding,color: ColorsHelper.blackColor,size: DimensionHelper.dimens_34.sp,),
      title:hometitle? Column(
        children: [
          Text(
            title??'no title',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          SizedBox(height: DimensionHelper.dimens_4.h,),
          Text(
            subtitle??'no subtitle',
            style:TextStyle(
              fontSize: FontHelper.font_22,
              color: Colors.grey
            )
          ),
        ],
      ): Text(
        title??'no title',
        style: Theme.of(context).textTheme.headlineMedium
      ),
      centerTitle: true,
      actions: [
        IconButton(onPressed: trailingCall, icon: Icon(trailing,color: Colors.black,size: DimensionHelper.dimens_45.sp,)),
       // SizedBox(width: DimensionHelper.dimens_20.w,),
        Container(
          child: child,
        ),
        SizedBox(width: DimensionHelper.dimens_30.w,)
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(DimensionHelper.dimens_60.h);
}
