import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamy/UI/app_utils/app_color.dart';
import 'package:islamy/UI/app_utils/app_fonts.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return
       Center(
         child: Container(color: AppColor.gold,
           child: Text(
            'SOOOOOOOON',
            style: AppFont.amiri16WhiteF700.copyWith(fontSize: 40),
                 ),
         ),
       );
  }
}
