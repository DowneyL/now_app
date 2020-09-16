import "../screen.dart";

extension IntFit on int {
  double get rpx {
    return this.toDouble() * Window.rpx;
  }

  double get px {
    return this.toDouble() * Window.px;
  }
}
