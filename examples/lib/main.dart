import 'package:examples/widget_carousel.dart';
import 'package:flutter/material.dart';
import 'package:awesome_carousel/carousels.dart';

import './network_image_carousel.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imageUrls = [
      'https://gitee.com/jacklee1995/example-pictures/raw/master/suits/suit1(1).png',
      'https://gitee.com/jacklee1995/example-pictures/raw/master/suits/suit1(2).png',
      'https://gitee.com/jacklee1995/example-pictures/raw/master/suits/suit1(3).png',
      'https://gitee.com/jacklee1995/example-pictures/raw/master/suits/suit1(4).png',
      'https://gitee.com/jacklee1995/example-pictures/raw/master/suits/suit1(5).png',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Carousel 示例'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // 使用用户自定义内容作为轮播项的例子，自定义了轮播
              const WidgetCarouSelDemo(),

              // 使用网络图片作为轮播项的例子
              NetworkImageCarouselDemo(
                imageUrls,
                CarouselController(
                  imageUrls.length, // 轮播单元的数目，唯一的必须参数
                  keepPage: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
