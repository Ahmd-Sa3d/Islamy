import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:islamy/UI/screens/tabs/hadith_tab/hadith_content.dart';

class HadithTab extends StatelessWidget {
  const HadithTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CarouselSlider(
        options: CarouselOptions(enlargeCenterPage: true,
          height: double.infinity,
        ),
        items:
            List.generate(50, (index) => index + 1).map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return HadithContent(index: i);
                },
              );
            }).toList(),
      ),
    );
  }
}
