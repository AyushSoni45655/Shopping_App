import 'package:flutter/material.dart';
import '../../constant/colorsHelper.dart';
import '../../constant/dimensionHelper.dart';

class ACustomDrawer{
  ACustomDrawer._();
  static const lightDrawer = DrawerThemeData(
      width: DimensionHelper.dimens_30,
    backgroundColor: ColorsHelper.blackColor,
    surfaceTintColor: ColorsHelper.blackColor
  );
  static const darkDrawer = DrawerThemeData(
    surfaceTintColor: ColorsHelper.whiteColor,
    width: DimensionHelper.dimens_30,
     backgroundColor: ColorsHelper.whiteColor
  );
}