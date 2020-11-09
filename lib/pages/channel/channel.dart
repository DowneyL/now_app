import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:now_app/generated/l10n.dart';
import 'package:now_app/models/channels.dart';
import 'package:now_app/theme/now_theme.dart';
import 'package:now_app/ui/now_ui.dart';

class ChannelPage extends StatefulWidget {
  @override
  _ChannelPageState createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  int selectedButtonIndex = 0;
  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    final ThemeData theme = Theme.of(context);
    List<String> buttons = [s.following, s.popular, s.explore];

    Widget _buildEachButton(int index) {
      Color borderSideColor;
      bool isSelected = (index == selectedButtonIndex);
      TextStyle textStyle = TextStyle(
        fontSize: 12.px,
        fontWeight: FontWeight.w600,
      );
      if (!isSelected) {
        textStyle = textStyle.copyWith(color: Colors.white.withOpacity(.6));
        borderSideColor = Colors.transparent;
      }
      return HollowRoundedButton(
        onPressed: () {
          setState(() {
            selectedButtonIndex = index;
          });
        },
        width: 60.px,
        text: buttons[index],
        textStyle: textStyle,
        padding: EdgeInsets.symmetric(
          horizontal: 26.px,
          vertical: 12.px,
        ),
        borderSideColor: borderSideColor,
      );
    }

    Widget _buildHeaderButtons() {
      return SpacedRow(
        space: 32.0.px,
        children: buttons.asMap().keys.map(_buildEachButton).toList(),
      );
    }

    Widget _buildHeader() {
      return Container(
        height: 120.px,
        width: double.infinity,
        alignment: Alignment.center,
        color: NowTheme.orange.shade600,
        child: _buildHeaderButtons(),
      );
    }

    Widget _buildChannels() {
      List<dynamic> jsonResponse = json.decode(channelsJson);
      List<ChannelModel> channels =
          jsonResponse.map((e) => ChannelModel.fromJson(e)).toList();
      List<Widget> children = channels.map((e) {
        return ChannelCard(
          background: e.coverImage,
          title: e.channel,
          foot: Padding(
            padding: EdgeInsets.symmetric(vertical: 30.px, horizontal: 30.px),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${e.follows} Followers",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
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
