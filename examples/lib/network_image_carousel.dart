import 'package:flutter/material.dart';
import 'package:awesome_carousel/carousels.dart';

class NetworkImageCarouselDemo extends StatelessWidget {
  final List<String> imageUrls;

  final CarouselController _controller;

  const NetworkImageCarouselDemo(
    this.imageUrls,
    this._controller, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Carousel(
          _buildImages(context),
          height: 400.0, // 设置轮播图高度
          controller: _controller,
          indicatorColor: const Color.fromARGB(255, 190, 255, 130),
          // currentIndicatorColor: Colors.transparent,
          indicatorBuilder: _indicatorBuilder,
          // 当用户点击图像时触发的回调函数
          onUnitTapped: (int index) {
            print('点击了第 $index 张图片');
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _controller.toFirstPage();
              },
              child: const Text('首页'),
            ),
            const Spacer(
              flex: 1,
            ),
            ElevatedButton(
              onPressed: () {
                _controller.toPreviousPage();
              },
              child: const Text('上一页'),
            ),
            const Spacer(
              flex: 1,
            ),
            ElevatedButton(
              onPressed: () {
                _controller.toNextPage();
              },
              child: const Text('下一页'),
            ),
            const Spacer(
              flex: 1,
            ),
            ElevatedButton(
              onPressed: () {
                _controller.toLastPage();
              },
              child: const Text('尾页'),
            ),
          ],
        )
      ],
    );
  }

  List<Widget> _buildImages(BuildContext context) {
    List<Widget> res = [];
    for (String url in imageUrls) {
      res.add(
        Image.network(
          url,
          fit: BoxFit.cover, // 使图片宽度占满
          width: MediaQuery.of(context).size.width, // 设置宽度为屏幕宽度
          errorBuilder: (context, error, stackTrace) {
            // 在加载失败时返回一个占位图，确保图片占用固定高度
            return Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.grey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Image loading error:',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    "原因: $error\n追溯：$stackTrace",
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    maxLines: 9,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          },
        ),
      );
    }
    return res;
  }

  Map<String, Widget> _indicatorBuilder(int index) {
    return {
      'plain': Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Text(
              'plain',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Container(
              width: 30,
              height: 10,
              decoration: const BoxDecoration(color: Colors.white),
            ),
          ],
        ),
      ),
      'active': Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const Icon(
              Icons.arrow_circle_down,
              color: Colors.amber,
            ),
            const Text(
              'active',
              style: TextStyle(
                color: Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              width: 30,
              height: 10,
              decoration: BoxDecoration(
                color: switch (index) {
                  0 => Colors.blue,
                  1 => Colors.red,
                  2 => Colors.green,
                  3 => Colors.pink,
                  _ => Colors.purple,
                },
              ),
            ),
          ],
        ),
      )
    };
  }
}
