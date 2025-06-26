enum DeviceType {
  mobile,
  tablet,
  desktop,
}

class ScreenUtils{
  static const double mobileMaxSize = 610;
  static const double tabletMaxSize = 1008;
  static const double desktopMaxSize = 1008;

  static DeviceType getDeviceType(double width){
    if (width < ScreenUtils.mobileMaxSize) {
      return DeviceType.mobile;
    } else if (width >= ScreenUtils.mobileMaxSize && width < ScreenUtils.tabletMaxSize) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }

  }
}