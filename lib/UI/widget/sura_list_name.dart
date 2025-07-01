import 'package:flutter/material.dart';
import 'package:islamy/UI/app_utils/app_fonts.dart';
import 'package:islamy/UI/app_utils/app_icons.dart';
import 'package:islamy/UI/app_utils/quran_utils.dart';

class SuraListName extends StatelessWidget {
  final int index;
  final int suraNumber;

  const SuraListName({
    super.key,
    required this.index,
    required this.suraNumber,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        QuranUtils.englishQuranSura[index],
        style: AppFont.amiri16WhiteF700.copyWith(fontSize: 20),
      ),
      subtitle: Text(
        '${QuranUtils.ayaNumber[index]} versus',
        style: AppFont.amiri16WhiteF700.copyWith(fontSize: 20),
      ),
      trailing: Text(
        QuranUtils.arabicQuranSura[index],
        style: AppFont.amiri16WhiteF700.copyWith(fontSize: 20),
      ),
      leading: Stack(
        children: [
          Image.asset(AppIcons.vectorSuraNumber),
          Positioned.fill(
            child: Center(
              child: Text(
                '$suraNumber',
                style: AppFont.amiri16WhiteF700.copyWith(fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
