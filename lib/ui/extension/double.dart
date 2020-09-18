import '../screen.dart';

extension DoubleFit on double {
  double get rpx {
    return this * Window.rpx;
  }

  double get px {
    return this * Window.px;
  }
}
