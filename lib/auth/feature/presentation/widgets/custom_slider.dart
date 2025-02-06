import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/constant/dimensionHelper.dart';

class CustomSlider extends StatelessWidget {
  final int ?count;
  final bool networkBool;
  final List<String>? images;
  const CustomSlider({super.key, this.images,  this.networkBool = false, this.count});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Column(
      children: [
        SizedBox(
          height: DimensionHelper.dimens_300.h,
          child: PageView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            controller: pageController,
            children: List.generate(
              images!.length,
                  (index) => Container(
                margin: EdgeInsets.only(right: DimensionHelper.dimens_10),
                height: DimensionHelper.dimens_200,
                decoration: BoxDecoration(
                  borderRadius:
                  BorderRadius.circular(DimensionHelper.dimens_30),
                  // image: DecorationImage(
                  //     fit: BoxFit.cover,
                  //     image:AssetImage(images![index]))
                  //
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(DimensionHelper.dimens_6.r),
                  child: Image(
                      fit: BoxFit.fill,
                      image: networkBool?NetworkImage(images![index]):AssetImage(images![index])as ImageProvider),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: DimensionHelper.dimens_15.h,
        ),
        SmoothPageIndicator(
          controller: pageController,
          count: count??0,
          effect: ExpandingDotsEffect(
            activeDotColor: Colors.blue,
            dotColor: Colors.grey,
            dotHeight: 10,
            dotWidth: 10,
            expansionFactor: 4,
          ),
        )
      ],
    );
  }
}
