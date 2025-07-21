import 'package:flutter/cupertino.dart';

import '../../../app_utils/app_color.dart';
import '../../../app_utils/app_fonts.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(color: AppColor.gold,
        child: Text(
          'SOOOOOOOON',
          style: AppFont.amiri16WhiteF700.copyWith(fontSize: 40),
        ),
      ),
    );;
  }
}
