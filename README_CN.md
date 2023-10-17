# awesome_carousel

一款旨在提供各种轮播组件的 Flutter 插件。

## 作者信息

- **作者**：[李俊才](https://blog.csdn.net/qq_28550263?spm=1011.2415.3001.5343)
- **邮箱**：[291148484@163.com](291148484@163.com)
- **协议**：[MIT](http://thispage.tech:9680/jclee1995/flutter_money_display/-/blob/master/LICENSE)
- 项目仓库：[http://thispage.tech:9680/jclee1995/flutter_money_display](http://thispage.tech:9680/jclee1995/flutter_money_display.git)
- English Document: [https://github.com/jacklee1995/flutter-carousels/blob/master/README.md](https://github.com/jacklee1995/flutter-carousels/blob/master/README.md)

## 开始

本模块提供的 Carousel 组件十分容易实现多种需求场景下的轮播功能，开发者可以定制轮播相关效果和轮播进度指示器。

下面是两个使用 Carousel 组件默认的轮播进度指示器的例子：

```dart
import 'package:awesome_carousel/carousels.dart';
import 'package:flutter/material.dart';

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

```

其效果如下：

![1697452585612](./image/README_CN/1697452585612.gif)

为了实现更加复杂的功能，需要定义更多的参数，以及使用轮播控制器。下面是一个自定义轮播进度指示器样式，并使用网络图片作为轮播单元的例子。

```dart
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
```

其效果如下：

![1697453153655](./image/README_CN/1697453153655.gif)

可以看到，由于可以完全自定义轮播指示器和轮播项，只要你拥有足够丰富的想象力，可以包装出一些复杂但精致的轮播。例如在电商场景下，第一个轮播单元是商品的介绍视频，对应的轮播指示器是视频的进度条，而后续的轮播单元仅仅是轮播图片。比如：

![1697454139296](./image/README_CN/1697454139296.jpg)

这可以很容易地使用相应地视频播放器模块与本模块集成实现。

### 网络轮播图

网络轮播图是一种特殊但周期网络应用普及的今天十分普片的轮播图，通过包装通用轮播图 `Carousel` 类，从而得到了 `NetImgCarousel` 类。你可以提供一组网络图片的 URL 来加载为网络轮播图，并且可以指定与图片和网络相关的所有参数。

以下是一个使用 NetImgCarousel 类的例子。

```dart
import 'package:flutter/material.dart';
import 'package:awesome_carousel/carousels.dart' show NetImgCarousel;

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
          // 轮播单元回调事件
          print('Tapped on unit $index');
        },
        onIndicatorTapped: (index) {
          // 轮播指示器回调事件
          print('Tapped on indicator $index');
        },
      ),
    );
  }
}
```

其效果如下：

![Alt text](./WeChat_IxjFbKajq3.gif)

下面的表格描述了`NetImgCarousel`构造函数的参数：

| 参数名                             | 类型                        | 默认值                 | 描述                                        |
| ---------------------------------- | --------------------------- | ---------------------- | ------------------------------------------- |
| `imageUrls`                        | `List<String>`              |                        | 要在轮播中显示的网络图片URL列表             |
| `height`                           | `double`                    | `400.0`                | 轮播组件的高度                              |
| `width`                            | `double`                    | `0.0`                  | 轮播组件的宽度                              |
| `useindicator`                     | `bool`                      | `true`                 | 是否使用指示器，默认为 `true`               |
| `onUnitTapped`                     | `FunctionWithAInt?`         |                        | 当轮播单元被点击时的回调函数，可选          |
| `onIndicatorTapped`                | `FunctionWithAInt?`         |                        | 当指示器被点击时的回调函数，可选            |
| `indicatorBuilder`                 | `FunctionIndicatorBuilder?` |                        | 自定义指示器构建函数，可选                  |
| `indicatorColor`                   | `Color`                     | `Colors.white`         | 默认指示器颜色                              |
| `currentIndicatorColor`            | `Color`                     | `Colors.blue`          | 当前选中指示器的颜色                        |
| `indicatorWidth`                   | `double`                    | `40.0`                 | 指示器宽度                                  |
| `indicatorHeight`                  | `double`                    | `26.0`                 | 指示器高度                                  |
| `indicatorMargin`                  | `double`                    | `3.0`                  | 指示器之间的间距                            |
| `indicatorToBottom`                | `double`                    | `10.0`                 | 指示器距离底部的距离                        |
| `indicatorShape`                   | `BoxShape`                  | `BoxShape.rectangle`   | 默认指示器形状                              |
| `pageSnapping`                     | `bool`                      | `true`                 | 是否启用页面快速吸附，默认为 `true`。       |
| `padEnds`                          | `bool`                      | `true`                 | 是否在轮播首尾添加额外的页面，默认为 `true` |
| `clipBehavior`                     | `Clip`                      | `Clip.hardEdge`        | 剪裁的行为                                  |
| `reverse`                          | `bool`                      | `false`                | 是否倒序项目的顺序                          |
| `scrollDirection`                  | `Axis`                      | `Axis.horizontal`      | 页面视图滚动的轴                            |
| `controller`                       | `CarouselController?`       |                        | 轮播控制器，可选                            |
| `disableIndicatorDefaultCallbacks` | `bool`                      | `false`                | 是否禁用默认指示器回调函数                  |
| `imgScale`                         | `double`                    | `1.0`                  | 图片缩放因子，默认为 `1.0`                  |
| `imgFrameBuilder`                  | `ImageFrameBuilder?`        |                        | 图片帧的构建器，可选                        |
| `imgLoadingBuilder`                | `ImageLoadingBuilder?`      |                        | 图片加载的构建器，可选                      |
| `imgErrorBuilder`                  | `ImageErrorWidgetBuilder?`  |                        | 图片错误小部件的构建器，可选                |
| `imgExcludeFromSemantics`          | `bool`                      | `false`                | 是否排除图像从语义中，默认为 `false`        |
| `imgSemanticLabel`                 | `String?`                   |                        | 图像的语义标签，可选                        |
| `imgWidth`                         | `double?`                   |                        | 图像的宽度，可选                            |
| `imgHeight`                        | `double?`                   |                        | 图像的高度，可选                            |
| `imgColor`                         | `Color?`                    |                        | 图像的颜色，可选                            |
| `imgOpacity`                       | `Animation<double>?`        |                        | 图像的不透明度，可选                        |
| `imgColorBlendMode`                | `BlendMode?`                |                        | 图像颜色的混合模式，可选                    |
| `imgFit`                           | `BoxFit?`                   |                        | 图像的适应方式，可选                        |
| `imgCenterSlice`                   | `Rect?`                     |                        | 图像的中心切片，可选                        |
| `imgAlignment`                     | `AlignmentGeometry`         | `Alignment.center`     | 图像的对齐方式，可选                        |
| `imgRepeat`                        | `ImageRepeat`               | `ImageRepeat.noRepeat` | 图像的重复模式，可选                        |
| `imgMatchTextDirection`            | `bool`                      | `false`                | 图像是否匹配文本方向，可选                  |
| `imgGaplessPlayback`               | `bool`                      | `false`                | 是否启用无缝播放图像，可选                  |
| `imgFilterQuality`                 | `FilterQuality`             | `FilterQuality.low`    | 图像的滤镜质量，可选                        |
| `imgIsAntiAlias`                   | `bool`                      | `false`                | 图像是否反锯齿，可选                        |
| `imgHeaders`                       | `Map<String, String>?`      |                        | 获取图像时的网络请求头，可选。              |
| `imgCacheWidth`                    | `int?`                      |                        | 图像应该缓存到的宽度，可选                  |
| `imgCacheHeight`                   | `int?`                      |                        | 图像应该缓存到的高度，可选                  |

### 本地轮播图

> 于 v1.0.0+1 添加。

本地资源图片轮播也是一个很常见的轮播类型。在Flutter中，你需要先配置 pubspec.yaml 文件的 assets 选项，以确保你的图片能够正常地被加载进来。

一个简单的例子如下：

```dart
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
```

代码的运行效果如下：

![Alt text](./WeChat_wLFeQijQol.gif)

下面的表格描述了`AssetImgCarousel`构造函数的参数：


| 参数名称                         | 参数类型                  | 描述                                       |
| -------------------------------- | ------------------------- | ------------------------------------------ |
| assetImagePaths                  | List<String>              | 用于轮播的asset图片文件路径列表。          |
| height                           | double                    | 轮播组件的高度。                           |
| width                            | double                    | 轮播组件的宽度。                           |
| useindicator                     | bool                      | 是否使用指示器，默认为true。               |
| onUnitTapped                     | FunctionWithAInt?         | 当轮播单元被点击时的回调函数，可选。       |
| onIndicatorTapped                | FunctionWithAInt?         | 当指示器被点击时的回调函数，可选。         |
| indicatorBuilder                 | FunctionIndicatorBuilder? | 自定义指示器构建函数，可选。               |
| indicatorColor                   | Color                     | 默认指示器颜色。                           |
| currentIndicatorColor            | Color                     | 当前选中指示器的颜色。                     |
| indicatorWidth                   | double                    | 指示器宽度。                               |
| indicatorHeight                  | double                    | 指示器高度。                               |
| indicatorMargin                  | double                    | 指示器之间的间距。                         |
| indicatorToBottom                | double                    | 指示器距离底部的距离。                     |
| indicatorShape                   | BoxShape                  | 默认指示器形状，默认为矩形。               |
| pageSnapping                     | bool                      | 是否启用页面快速吸附，默认为true。         |
| padEnds                          | bool                      | 是否在轮播首尾添加额外的页面，默认为true。 |
| clipBehavior                     | Clip                      | 剪裁的行为，默认为 Clip.hardEdge。         |
| reverse                          | bool                      | 是否倒序项目的顺序。                       |
| scrollDirection                  | Axis                      | 页面视图滚动的轴，默认为 Axis.horizontal。 |
| controller                       | CarouselController?       | 轮播控制器，可选。                         |
| disableIndicatorDefaultCallbacks | bool                      | 是否禁用默认指示器回调函数。               |
| imgScale                         | double                    | 图像缩放因子。                             |
| imgFrameBuilder                  | ImageFrameBuilder?        | 自定义图像帧构建器，可选。                 |
| imgExcludeFromSemantics          | bool                      | 图像是否应排除在语义中，默认为false。      |
| imgAlignment                     | AlignmentGeometry         | 图像在其框内的对齐方式。                   |
| imgRepeat                        | ImageRepeat               | 图像如何重复。                             |
| imgMatchTextDirection            | bool                      | 图像是否应与文本方向匹配。                 |
| imgGaplessPlayback               | bool                      | 是否启用无间隙播放图像，默认为false。      |
| imgFilterQuality                 | FilterQuality             | 图像的滤镜质量，默认为 FilterQuality.low。 |
| imgIsAntiAlias                   | bool                      | 图像是否应抗锯齿。                         |
| imgErrorBuilder                  | ImageErrorWidgetBuilder?  | 自定义图像错误小部件构建器，可选。         |
| imgSemanticLabel                 | String?                   | 图像的语义标签，可选。                     |
| imgWidth                         | double?                   | 图像的宽度，可选。                         |
| imgHeight                        | double?                   | 图像的高度，可选。                         |
| imgColor                         | Color?                    | 应用于图像的颜色，可选。                   |
| imgOpacity                       | Animation<double>?        | 图像的不透明度，可选。                     |
| imgColorBlendMode                | BlendMode?                | 应用于图像的混合模式，可选。               |
| imgFit                           | BoxFit?                   | 图像在其框内的适应方式，可选。             |
| imgCenterSlice                   | Rect?                     | 图像的中心切片，可选。                     |
| imgHeaders                       | Map<String, String>?      | 用于网络图像请求的标头，可选。             |
| imgCacheWidth                    | int?                      | 图像缓存的最大宽度，可选。                 |
| imgCacheHeight                   | int?                      | 图像缓存的最大高度，可选。                 |
| imgPackage                       | String?                   | 图像的包名称，可选。                       |


## API

### CarouselController 类

`CarouselController` 类是一个用于管理轮播图控制的类。它包含了多个方法，用于控制轮播图的跳转、动画效果和状态通知。

#### 构造函数

```dart
CarouselController(
  int total, {
  int initialPage = 0,
  bool keepPage = true,
  double viewportFraction = 1.0,
  Curve curve = Curves.ease,
  Duration duration = const Duration(milliseconds: 300),
})
```

##### 参数

- `total` (int): 表示轮播的总页面数量。
- `initialPage` (int): 表示初始页面索引，默认为0。
- `keepPage` (bool): 表示是否保持页面，即在翻页后是否保存页面状态，默认为 `true`。
- `viewportFraction` (double): 表示可视视口占整个页面宽度的比例，默认为 1.0。
- `curve` (Curve): 页面切换动画曲线，默认为 `Curves.ease`。
- `duration` (Duration): 页面切换动画播放时间，默认为 `Duration(milliseconds: 300)`。

#### 方法

##### `goToPage(int page)`

此方法用于通过自定义方法滚动轮播到指定的页面。

- `page` (int): 要跳转到的页面的索引。

##### `toFirstPage()`

此方法用于通过自定义方法将轮播滚动到第一个页面。

##### `toPreviousPage()`

此方法用于通过自定义方法将轮播滚动到上一页。如果当前已经是第一页，则会跳转到最后一页。

##### `toNextPage()`

此方法用于通过自定义方法将轮播滚动到下一页。如果当前已经是最后一页，则会跳转到第一页。

##### `toLastPage()`

此方法用于通过自定义方法将轮播滚动到最后一页。

#### 属性

#### `currentPage`

- 类型: int
- 描述: 获取或设置当前轮播的页面索引。通过获取 `currentPage` 属性，可以获得当前页面的索引，通过设置 `currentPage` 属性，可以跳转到指定的页面。

### 示例

```dart
final controller = CarouselController(3);

// 获取当前页面索引
int current = controller.currentPage;

// 将轮播滚动到第二页
controller.goToPage(1);

// 将轮播滚动到下一页
controller.toNextPage();
```

## Carousel 类

`Carousel` 类是一个通用的轮播组件，它允许您在Flutter应用程序中创建各种类型的轮播图。您可以配置轮播图的外观、轮播控制和回调函数。

### 构造函数

```dart
Carousel(
  List<Widget> units, {
  Key? key,
  double height = 400.0,
  double width = 0.0,
  FunctionWithAInt? onUnitTapped,
  FunctionWithAInt? onIndicatorTapped,
  bool useindicator = true,
  Color indicatorColor = Colors.white,
  Color currentIndicatorColor = Colors.blue,
  double indicatorWidth = 40.0,
  double indicatorHeight = 26.0,
  double indicatorMargin = 3.0,
  double indicatorToBottom = 10.0,
  BoxShape indicatorShape = BoxShape.rectangle,
  FunctionIndicatorBuilder? indicatorBuilder,
  bool pageSnapping = true,
  bool padEnds = true,
  Clip clipBehavior = Clip.hardEdge,
  bool reverse = false,
  Axis scrollDirection = Axis.horizontal,
  CarouselController? controller,
})
```

#### 参数

- `units` (List\<Widget>): 要轮播的组件列表。
- `key` (Key?): 可选参数，用于在小部件树中标识小部件。
- `height` (double): 轮播组件的高度，默认为 400.0。
- `width` (double): 轮播组件的宽度，默认为 0.0（自动适应屏幕宽度）。
- `onUnitTapped` (FunctionWithAInt?): 当轮播单元被点击时触发的回调函数，可选，接收一个整数参数，表示被点击的单元索引。
- `onIndicatorTapped` (FunctionWithAInt?): 当指示器被点击时触发的回调函数，可选，接收一个整数参数，表示被点击的指示器索引。
- `useindicator` (bool): 控制是否显示轮播图下方的指示器，默认为 `true`。
- `indicatorColor` (Color): 指示器的默认颜色，默认为白色。
- `currentIndicatorColor` (Color): 当前选中指示器的颜色，默认为蓝色。
- `indicatorWidth` (double): 每个指示器的宽度，默认为 40.0。
- `indicatorHeight` (double): 每个指示器的高度，默认为 26.0。
- `indicatorMargin` (double): 指示器之间的水平间距，默认为 3.0。
- `indicatorToBottom` (double): 指示器距离底部的距离，默认为 10.0。
- `indicatorShape` (BoxShape): 指示器的形状，可以是 `BoxShape.rectangle` 或 `BoxShape.circle`，默认为 `BoxShape.rectangle`。
- `indicatorBuilder` (FunctionIndicatorBuilder?): 自定义指示器构建函数，可选，用于创建指示器的自定义外观。
- `pageSnapping` (bool): 是否启用页面快速吸附，默认为 `true`。
- `padEnds` (bool): 是否在轮播首尾添加额外的页面，默认为 `true`。
- `clipBehavior` (Clip): 指示如何剪切轮播单元的内容，默认为 `Clip.hardEdge`。
- `reverse` (bool): 是否以反向顺序滚动轮播单元，默认为 `false`。
- `scrollDirection` (Axis): 轮播单元滚动方向，可以是 `Axis.horizontal` 或 `Axis.vertical`，默认为 `Axis.horizontal`。
- `controller` (CarouselController?): 轮播控制器，可选，用于控制轮播的行为和状态。
- `disableIndicatorDefaultCallbacks` (bool): 是否禁用默认指示器回调函数，默认为 `false`。当为 `true` 时，不执行默认的指示器点击事件。

### 示例

```dart
Carousel(
  [
    Image.network('https://example.com/image1.jpg'),
    Image.network('https://example.com/image2.jpg'),
    Image.network('https://example.com/image3.jpg'),
  ],
  height: 300.0,
  onUnitTapped: (int index) {
    print('点击了第 $index 个轮播单元');
  },
  indicatorColor: Colors.red,
  currentIndicatorColor: Colors.green,
),
```

### NetImgCarousel

> 于 v1.0.0+1 添加。

见上面文档描述。


### AssetImgCarousel

> 于 v1.0.0+1 添加。

见上面文档描述。

