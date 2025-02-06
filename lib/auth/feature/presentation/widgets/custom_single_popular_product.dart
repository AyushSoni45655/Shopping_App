import 'package:e_commarce_rest_api/core/constant/colorsHelper.dart';
import 'package:e_commarce_rest_api/core/constant/dimensionHelper.dart';
import 'package:e_commarce_rest_api/core/constant/fontsHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSinglePopularProduct extends StatelessWidget {
  final VoidCallback? callback;
  final double ?height;
  final Widget ?isWishList;
  final String ?image;
  final String ?title;
  final String ?price;
  final double ?width;
  const CustomSinglePopularProduct({super.key, this.callback, this.height, this.width, this.image, this.title, this.price, this.isWishList,});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.all(DimensionHelper.dimens_8.sp),
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(DimensionHelper.dimens_10.r),
          color: ColorsHelper.greyColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children:[ 
                Container(
                height: DimensionHelper.dimens_150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: ColorsHelper.redColor,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                      image: NetworkImage(image??'no Image'))
                ),
              ),
                Positioned(
                  left: MediaQuery.of(context).size.width *.32,
                  top: MediaQuery.of(context).size.height*.01,
                  child: Container(
                    child: isWishList,
                  ),
                )
              ]
            ),
            SizedBox(height: DimensionHelper.dimens_2.h,),
            Text("Best Seller",style: Theme.of(context).textTheme.headlineMedium!.apply(color: ColorsHelper.bSeller),),
            SizedBox(height: DimensionHelper.dimens_2.h,),
            Text(title??'No Title',style: TextStyle(
              fontSize: FontHelper.font_20.sp,
              fontWeight: FontHelper.bold
            ),maxLines: 2,overflow: TextOverflow.ellipsis,),
            SizedBox(height: DimensionHelper.dimens_2.h,),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$ ${price}.00"??'no Price',style: Theme.of(context).textTheme.headlineMedium!.apply(color: ColorsHelper.bSeller,),),
                  Container(
                    height: DimensionHelper.dimens_50.h,
                    width: DimensionHelper.dimens_60.w,
                    decoration: BoxDecoration(
                      color: ColorsHelper.bSeller,
                      borderRadius: BorderRadius.only(
                        topLeft:  Radius.circular(DimensionHelper.dimens_20.r),
                        bottomRight: Radius.circular(DimensionHelper.dimens_20.r)
                      )
                    ),
                    child: Center(child: Icon(Icons.add,size: DimensionHelper.dimens_34,),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
