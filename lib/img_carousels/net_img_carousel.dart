import 'package:awesome_carousel/base/base.dart';
import 'package:awesome_carousel/base/controller.dart';
import 'package:awesome_carousel/types.dart';
import 'package:flutter/material.dart';

class NetImgCarousel extends StatefulWidget {
  /// List of network image URLs to be displayed in the carousel.
  /// 要在轮播中显示的网络图片URL列表
  final List<String> imageUrls;

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

  /// Whether to disable default indicator callback functions.
  /// 是否禁用默认指示器回调函数
  final bool disableIndicatorDefaultCallbacks;

  /// Image scale factor, defaults to 1.0.
  /// 图片缩放因子，默认为1.0
  final double imgScale;

  /// Builder for image frames, optional.
  /// 图片帧的构建器，可选
  final ImageFrameBuilder? imgFrameBuilder;

  /// Builder for image loading, optional.
  /// 图片加载的构建器，可选
  final ImageLoadingBuilder? imgLoadingBuilder;

  /// Builder for image error widget, optional.
  /// 图片错误小部件的构建器，可选
  final ImageErrorWidgetBuilder? imgErrorBuilder;

  /// Whether to exclude the image from semantics, defaults to false.
  /// 是否排除图像从语义中，默认为false
  final bool imgExcludeFromSemantics;

  /// Semantic label for the image, optional.
  /// 图像的语义标签，可选
  final String? imgSemanticLabel;

  /// Width of the image, optional.
  /// 图像的宽度，可选
  final double? imgWidth;

  /// Height of the image, optional.
  /// 图像的高度，可选
  final double? imgHeight;

  /// Color of the image, optional.
  /// 图像的颜色，可选
  final Color? imgColor;

  /// Opacity of the image, optional.
  /// 图像的不透明度，可选
  final Animation<double>? imgOpacity;

  /// Blend mode for the image color, optional.
  /// 图像颜色的混合模式，可选
  final BlendMode? imgColorBlendMode;

  /// Fit of the image, optional.
  /// 图像的适应方式，可选
  final BoxFit? imgFit;

  /// Alignment of the image, optional.
  /// 图像的对齐方式，可选
  final AlignmentGeometry imgAlignment;

  /// Repeat mode for the image, optional.
  /// 图像的重复模式，可选
  final ImageRepeat imgRepeat;

  /// Center slice for the image, optional.
  /// 图像的中心切片，可选
  final Rect? imgCenterSlice;

  /// Whether the image matches text direction, optional.
  /// 图像是否匹配文本方向，可选
  final bool imgMatchTextDirection;

  /// Whether to enable gapless playback for the image, optional.
  /// 是否启用无缝播放图像，可选
  final bool imgGaplessPlayback;

  /// Filter quality for the image, optional.
  /// 图像的滤镜质量，可选
  final FilterQuality imgFilterQuality;

  /// Whether the image is anti-aliased, optional.
  /// 图像是否反锯齿，可选
  final bool imgIsAntiAlias;

  /// Headers for network requests when fetching images, optional.
  /// 获取图像时的网络请求头，可选
  final Map<String, String>? imgHeaders;

  /// Width to which the image should be cached, optional.
  /// 图像应该缓存到的宽度，可选
  final int? imgCacheWidth;

  /// Height to which the image should be cached, optional.
  /// 图像应该缓存到的高度，可选
  final int? imgCacheHeight;

  const NetImgCarousel(
    this.imageUrls, {
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
    this.disableIndicatorDefaultCallbacks = false,
    this.imgScale = 1.0,
    this.imgFrameBuilder,
    this.imgLoadingBuilder,
    this.imgExcludeFromSemantics = false,
    this.imgAlignment = Alignment.center,
    this.imgRepeat = ImageRepeat.noRepeat,
    this.imgMatchTextDirection = false,
    this.imgGaplessPlayback = false,
    this.imgFilterQuality = FilterQuality.low,
    this.imgIsAntiAlias = false,
    this.imgErrorBuilder,
    this.imgSemanticLabel,
    this.imgWidth,
    this.imgHeight,
    this.imgColor,
    this.imgOpacity,
    this.imgColorBlendMode,
    this.imgFit,
    this.imgCenterSlice,
    this.imgHeaders,
    this.imgCacheWidth,
    this.imgCacheHeight,
  });

  @override
  State<NetImgCarousel> createState() => _NetImgCarouselState();
}

class _NetImgCarouselState extends State<NetImgCarousel> {
  // The list of network images to be displayed.
  List<Widget> netImageWidgets = [];

  @override
  void initState() {
    super.initState();
    // Initialize the network image widgets.
    for (String imageUrl in widget.imageUrls) {
      netImageWidgets.add(
        Image.network(
          imageUrl,
          scale: widget.imgScale,
          frameBuilder: widget.imgFrameBuilder,
          loadingBuilder: widget.imgLoadingBuilder,
          errorBuilder: widget.imgErrorBuilder,
          semanticLabel: widget.imgSemanticLabel,
          excludeFromSemantics: widget.imgExcludeFromSemantics,
          width: widget.imgWidth,
          height: widget.imgHeight,
          color: widget.imgColor,
          opacity: widget.imgOpacity,
          colorBlendMode: widget.imgColorBlendMode,
          fit: widget.imgFit,
          alignment: widget.imgAlignment,
          repeat: widget.imgRepeat,
          centerSlice: widget.imgCenterSlice,
          matchTextDirection: widget.imgMatchTextDirection,
          gaplessPlayback: widget.imgGaplessPlayback,
          filterQuality: widget.imgFilterQuality,
          isAntiAlias: widget.imgIsAntiAlias,
          headers: widget.imgHeaders,
          cacheWidth: widget.imgCacheWidth,
          cacheHeight: widget.imgCacheHeight,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Carousel(
      netImageWidgets,
      height: widget.height,
      width: widget.width,
      useindicator: widget.useindicator,
      onUnitTapped: widget.onUnitTapped,
      onIndicatorTapped: widget.onIndicatorTapped,
      indicatorBuilder: widget.indicatorBuilder,
      indicatorColor: widget.indicatorColor,
      currentIndicatorColor: widget.currentIndicatorColor,
      indicatorWidth: widget.indicatorWidth,
      indicatorHeight: widget.indicatorHeight,
      indicatorMargin: widget.indicatorMargin,
      indicatorToBottom: widget.indicatorToBottom,
      indicatorShape: widget.indicatorShape,
      pageSnapping: widget.pageSnapping,
      padEnds: widget.padEnds,
      clipBehavior: widget.clipBehavior,
      reverse: widget.reverse,
      scrollDirection: widget.scrollDirection,
      controller: widget.controller,
      disableIndicatorDefaultCallbacks: widget.disableIndicatorDefaultCallbacks,
    );
  }
}
