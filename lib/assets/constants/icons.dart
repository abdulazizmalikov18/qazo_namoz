import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static const settings = "assets/icons/settings.svg";
  static const search = "assets/icons/search.svg";
  static const logo = "assets/icons/logo.svg";
  static const uz = "assets/icons/uz.svg";
  static const google = "assets/icons/google.svg";
  static const fb = "assets/icons/fb.svg";
  static const questChat = "assets/icons/quest_chat.svg";
  static const calendar = "assets/icons/calendar.svg";
  static const settingBottom = "assets/icons/setting_bottom.svg";
  static const moon = "assets/icons/moon.svg";
  static const infoCircle = "assets/icons/info_circle.svg";
  static const home = "assets/icons/home.svg";
  static const focusTarget = "assets/icons/focus_target.svg";
  static const manMuslim = "assets/icons/man_muslim.svg";
  static const muslimParanja = "assets/icons/muslim_paranja.svg";
}

extension SvgExt on String {
  SvgPicture svg({
    Color? color,
    double? width,
    double? height,
  }) {
    return SvgPicture.asset(
      this,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
      width: width,
      height: height,
    );
  }
}
