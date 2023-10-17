import 'package:flutter/material.dart';
import 'package:awesome_carousel/carousels.dart';

class WidgetCarouSelDemo extends StatelessWidget {
  const WidgetCarouSelDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final List<Color> colors = [
      Colors.amber,
      Colors.blue,
      Colors.red,
      Colors.green,
      const Color.fromARGB(255, 59, 255, 177),
    ];

    List<Widget> units = [];

    for (var i = 0; i < colors.length; i++) {
      units.add(
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: colors[i],
          ),
          child: Center(
            child: Text(
              'Page $i',
              style: const TextStyle(
                fontSize: 46,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        Carousel(
          units,
          indicatorShape: BoxShape.circle,
          indicatorWidth: 16,
          currentIndicatorColor: Colors.purple,
        ),
        const Divider(),
        ClipRRect(
          borderRadius: BorderRadius.circular(40.0), // 圆角半径
          child: Carousel(
            units.reversed.toList(),
            scrollDirection: Axis.vertical,
            indicatorShape: BoxShape.rectangle,
            indicatorWidth: 10,
            indicatorHeight: 10,
            currentIndicatorColor: Colors.pink,
            onUnitTapped: (index) => print('轮播单元 $index 被点击了'),
            onIndicatorTapped: (index) => print('进度指示单元 $index 被点击了'),
          ),
        )
      ],
    );
  }
}
