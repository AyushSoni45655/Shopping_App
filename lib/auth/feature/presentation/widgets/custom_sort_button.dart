import 'package:e_commarce_rest_api/core/constant/dimensionHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
enum Sortoption{
  LOW_TO_HIGH,
  HIGH_TO_LOW,
  GENERAL
}
class CustomSortButton extends StatelessWidget {
  final Function(dynamic)onchange;
  const CustomSortButton({super.key, required this.onchange});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      underline: Container(),
      icon: Icon(Icons.sort),
      iconEnabledColor: Colors.red,
      iconSize: 40,
      dropdownColor: Colors.green,
        items: List.generate(Sortoption.values.length,(index) => DropdownMenuItem<Sortoption>(
          value: Sortoption.values[index],
            child: Text(Sortoption.values[index].toString().split(".").last)),),
      onChanged: onchange,
        );
  }
}
