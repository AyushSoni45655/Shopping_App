import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final VoidCallback ?callback;
  final Alignment  alignment;
  final String title;
  final TextStyle ?style;
  const CustomText({super.key, required this.alignment, required this.title, required this.style, this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        alignment: alignment,
        child: Text(title,style: style,),
      ),
    );
  }
}
