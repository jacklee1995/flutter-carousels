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

/// Used to create a generic carousel component that can be customized for various carousels.
///
/// 用于创建通用的轮播组件，可为各种轮播自定义
///
/// - [units] represents a list of components to be carousel-ed.
/// - [units] 表示要轮播的组件列表
///
/// - [height] represents the height of the carousel component, defaults to 400.0.
/// - [height] 表示轮播组件的高度，默认为400.0
///
/// - [width] represents the width of the carousel component, defaults to 0.0.
/// - [width] 表示轮播组件的宽度，默认为0.0
///
/// - [onUnitTapped] represents a callback function when a carousel unit is tapped, optional.
/// - [onUnitTapped] 表示当轮播单元被点击时的回调函数，可选
///
/// - [onIndicatorTapped] represents a callback function when an indicator is tapped, optional.
/// - [onIndicatorTapped] 表示当指示器被点击时的回调函数，可选
///
/// - [useindicator] indicates whether to use indicators, defaults to true.
/// - [useindicator] 表示是否使用指示器，默认为true
///
/// - [indicatorColor] represents the default indicator color, defaults to white.
/// - [indicatorColor] 表示默认指示器的颜色，默认为白色
///
/// - [currentIndicatorColor] represents the color of the currently selected indicator, defaults to blue.
/// - [currentIndicatorColor] 表示当前选中指示器的颜色，默认为蓝色
///
/// - [indicatorWidth] represents the width of the indicators, defaults to 40.0.
/// - [indicatorWidth] 表示指示器的宽度，默认为40.0
///
/// - [indicatorHeight] represents the height of the indicators, defaults to 26.0.
/// - [indicatorHeight] 表示指示器的高度，默认为26.0
///
/// - [indicatorMargin] represents the spacing between the indicators, defaults to 3.0.
/// - [indicatorMargin] 表示指示器之间的间距，默认为3.0
///
/// - [indicatorToBottom] represents the distance of the indicators from the bottom, defaults to 10.0.
/// - [indicatorToBottom] 表示指示器距离底部的距离，默认为10.0
///
/// - [indicatorShape] represents the default shape of the indicators, defaults to a rectangle.
/// - [indicatorShape] 表示默认指示器的形状，默认为矩形
///
/// - [pageSnapping] indicates whether to enable page snapping, defaults to true.
/// - [pageSnapping] 表示是否启用页面快速吸附，默认为true
///
/// - [padEnds] indicates whether to add extra pages at the beginning and end of the carousel, default is true.
/// - [padEnds] 表示是否在轮播首尾添加额外的页面，默认为true
///
/// - [controller] represents the carousel controller, optional.
/// - [controller] 表示轮播控制器，可选
///
/// - [disableIndicatorDefaultCallbacks] Whether to disable default indicator callback functions.
/// - [disableIndicatorDefaultCallbacks] 是否禁用默认的指示器回调函数
///
class Carousel extends StatefulWidget {
  /// List of components to be carousel-ed.
  /// 要轮播的组件列表
  final List<Widget> units;

  /// Height of the carousel component.
  /// 轮播组件的高度
  final double height;

  /// Width of the carousel component.
  /// 轮播组件的宽度
  final double width;

  /// Whether to use indicators, defaults to true.
  /// 是否使用指示器，默认为true
  final bool useindicator;

  /// Callback function when a unit in the carousel is clicked, optional.
  /// 当轮播单元被点击时的回调函数，可选
  final FunctionWithAInt? onUnitTapped;

  /// Callback function when an indicator is clicked, optional.
  /// 当指示器被点击时的回调函数，可选
  final FunctionWithAInt? onIndicatorTapped;

  /// Custom indicator builder function, optional.
  /// 自定义指示器构建函数，可选
  final FunctionIndicatorBuilder? indicatorBuilder;

  /// Default indicator color.
  /// 默认指示器颜色
  final Color indicatorColor;

  /// Color of the currently selected indicator.
  /// 当前选中指示器的颜色
  final Color currentIndicatorColor;

  /// Indicator width.
  /// 指示器宽度
  final double indicatorWidth;

  /// Indicator height.
  /// 指示器高度
  final double indicatorHeight;

  /// Spacing between indicators.
  /// 指示器之间的间距
  final double indicatorMargin;

  /// Distance of indicators from the bottom.
  /// 指示器距离底部的距离
  final double indicatorToBottom;

  /// Default indicator shape, defaults to a rectangle.
  /// 默认指示器形状，默认为矩形
  final BoxShape indicatorShape;

  /// Whether to enable page snapping, defaults to true.
  /// 是否启用页面快速吸附，默认为true
  final bool pageSnapping;

  /// Whether to add extra pages at the beginning and end of the carousel, default is true.
  /// 是否在轮播首尾添加额外的页面，默认为true
  final bool padEnds;

  /// The behavior for the clip.
  /// 剪裁的行为
  final Clip clipBehavior;

  /// Whether to reverse the order of items.
  /// 是否倒序项目的顺序
  final bool reverse;

  /// The axis along which the page view scrolls.
  /// 页面视图滚动的轴
  final Axis scrollDirection;

  /// Carousel controller, optional.
  /// 轮播控制器，可选
  final CarouselController? controller;

  /// Whether to disable default indicator callback functions, default is false.
  /// 是否禁用默认指示器回调函数，默认为false。
  final bool disableIndicatorDefaultCallbacks;

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
    this.disableIndicatorDefaultCallbacks = false,
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
