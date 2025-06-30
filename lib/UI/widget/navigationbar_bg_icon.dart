import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_utils/app_color.dart';

Widget navigationBarBgIcon( int index,String imagePath,int selectedIndex){
  bool isSelected =selectedIndex == index;

  return   isSelected   ? Container(
    decoration: BoxDecoration(
      color: AppColor.navigationIconColor,
      borderRadius: BorderRadius.circular(66),
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
        vertical: 6.0.h,
        horizontal: 19.w,
      ),
      child: ImageIcon(AssetImage(imagePath)),
    ),
  )
      : ImageIcon(AssetImage(imagePath));
}