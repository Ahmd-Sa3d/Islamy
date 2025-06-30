import 'package:flutter/material.dart';
import 'package:islamy/UI/app_utils/app_color.dart';
import 'package:islamy/UI/widget/navigationbar_bg_icon.dart';
import '../app_utils/app_icons.dart';

class BottomNavigateBar extends StatefulWidget {
  final int currentIndex;
  final Function onTabChange;

  const BottomNavigateBar({
    super.key,
    required this.currentIndex,
    required this.onTabChange,
  });

  @override
  State<BottomNavigateBar> createState() => _BottomNavigateBarState();
}

class _BottomNavigateBarState extends State<BottomNavigateBar> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: AppColor.gold),
      child: BottomNavigationBar(
        selectedItemColor: AppColor.white,
        unselectedItemColor: AppColor.black,
        showUnselectedLabels: true,
        currentIndex: widget.currentIndex,
        onTap: (index) {
          widget.onTabChange(index);
        },

        items: [
          BottomNavigationBarItem(
            icon: navigationBarBgIcon(
              0,
              AppIcons.quranIcon,
              widget.currentIndex,
            ),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: navigationBarBgIcon(
              1,
              AppIcons.hadithIcon,
              widget.currentIndex,
            ),
            label: 'Hadith',
          ),
          BottomNavigationBarItem(
            icon: navigationBarBgIcon(
              2,
              AppIcons.sebhaIcon,
              widget.currentIndex,
            ),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            icon: navigationBarBgIcon(
              3,
              AppIcons.radioIcon,
              widget.currentIndex,
            ),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: navigationBarBgIcon(
              4,
              AppIcons.timeIcon,
              widget.currentIndex,
            ),
            label: 'Time',
          ),
        ],
      ),
    );
  }
}
