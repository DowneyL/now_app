import "dart:ui";

class Screen {
  static double screenWidth;
  static double screenHeight;
  static double rpx;
  static double px;

  static void init({double standardWidth = 1536}) {
    var dpr = window.devicePixelRatio;
    var screenSize = window.physicalSize / dpr;
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;
    print("screen width: {$screenWidth}");
    print("screen height: {$screenHeight}");
    print("device pixel ratio: {$dpr}");
    rpx = screenWidth / standardWidth;
    px = screenWidth / standardWidth * 2;
  }
}
