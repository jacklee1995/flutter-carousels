import 'package:flutter/material.dart';
import 'package:awesome_carousel/carousels.dart';

class NetImgCarouselExample extends StatelessWidget {
  final List<String> imageUrls = [
    'https://gitee.com/jacklee1995/example-pictures/raw/master/shoe/shoe1(1).png',
    'https://gitee.com/jacklee1995/example-pictures/raw/master/shoe/shoe1(3).png',
    'https://gitee.com/jacklee1995/example-pictures/raw/master/shoe/shoe1(5).png',
    'https://gitee.com/jacklee1995/example-pictures/raw/master/shoe/shoe1(7).png',
    'https://gitee.com/jacklee1995/example-pictures/raw/master/shoe/shoe1(2).png',
  ];

  NetImgCarouselExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NetImgCarousel(
        imageUrls,
        height: 400.0,
        indicatorColor: Colors.grey,
        currentIndicatorColor: Colors.blue,
        onUnitTapped: (index) {
          // Handle tap on carousel unit.
          print('Tapped on unit $index');
        },
        onIndicatorTapped: (index) {
          // Handle tap on indicator.
          print('Tapped on indicator $index');
        },
      ),
    );
  }
}
