import 'package:flutter/material.dart';
import 'package:now_app/ui/card.dart';
import 'package:now_app/ui/now_ui.dart';

class MenuPage extends StatelessWidget {
  static const String avatarUrl =
      "http://himg.bdimg.com/sys/portrait/item/0660e585abe69c88e7acace4ba94e5a4a9913d.jpg";

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    Widget _buildEachMenu(
        String assetName, String text, GestureTapCallback tapCallback) {
      double size = assetName == "assets/images/list.svg" ? 18.px : 20.px;
      if (assetName == "assets/images/profile.svg" ||
          assetName == "assets/images/widget.svg") {
        size = 21.px;
      }
      return FlatButton(
        onPressed: tapCallback,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.px, horizontal: 40.px),
          child: Container(
            width: double.infinity,
            child: SvgIconText(
              space: 30.px,
              assetName: assetName,
              text: text,
              iconSize: size,
              iconColor: Colors.white,
              textStyle: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ),
      );
    }

    Widget _buildMenus() {
      return SpacedColumn(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEachMenu(
            "assets/images/list.svg",
            "NEWS",
            () => print("1"),
          ),
          _buildEachMenu(
            "assets/images/channel.svg",
            "CHANNELS",
            () => print("2"),
          ),
          _buildEachMenu(
            "assets/images/bookmark.svg",
            "BOOKMARKS",
            () => print("3"),
          ),
          _buildEachMenu(
            "assets/images/overview.svg",
            "OVERVIEW",
            () => print("4"),
          ),
          _buildEachMenu(
            "assets/images/calendar.svg",
            "CALENDAR",
            () => print("5"),
          ),
          _buildEachMenu(
            "assets/images/timeline.svg",
            "TIMELINE",
            () => print("6"),
          ),
          _buildEachMenu(
            "assets/images/profile.svg",
            "PROFILE",
            () => print("7"),
          ),
          _buildEachMenu(
            "assets/images/widget.svg",
            "WIDGETS",
            () => print("8"),
          ),
          _buildEachMenu(
            "assets/images/setting.svg",
            "SETTING",
            () => print("9"),
          ),
        ],
      );
    }

    Widget _buildUserInfo() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.px),
        child: Container(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey.withOpacity(.2))),
          ),
          padding: EdgeInsets.only(top: 20.px),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SpacedColumn(
                space: 2.px,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "LOG OUT",
                    style: theme.textTheme.bodyText2.copyWith(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.1,
                    ),
                  ),
                  Text(
                    "August 5th",
                    style: theme.textTheme.bodyText2.copyWith(
                      fontSize: 12.px,
                      color: Colors.white.withOpacity(.5),
                    ),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(avatarUrl),
                radius: 20.px,
              ),
            ],
          ),
        ),
      );
    }

    Widget _buildMenuContent() {
      return Padding(
        padding: EdgeInsets.only(top: 40.px, bottom: 30.px),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildMenus(),
            _buildUserInfo(),
          ],
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
        ),
        color: Colors.white,
      ),
      width: 330.px,
      child: Stack(children: [
        FrostedGlassMask(),
        _buildMenuContent(),
      ]),
    );
  }
}
