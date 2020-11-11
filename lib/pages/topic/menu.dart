import 'package:flutter/material.dart';
import 'package:now_app/generated/l10n.dart';
import 'package:now_app/models/menus.dart';
import 'package:now_app/providers/menu.dart';
import 'package:now_app/routes.dart';
import 'package:now_app/ui/now_ui.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatelessWidget {
  final bool isRoot;

  final List<MenusModel> menus;

  MenuPage({@required this.menus, this.isRoot = false});

  static const String avatarUrl =
      "http://himg.bdimg.com/sys/portrait/item/0660e585abe69c88e7acace4ba94e5a4a9913d.jpg";

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final NavigatorState navigator = Navigator.of(context);
    final S s = S.of(context);
    final MenuProvider menuProvider = Provider.of<MenuProvider>(context);

    Widget _buildEachMenu(int index, String assetName, String text,
        {double iconSize}) {
      iconSize = iconSize ?? 20.0.px;
      return FlatButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          navigator.pop(context);
          if (!isRoot) {
            navigator.push(Routers.fadePageRouteBuilder(
                navigator.widget.initialRoute, null));
          }
          menuProvider.index = index;
        },
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
          children: menus
              .asMap()
              .keys
              .map((index) => _buildEachMenu(
                    index,
                    menus[index].assetName,
                    menus[index].title,
                    iconSize: menus[index].iconSize,
                  ))
              .toList());
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
