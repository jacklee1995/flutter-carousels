import 'package:flutter/material.dart';

/// 轮播控制器
class CarouselController extends ChangeNotifier {
  int _currentPage = 0;

  /// 轮播单元数量
  final int total;

  /// 页面动画曲线
  final Curve curve;

  /// 轮播动画播放时间
  final Duration duration;

  final PageController _pageController;

  /// 创建一个轮播控制器
  ///
  /// - [total] 表示轮播的总页面数量
  /// - [initialPage] 表示初始页面索引，默认为0
  /// - [keepPage] 表示是否保持页面，即在翻页后是否保存页面状态，默认为true
  /// - [viewportFraction] 表示可视视口占整个页面宽度的比例，默认为1.0
  CarouselController(
    this.total, {
    int initialPage = 0,
    bool keepPage = true,
    double viewportFraction = 1.0,
    this.curve = Curves.ease,
    this.duration = const Duration(milliseconds: 300),
  }) : _pageController = PageController(
          initialPage: initialPage,
          keepPage: keepPage,
          viewportFraction: viewportFraction,
        );

  get pageController => _pageController;

  /// 获取当前页面的素银
  int get currentPage => _currentPage;

  /// 轮播跳转到指定的页面
  ///
  /// - 当由于用户滑动页面引起的改变时调用此方法，
  ///  此时不需要再次滚动(因为已经由用户滚动过了)
  set currentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  /// 轮播跳转到指定的页面
  ///
  /// 用于通过自定义方法滚动轮播
  void goToPage(int page) {
    _currentPage = page;
    _pageController.animateToPage(
      page,
      duration: duration, // 动画持续时间
      curve: curve, // 动画曲线
    );
    notifyListeners();
  }

  /// 跳转到第一个轮播
  ///
  /// 用于通过自定义方法将轮播滚动到
  void toFirstPage() {
    goToPage(0);
  }

  /// 跳转到上一页
  void toPreviousPage() {
    if (_currentPage > 0) {
      goToPage(_currentPage - 1);
    } else {
      _currentPage = total - 1;
      goToPage(total - 1);
    }
    notifyListeners();
  }

  /// 跳转到下一页
  void toNextPage() {
    if (_currentPage < total - 1) {
      goToPage(_currentPage + 1);
    } else {
      goToPage(0);
    }
    notifyListeners();
  }

  ///跳转到最后一页
  void toLastPage() {
    goToPage(total - 1);
  }
}
