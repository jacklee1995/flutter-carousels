import 'package:flutter/material.dart';
import 'package:awesome_carousel/base/base.dart';
import 'package:awesome_carousel/base/controller.dart';
import 'package:awesome_carousel/types.dart';

/// 用于本地图片的轮播，是基于 Carousel 组件的包装
class AssetImgCarousel extends StatefulWidget {
  /// A list of asset image file paths to be displayed in the carousel.
  /// 用于在轮播中显示的 asset 图片文件路径列表
  final List<String> assetImagePaths;

  /// The height of the carousel component.
  /// 轮播组件的高度
  final double height;

  /// The width of the carousel component.
  /// 轮播组件的宽度
  final double width;

  /// Whether to use indicators. Defaults to true.
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

  /// Whether to add extra pages at the beginning and end of the carousel. Default is true.
  /// 是否在轮播首尾添加额外的页面，默认为true
  final bool padEnds;

  /// The behavior for clipping. Defaults to Clip.hardEdge.
  /// 剪裁的行为，默认为 Clip.hardEdge
  final Clip clipBehavior;

  /// Whether to reverse the order of items.
  /// 是否倒序项目的顺序
  final bool reverse;

  /// The axis along which the page view scrolls. Defaults to Axis.horizontal.
  /// 页面视图滚动的轴，默认为 Axis.horizontal
  final Axis scrollDirection;

  /// Carousel controller, optional.
  /// 轮播控制器，可选
  final CarouselController? controller;

  /// Whether to disable default indicator callback functions.
  /// 是否禁用默认指示器回调函数
  final bool disableIndicatorDefaultCallbacks;

  /// Image scale factor.
  /// 图像缩放因子
  final double imgScale;

  /// Custom image frame builder, optional.
  /// 自定义图像帧构建器，可选
  final ImageFrameBuilder? imgFrameBuilder;

  /// Custom image error widget builder, optional.
  /// 自定义图像错误小部件构建器，可选
  final ImageErrorWidgetBuilder? imgErrorBuilder;

  /// Whether the image should be excluded from semantics. Defaults to false.
  /// 图像是否应排除在语义中，默认为false
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

  /// Color applied to the image, optional.
  /// 应用于图像的颜色，可选
  final Color? imgColor;

  /// Opacity of the image, optional.
  /// 图像的不透明度，可选
  final Animation<double>? imgOpacity;

  /// Blend mode applied to the image, optional.
  /// 应用于图像的混合模式，可选
  final BlendMode? imgColorBlendMode;

  /// Fit of the image within its box, optional.
  /// 图像在其框内的适应方式，可选
  final BoxFit? imgFit;

  /// Alignment of the image within its box.
  /// 图像在其框内的对齐方式
  final AlignmentGeometry imgAlignment;

  /// How the image should repeat.
  /// 图像如何重复
  final ImageRepeat imgRepeat;

  /// Center slice of the image, optional.
  /// 图像的中心切片，可选
  final Rect? imgCenterSlice;

  /// Whether the image should match the text direction.
  /// 图像是否应与文本方向匹配
  final bool imgMatchTextDirection;

  /// Whether to enable gapless playback of the image. Defaults to false.
  /// 是否启用无间隙播放图像，默认为false
  final bool imgGaplessPlayback;

  /// Filter quality of the image. Defaults to FilterQuality.low.
  /// 图像的滤镜质量，默认为 FilterQuality.low
  final FilterQuality imgFilterQuality;

  /// Whether the image should be anti-aliased.
  /// 图像是否应抗锯齿
  final bool imgIsAntiAlias;

  /// Headers for network image requests, optional.
  /// 用于网络图像请求的标头，可选
  final Map<String, String>? imgHeaders;

  /// Maximum width for decoding the image cache, optional.
  /// 图像缓存的最大宽度，可选
  final int? imgCacheWidth;

  /// Maximum height for decoding the image cache, optional.
  /// 图像缓存的最大高度，可选
  final int? imgCacheHeight;

  /// Package name for the image, optional.
  /// 图像的包名称，可选
  final String? imgPackage;

  const AssetImgCarousel(
    this.assetImagePaths, {
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
    this.imgPackage,
  });

  @override
  State<AssetImgCarousel> createState() => _AssetImgCarouselState();
}

class _AssetImgCarouselState extends State<AssetImgCarousel> {
  List<Widget> assetImageWidgets = [];

  @override
  void initState() {
    super.initState();
    for (String assetImagePath in widget.assetImagePaths) {
      assetImageWidgets.add(
        Image.asset(
          assetImagePath,
          frameBuilder: widget.imgFrameBuilder,
          errorBuilder: widget.imgErrorBuilder,
          semanticLabel: widget.imgSemanticLabel,
          excludeFromSemantics: widget.imgExcludeFromSemantics,
          scale: widget.imgScale,
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
          isAntiAlias: widget.imgIsAntiAlias,
          package: widget.imgPackage,
          filterQuality: widget.imgFilterQuality,
          cacheWidth: widget.imgCacheWidth,
          cacheHeight: widget.imgCacheHeight,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Carousel(
      assetImageWidgets,
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
