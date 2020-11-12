import 'package:flutter/material.dart';
import 'package:now_app/generated/l10n.dart';
import 'package:now_app/pages/channel/channel.dart';
import 'package:now_app/pages/overview.dart';
import 'package:now_app/pages/topic/topic.dart';
import 'package:now_app/ui/now_ui.dart';

class MenusModel {
  static double _defaultIconSize = 20.0.px;

  final String assetName;
  final String title;
  final double iconSize;
  final Widget page;

  MenusModel({
    @required this.assetName,
    @required this.title,
    @required this.page,
    double iconSize,
  }) : iconSize = iconSize ?? _defaultIconSize;

  static List<MenusModel> getMenus(S s) {
    return <MenusModel>[
      MenusModel(
        assetName: "assets/images/list.svg",
        title: s.newest.toUpperCase(),
        page: TopicPage(),
        iconSize: 18.px,
      ),
      MenusModel(
        assetName: "assets/images/channel.svg",
        title: s.channels.toUpperCase(),
        page: ChannelPage(),
      ),
      MenusModel(
        assetName: "assets/images/bookmark.svg",
        title: s.bookmarks.toUpperCase(),
        page: Container(),
      ),
      MenusModel(
        assetName: "assets/images/overview.svg",
        title: s.overview.toUpperCase(),
        page: OverviewPage(),
        iconSize: 22.px,
      ),
      MenusModel(
        assetName: "assets/images/calendar.svg",
        title: s.calendar.toUpperCase(),
        page: Container(),
      ),
      MenusModel(
        assetName: "assets/images/timeline.svg",
        title: s.timeline.toUpperCase(),
        page: Container(),
        iconSize: 22.px,
      ),
      MenusModel(
        assetName: "assets/images/profile.svg",
        title: s.profile.toUpperCase(),
        page: Container(),
        iconSize: 22.px,
      ),
      MenusModel(
        assetName: "assets/images/widget.svg",
        title: s.widget.toUpperCase(),
        page: Container(),
        iconSize: 24.px,
      ),
      MenusModel(
        assetName: "assets/images/setting.svg",
        title: s.setting.toUpperCase(),
        page: Container(),
      ),
    ];
  }
}
