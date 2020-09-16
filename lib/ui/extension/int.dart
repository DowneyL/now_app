import "../screen.dart";

extension IntFit on int {
  double get rpx {
    return this.toDouble() * Screen.rpx;
  }

  double get px {
    return this.toDouble() * Screen.px;
  }
}
