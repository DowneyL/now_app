import "dart:ui";

class Window {
  static double screenWidth;
  static double screenHeight;
  static double rpx;
  static double px;
  static Brightness brightness;

  static void init({double standardWidth = 1536}) {
    var dpr = window.devicePixelRatio;
    var screenSize = window.physicalSize / dpr;
    print("physical screen width: ${window.physicalSize.width}");
    print("physical screen height: ${window.physicalSize.height}");
    print("physical padding: ${window.padding}");
    print("physical view padding: ${window.viewPadding}");
    screenWidth = screenSize.width;
    screenHeight = screenSize.height;
    print("screen width: $screenWidth");
    print("screen height: $screenHeight");
    print("device pixel ratio: $dpr");
    rpx = screenWidth / standardWidth;
    px = screenWidth / standardWidth * 2;
    brightness = window.platformBrightness;
  }
}
