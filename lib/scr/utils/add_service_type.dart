import 'package:flutter/cupertino.dart';
class AddServiceType {
  Widget getServiceType(int serviceName) {
    if (serviceName == 1) {
      return Image.asset(
        "assets/images/instagram.png",
        height: 24,
        width: 24,
        fit: BoxFit.cover,
      );
    } else if (serviceName == 2) {
      return Image.asset(
        "assets/images/tiktok.png",
        height: 24,
        width: 24,
        fit: BoxFit.cover,
      );
    } else if (serviceName == 3) {
      return Image.asset(
        "assets/images/youtube.png",
        height: 24,
        width: 24,
        fit: BoxFit.cover,
      );
    } else if (serviceName == 4) {
      return Image.asset(
        "assets/images/twitter.png",
        height: 24,
        width: 24,
        fit: BoxFit.cover,
      );
    } else if (serviceName == 5) {
      return Image.asset(
        "assets/images/steam.png",
        height: 24,
        width: 24,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        "assets/images/facebook.png",
        height: 24,
        width: 24,
        fit: BoxFit.cover,
      );
    }
  }
}
