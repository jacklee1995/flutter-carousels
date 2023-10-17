import 'package:flutter/material.dart';
import 'package:awesome_carousel/carousels.dart';

import './src/network_image_carousel.dart';
import './src/widget_carousel.dart';
import './src/net_img_carousel_example.dart';
import '/src/asset_Img_carousel_example.dart';

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

              // 直接使用Carouse加载网络图片的例子
              NetworkImageCarouselDemo(
                imageUrls,
                CarouselController(
                  imageUrls.length, // 轮播单元的数目，唯一的必须参数
                  keepPage: true,
                ),
              ),

              const Divider(),

              // 基于 NetImgCarousel 类的网络图片轮播
              NetImgCarouselExample(),

              const Divider(),

              // 基于 assets 图片的 AssetImgCarousel 类实现轮播
              AssetImgCarouselExample()
            ],
          ),
        ),
      ),
    );
  }
}
