import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:now_app/generated/l10n.dart';
import 'package:now_app/models/channels.dart';
import 'package:now_app/pages/channel/home.dart';
import 'package:now_app/routes.dart';
import 'package:now_app/theme/now_theme.dart';
import 'package:now_app/ui/now_ui.dart';

class ChannelPage extends StatefulWidget {
  @override
  _ChannelPageState createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    final NavigatorState navigator = Navigator.of(context);
    List<String> buttons = [s.following, s.popular, s.explore];

    Widget _buildHeader() {
      return Container(
        height: 120.px,
        width: double.infinity,
        alignment: Alignment.center,
        color: NowTheme.orange.shade600,
        child: HollowRoundedButtonGroup(buttons: buttons),
      );
    }

    Widget _buildChannels() {
      List<dynamic> jsonResponse = json.decode(channelsJson);
      List<ChannelModel> channels =
          jsonResponse.map((e) => ChannelModel.fromJson(e)).toList();
      List<Widget> children = channels.map((ChannelModel e) {
        return GestureDetector(
          onTap: () => navigator.push(
              Routers.fadePageRouteBuilder(ChannelHomePage.routerName, e)),
          child: Hero(
            tag: e.channel,
            child: ChannelCard(
              background: e.coverImage,
              title: e.channel,
              foot: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 30.px, horizontal: 30.px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Material(
                      type: MaterialType.transparency,
                      child: Text(
                        "${e.followersCount} Followers",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SpacedRow(
                      space: 8.px,
                      children: e.headFollowers
                          .map((e) => CircleAvatar(
                                radius: 14.px,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(e.avatar),
                              ))
                          .toList(),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList();

      return Expanded(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          shrinkWrap: true,
          children: children,
        ),
      );
    }

    return Column(
      children: [
        _buildHeader(),
        _buildChannels(),
      ],
    );
  }
}
