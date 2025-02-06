import 'package:e_commarce_rest_api/auth/feature/domain/entity/product_entity.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/widgets/custom_button.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/widgets/custom_slider.dart';
import 'package:e_commarce_rest_api/auth/feature/presentation/widgets/custom_text.dart';
import 'package:e_commarce_rest_api/core/constant/colorsHelper.dart';
import 'package:e_commarce_rest_api/core/constant/dimensionHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
String formattedDate(String date){
  final DateTime  dates = DateTime.parse(date);
  return DateFormat("dd MMM yyyy").format(dates);
}
class DetailsScreen extends StatelessWidget {
  final ProductEntity productEntity;
  const DetailsScreen({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.go('/bottom');
            },
            icon: Icon(
              Icons.arrow_back,
              size: DimensionHelper.dimens_30.sp,
              color: ColorsHelper.blackColor,
            )),
        title: Text(
          "Deatils_Screen",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        centerTitle: true,
        elevation: 2,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: [
          CustomSlider(
            count: productEntity.images!.length,
            networkBool: true,
            images: productEntity.images,
          ),
          SizedBox(
            height: DimensionHelper.dimens_12.h,
          ),
          Padding(padding: EdgeInsets.all(DimensionHelper.dimens_20),child: Column(
            children: [
              CustomText(
                  alignment: Alignment.centerLeft,
                  title: productEntity.title.toString(),
                  style: Theme.of(context).textTheme.headlineLarge),
              SizedBox(height: DimensionHelper.dimens_12.h,),
              Row(
                children: [
                  Container(
                    width: DimensionHelper.dimens_100.w,
                    height: DimensionHelper.dimens_40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(DimensionHelper.dimens_10.r),
                        color: ColorsHelper.blackColor
                    ),
                    child: Center(
                      child: Text("⭐ 4.8",style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white),),
                    ),
                  ),
                  SizedBox(width: DimensionHelper.dimens_10.w,),
                  CustomText(alignment: Alignment.centerLeft, title: "(185 Review)", style: Theme.of(context).textTheme.headlineMedium)
                ],
              ),
              SizedBox(height: DimensionHelper.dimens_20.h,),
              CustomText(alignment: Alignment.centerLeft, title: "Description", style:Theme.of(context).textTheme.headlineLarge),
              SizedBox(height: DimensionHelper.dimens_20.h,),
              CustomText(alignment: Alignment.centerLeft, title: productEntity.description.toString(), style:Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.grey)),
              SizedBox(height: DimensionHelper.dimens_20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(alignment: Alignment.centerLeft, title: "\$ ${productEntity.price.toString()}.00", style:Theme.of(context).textTheme.headlineLarge!.apply(color: Colors.red)),
                  CustomText(alignment: Alignment.centerLeft, title: formattedDate(productEntity.creationAt.toString()), style:Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.green))
                ],
              ),
              SizedBox(height: DimensionHelper.dimens_20.h,),
              CustomText(alignment: Alignment.centerLeft, title: 'Size', style: Theme.of(context).textTheme.headlineLarge),
              SizedBox(height: DimensionHelper.dimens_20.h,),
              Row(
                children: List.generate(5, (index) {
                  return Container(
                    margin: EdgeInsets.only(right: DimensionHelper.dimens_10.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorsHelper.blackColor,width: 1.2)
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: DimensionHelper.dimens_8,
                      vertical: DimensionHelper.dimens_12.h
                    ),
                    child: Center(child: Text("Size : ${index +30}",style: Theme.of(context).textTheme.headlineMedium,),),);
                },),
              ),
              SizedBox(height: DimensionHelper.dimens_20.h,),
              CustomButton(
                title: "Add To Bag", callback: () {

              },
                text: "Add To Bag",
              )
            ],
          ),),

        ],
      ),
    );
  }
}
