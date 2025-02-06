import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AHelperFunction{
  AHelperFunction._();
  static Color? getColor (String value){
    if(value == 'Green'){
      return Colors.green;
    }
    else if(value == 'Red'){
      return Colors.red;
    }else if(value == 'Pink'){
      return Colors.pink;
    }else if(value == 'White'){
      return Colors.white;
    }
    else if(value == 'Yellow'){
      return Colors.yellow;
    }
    return null;
  }
  static void showSnackBar(String message){
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(content: Text(message)));
  }
  static void showAlert(String title,String message){
    showDialog(context: Get.context!, builder: (context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(onPressed: ()=>Navigator.pop(context), child: const Text("Ok"),)
        ]
      );
    },);
  }
  static void navigateScreen(BuildContext context, Widget screen){
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen,));
  }
  static String truncateText(String text,int maxLength){
    if(text.length <= maxLength){
      return text;
    }
    else{
      return '${text.substring(0,maxLength)}...';
    }
  }
  static bool isDarkMode(BuildContext context){
    return  Theme.of(context).brightness == Brightness.dark;
  }
  static Size screemSize(){
    return MediaQuery.of(Get.context!).size;
  }
  static double screenHeight(){
    return MediaQuery.of(Get.context!).size.height;
  }static double screenWidth(){
    return MediaQuery.of(Get.context!).size.width;
  }
  static List<T> removeDuplicate<T>(List<T> list){
    return list.toSet().toList();
  }
  static List<Widget> wrapWidget(List<Widget> widgets,int rowSize){
    final wrappedList = <Widget>[];
    for(var i = 0; i< widgets.length; i+= rowSize){
      final rowChildren = widgets.sublist(i,i + rowSize > widgets.length ? widgets.length : i+ rowSize);
      wrappedList.add(Row(children:rowChildren,));
    }
    return wrappedList;
  }
}