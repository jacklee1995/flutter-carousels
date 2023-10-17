import 'package:flutter/material.dart';
import 'package:awesome_carousel/img_carousels/assert_img_carousel.dart';

class AssetImgCarouselExample extends StatelessWidget {
  final List<String> assetImagePaths = [
    'assets/image1.png',
    'assets/image2.png',
    'assets/image3.png',
  ];

  AssetImgCarouselExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AssetImgCarousel(
        assetImagePaths,
        height: 400.0,
        indicatorColor: Colors.grey,
        currentIndicatorColor: Colors.blue,
        indicatorShape: BoxShape.circle,
        onUnitTapped: (index) {
          print('Tapped on unit $index');
        },
        onIndicatorTapped: (index) {
          print('Tapped on indicator $index');
        },
      ),
    );
  }
}
