import 'package:flutter/material.dart';
import 'package:now_app/ui/now_ui.dart';

class ChannelPage extends StatelessWidget {
  static const String routerName = "/channel";
  static const String avatarUrl =
      "http://himg.bdimg.com/sys/portrait/item/0660e585abe69c88e7acace4ba94e5a4a9913d.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        leaders: [
          BarIconButton.svgAsset("assets/images/menu.svg", onPressed: null),
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
      body: Container(),
    );
  }
}
