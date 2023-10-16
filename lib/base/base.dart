/// Carousel 是一个用于在Flutter应用程序中实现轮播的插件
///
/// 作者：李俊才
/// 邮箱：291148484@163.com
/// 协议：MIT
///
/// 有关MIT协议的详细信息，请参阅项目的许可证文档（通常在项目的根目录中的"LICENSE"文件）
///

import 'package:flutter/material.dart';
import '../types.dart';
import 'controller.dart';

/// 用于创建一个通用的轮播组件，可以基于它封装各种轮播
///
/// - [units] 表示要轮播的组件列表
/// - [height] 表示轮播组件的高度，默认为400.0
/// - [width] 表示轮播组件的宽度，默认为0.0
/// - [onUnitTapped] 表示当轮播单元被点击时的回调函数，可选
/// - [onIndicatorTapped] 表示当指示器被点击时的回调函数，可选
/// - [useindicator] 表示是否使用指示器，默认为true
/// - [indicatorColor] 表示默认指示器的颜色，默认为白色
/// - [currentIndicatorColor] 表示当前选中指示器的颜色，默认为蓝色
/// - [indicatorWidth] 表示指示器的宽度，默认为40.0
/// - [indicatorHeight] 表示指示器的高度，默认为26.0
/// - [indicatorMargin] 表示指示器之间的间距，默认为3.0
/// - [indicatorToBottom] 表示指示器距离底部的距离，默认为10.0
/// - [indicatorShape] 表示默认指示器的形状，默认为矩形
/// - [pageSnapping] 表示是否启用页面快速吸附，默认为true
/// - [padEnds] 表示是否在轮播首尾添加额外的页面，默认为true
/// - [controller] 表示轮播控制器，可选
class Carousel extends StatefulWidget {
  /// 要轮播的组件列表
  final List<Widget> units;

  /// 轮播组件的高度
  final double height;

  /// 轮播组件的宽度
  final double width;

  /// 是否使用指示器，默认为 true
  final bool useindicator;

  /// 当图像被点击时的回调函数，可选
  final FunctionWithAInt? onUnitTapped;

  /// 当指示器被点击时的回调函数，可选
  final FunctionWithAInt? onIndicatorTapped;

  /// 自定义指示器构建函数，可选
  final FunctionIndicatorBuilder? indicatorBuilder;

  /// 默认指示器的颜色
  final Color indicatorColor;

  /// 当前选中指示器的颜色
  final Color currentIndicatorColor;

  /// 指示器的宽度
  final double indicatorWidth;

  /// 指示器的高度
  final double indicatorHeight;

  /// 指示器之间的间距
  final double indicatorMargin;

  /// 指示器距离底部的距离
  final double indicatorToBottom;

  /// 默认指示器的形状，默认为矩形
  final BoxShape indicatorShape;

  /// 是否启用页面快速吸附，默认为 true
  final bool pageSnapping;

  /// 是否在轮播首尾添加额外的页面， 默认为 true
  final bool padEnds;

  final Clip clipBehavior;

  final bool reverse;

  final Axis scrollDirection;

  /// 轮播控制器，可选
  final CarouselController? controller;

  /// 是否禁用默认指示器回调函数
  final bool disableIndicatorDefaultCallbacks = false;

  const Carousel(
    this.units, {
    super.key,
    this.height = 400.0,
    this.width = 0.0,
    this.onUnitTapped,
    this.onIndicatorTapped,
    this.useindicator = true,
    this.indicatorColor = Colors.white,
    this.currentIndicatorColor = Colors.blue,
    this.indicatorWidth = 40.0,
    this.indicatorHeight = 26.0,
    this.indicatorMargin = 3.0,
    this.indicatorToBottom = 10.0,
    this.indicatorShape = BoxShape.rectangle,
    this.indicatorBuilder,
    this.pageSnapping = true,
    this.padEnds = true,
    this.clipBehavior = Clip.hardEdge,
    this.reverse = false,
    this.scrollDirection = Axis.horizontal,
    this.controller,
  });

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  double _width = 0.0;
  List<Map<String, Widget>> customIndicators = [];
  late CarouselController controller;

  @override
  Widget build(BuildContext context) {
    controller = widget.controller ??
        CarouselController(
          widget.units.length,
          initialPage: 0,
        );
    if (widget.width <= 0) {
      _width = MediaQuery.of(context).size.width;
    } else {
      _width = widget.width;
    }

    if (widget.indicatorBuilder != null) {
      for (int index = 0; index < widget.units.length; index++) {
        customIndicators.add(
          widget.indicatorBuilder!(index),
        );
      }
    }

    return Column(
      children: <Widget>[
        Stack(
          children: [
            SizedBox(
              height: widget.height,
              child: ListenableBuilder(
                listenable: controller,
                builder: (BuildContext context, Widget? child) {
                  return PageView.builder(
                    scrollDirection: widget.scrollDirection,
                    controller: controller.pageController,
                    itemCount: widget.units.length,
                    pageSnapping: widget.pageSnapping,
                    padEnds: widget.padEnds,
                    clipBehavior: widget.clipBehavior,
                    reverse: widget.reverse,
                    onPageChanged: (int page) {
                      controller.currentPage = page;
                    },
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        // 调用传入的点击事件
                        onTap: () {
                          widget.onUnitTapped!(index);
                        },
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: widget.units[index],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            widget.useindicator
                ? Positioned(
                    bottom: widget.indicatorToBottom,
                    child: SizedBox(
                      width: _width,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ListenableBuilder(
                          listenable: controller,
                          builder: (BuildContext context, Widget? child) {
                            return _buildProgressIndicator();
                          },
                        ),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ],
    );
  }

  /// 构建进度指示器
  Widget _buildProgressIndicator() {
    final List<Widget> indicators = [];

    for (int index = 0; index < widget.units.length; index++) {
      indicators.add(
        GestureDetector(
          // 当前进度指示器事件，允许禁用默认事件和指定自定义事件
          onTap: () {
            // 未禁用默认事件时，点击后跳转页面
            if (!widget.disableIndicatorDefaultCallbacks) {
              controller.goToPage(index);
            }
            // 若指定用户自定义事件则调用之
            if (widget.onIndicatorTapped != null) {
              widget.onIndicatorTapped!(index);
            }
          },
          // 但用户指示器列表非空时，按照
          child: customIndicators.isEmpty
              ? Container(
                  width: widget.indicatorWidth,
                  height: widget.indicatorHeight,
                  margin:
                      EdgeInsets.symmetric(horizontal: widget.indicatorMargin),
                  decoration: BoxDecoration(
                    shape: widget.indicatorShape,
                    color: index == controller.currentPage
                        ? widget.currentIndicatorColor
                        : widget.indicatorColor,
                  ),
                )
              : controller.currentPage == index
                  ? customIndicators[index]['active']
                  : customIndicators[index]['plain'],
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: indicators,
      ),
    );
  }
}
