import 'package:flutter/material.dart';
import 'package:now_app/generated/l10n.dart';
import 'package:now_app/models/menus.dart';
import 'package:now_app/pages/channel/channel.dart';
import 'package:now_app/pages/topic/menu.dart';
import 'package:now_app/pages/topic/topic.dart';
import 'package:now_app/providers/menu.dart';
import 'package:now_app/ui/now_ui.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const String routerName = "/home";

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  static const String avatarUrl =
      "http://himg.bdimg.com/sys/portrait/item/0660e585abe69c88e7acace4ba94e5a4a9913d.jpg";

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
    final S s = S.of(context);

    final List<MenusModel> menus = [
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
        page: Container(),
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

    final menuPages = menus.map((e) => e.page).toList();

    return Scaffold(
      key: key,
      appBar: TopBar(
        leaders: [
          BarIconButton.svgAsset(
            "assets/images/menu.svg",
            onPressed: () => key.currentState.openDrawer(),
          ),
        ],
        actions: [
          BarIconButton.svgAsset("assets/images/search.svg", onPressed: null),
          BarIconButton(
            icon: CircleAvatar(backgroundImage: NetworkImage(avatarUrl)),
            onPressed: null,
            iconSize: 28.0.px,
          ),
        ],
      ),
      drawer: MenuPage(menus: menus),
      body: Consumer<MenuProvider>(
        builder: (context, MenuProvider provider, child) {
          return IndexedStack(
            index: provider.index,
            children: menuPages,
          );
        },
      ),
    );
  }
}
