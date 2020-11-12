import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:now_app/generated/l10n.dart';
import 'package:now_app/models/channels.dart';
import 'package:now_app/models/menus.dart';
import 'package:now_app/models/topics.dart';
import 'package:now_app/pages/topic/menu.dart';
import 'package:now_app/ui/now_ui.dart';

class ChannelHomePage extends StatelessWidget {
  static const routerName = "/channel/home";

  static const String avatarUrl =
      "http://himg.bdimg.com/sys/portrait/item/0660e585abe69c88e7acace4ba94e5a4a9913d.jpg";

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
    final S s = S.of(context);
    final ModalRoute route = ModalRoute.of(context);
    List<MenusModel> menus = MenusModel.getMenus(s);
    final ChannelModel arguments = route.settings.arguments;
    List<dynamic> jsonResponse = json.decode(data);
    List<TopicModel> topics =
        jsonResponse.map((item) => TopicModel.fromJson(item)).toList();

    Widget _buildHeader() {
      return Container(
        height: 430.px,
        child: Hero(
          tag: arguments.channel,
          child: ChannelCard(
            background: arguments.coverImage,
            title: arguments.channel,
            foot: Padding(
              padding: EdgeInsets.only(bottom: 28.px),
              child: SpacedColumn(
                space: 15.px,
                children: [
                  Material(
                    type: MaterialType.transparency,
                    child: Text(
                      "${arguments.followersCount} Followers",
                      style: TextStyle(
                        fontSize: 12.px,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SpacedRow(
                    space: 10.px,
                    children: arguments.headFollowers
                        .map((e) => CircleAvatar(
                              radius: 12.px,
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
    }

    Widget _buildEachRow(Widget left, Widget right) {
      if (left == null) {
        left = Container(
          height: 530.px,
          width: 384.px,
        );
      }
      if (right == null) {
        right = Container(
          height: 530.px,
          width: 384.px,
        );
      }
      return Row(
        children: [left, right],
      );
    }

    Widget _buildCardFoot(TopicModel topic, Color textColor, Color iconColor) {
      return SpaceBetweenCardFoot(
        actionSpace: 10.0.px,
        startActions: [
          SvgIconText(
            assetName: "assets/images/announce.svg",
            text: topic.author,
            iconColor: iconColor,
            textStyle: TextStyle(color: textColor),
          ),
        ],
        endActions: [
          SvgIconText(
            assetName: "assets/images/time.svg",
            text: topic.createTime,
            iconColor: iconColor,
            textStyle: TextStyle(color: textColor),
          ),
        ],
      );
    }

    Widget _buildOddTopic(TopicModel topic) {
      return ArrowImageCard.down(
        width: 384.px,
        height: 530.px,
        title: topic.title,
        arrowSize: 10.px,
        image: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Image.asset(
            topic.coverImage,
          ),
        ),
        infoCardPadding: EdgeInsets.symmetric(horizontal: 36.px),
        titlePadding: EdgeInsets.symmetric(vertical: 58.px),
        foot: _buildCardFoot(topic, Colors.black, Colors.black54),
      );
    }

    Widget _buildEvenTopic(TopicModel topic) {
      return ArrowImageCard.up(
        width: 384.px,
        height: 530.px,
        title: topic.title,
        arrowSize: 10.px,
        image: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Image.asset(
            topic.coverImage,
            fit: BoxFit.cover,
          ),
        ),
        infoCardPadding: EdgeInsets.symmetric(horizontal: 36.px),
        titlePadding: EdgeInsets.symmetric(vertical: 58.px),
        foot: _buildCardFoot(topic, Colors.black, Colors.black54),
      );
    }

    Widget _buildEachTopic(int index, TopicModel topic) {
      if (index % 2 == 0) {
        return _buildEvenTopic(topic);
      }

      return _buildOddTopic(topic);
    }

    Widget _buildContent() {
      List<Widget> topicCards = topics
          .asMap()
          .keys
          .map((index) => _buildEachTopic(index, topics[index]))
          .toList();
      int topicsCount = topicCards.length;
      int rowsCount = (topicsCount / 2).ceil();
      List<Widget> rows = [];
      Widget row;
      rows.add(_buildHeader());
      for (var i = 0; i < rowsCount; i += 2) {
        row = _buildEachRow(topicCards[i] ?? null, topicCards[i + 1] ?? null);
        rows.add(row);
      }

      return Expanded(
        child: ListView.builder(
          itemBuilder: (context, index) => rows[index],
          itemCount: rows.length,
        ),
      );
    }

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
          BarIconButton.svgAsset(
            "assets/images/deep_setting.svg",
            onPressed: null,
          ),
          BarIconButton.svgAsset("assets/images/search.svg", onPressed: null),
          BarIconButton(
            icon: CircleAvatar(backgroundImage: NetworkImage(avatarUrl)),
            onPressed: null,
            iconSize: 28.0.px,
          ),
        ],
      ),
      drawer: MenuPage(menus: menus),
      body: Column(
        children: [
          _buildContent(),
        ],
      ),
    );
  }
}
