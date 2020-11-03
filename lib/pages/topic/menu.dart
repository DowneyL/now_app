import 'package:flutter/material.dart';
import 'package:now_app/generated/l10n.dart';
import 'package:now_app/ui/now_ui.dart';

class MenuPage extends StatelessWidget {
  static const String avatarUrl =
      "http://himg.bdimg.com/sys/portrait/item/0660e585abe69c88e7acace4ba94e5a4a9913d.jpg";

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final NavigatorState navigator = Navigator.of(context);
    final S s = S.of(context);

    Widget _buildEachMenu(
        String assetName, String text, GestureTapCallback tapCallback,
        {double iconSize}) {
      iconSize = iconSize ?? 20.0.px;
      return FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: tapCallback,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.px, horizontal: 40.px),
          child: Container(
            width: double.infinity,
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: SvgPicture.asset(
                    assetName,
                    height: iconSize,
                    width: iconSize,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    text,
                    style: theme.textTheme.bodyText2
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                )
              ],
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
            s.newest.toUpperCase(),
            () => print("1"),
            iconSize: 18.0.px,
          ),
          _buildEachMenu(
            "assets/images/channel.svg",
            s.channels.toUpperCase(),
            () => navigator.pushNamed("/channel"),
          ),
          _buildEachMenu(
            "assets/images/bookmark.svg",
            s.bookmarks.toUpperCase(),
            () => print("3"),
          ),
          _buildEachMenu(
            "assets/images/overview.svg",
            s.overview.toUpperCase(),
            () => print("4"),
            iconSize: 22.0.px,
          ),
          _buildEachMenu(
            "assets/images/calendar.svg",
            s.calendar.toUpperCase(),
            () => print("5"),
          ),
          _buildEachMenu(
            "assets/images/timeline.svg",
            s.timeline.toUpperCase(),
            () => print("6"),
            iconSize: 22.0.px,
          ),
          _buildEachMenu(
            "assets/images/profile.svg",
            s.profile.toUpperCase(),
            () => print("7"),
            iconSize: 22.px,
          ),
          _buildEachMenu(
            "assets/images/widget.svg",
            s.widget.toUpperCase(),
            () => print("8"),
            iconSize: 24.0.px,
          ),
          _buildEachMenu(
            "assets/images/setting.svg",
            s.setting.toUpperCase(),
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
              GestureDetector(
                onTap: () {
                  navigator.pop(context);
                  navigator.pushNamed("/login");
                },
                child: SpacedColumn(
                  space: 2.px,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      s.logout.toUpperCase(),
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
