import '../screen.dart';

extension DoubleFit on double {
  double get rpx {
    return this * Screen.rpx;
  }

  double get px {
    return this * Screen.px;
  }
}
