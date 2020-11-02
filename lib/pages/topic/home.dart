import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:now_app/models/topics.dart';
import 'package:now_app/theme/now_theme.dart';
import 'package:now_app/ui/card.dart';
import 'package:now_app/ui/now_ui.dart';

class HomePage extends StatefulWidget {
  static const String routerName = "/home";

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  static const String avatarUrl =
      "http://himg.bdimg.com/sys/portrait/item/0660e585abe69c88e7acace4ba94e5a4a9913d.jpg";

  Widget _buildCardFoot(BuildContext context, TopicModel topic, Color textColor,
      Color iconColor) {
    return SpaceBetweenCardFoot(
      actionSpace: 10.0.px,
      startActions: [
        SvgIconText(
          assetName: "assets/images/announce.svg",
          text: topic.author,
          iconColor: iconColor,
          textColor: textColor,
        ),
        SvgIconText(
          assetName: "assets/images/time.svg",
          text: topic.createTime,
          iconColor: iconColor,
          textColor: textColor,
        ),
      ],
      endActions: [
        CustomUnderlineText(
          underlinePadding: EdgeInsets.symmetric(horizontal: 2.0.px),
          text: topic.category,
          space: 8.px,
          fontSize: 11.px,
          textColor: textColor,
        ),
      ],
    );
  }

  Widget _buildFirstTopic(BuildContext context, TopicModel topic) {
    return BackgroundImageCard(
      height: 430.px,
      padding: EdgeInsets.fromLTRB(50.0.px, 220.0.px, 50.0.px, 0.0.px),
      title: topic.title,
      background: topic.coverImage,
      foot: _buildCardFoot(context, topic, Colors.white, Colors.white70),
    );
  }

  Widget _buildEachTopic(
      BuildContext context, TopicModel topic, ArrowDirection arrowDirection) {
    return ArrowImageCard(
      height: 265.px,
      direction: arrowDirection,
      title: topic.title,
      infoCardPadding: EdgeInsets.symmetric(horizontal: 36.px),
      titlePadding: EdgeInsets.symmetric(vertical: 58.px),
      image: Image.asset(topic.coverImage),
      foot: _buildCardFoot(context, topic, Colors.black, Colors.black54),
    );
  }

  Widget _buildOddTopic(BuildContext context, TopicModel topic) {
    return _buildEachTopic(context, topic, ArrowDirection.right);
  }

  Widget _buildEvenTopic(BuildContext context, TopicModel topic) {
    return _buildEachTopic(context, topic, ArrowDirection.left);
  }

  Widget _buildTopic(BuildContext context, int index, TopicModel topic) {
    return index % 2 == 0
        ? _buildEvenTopic(context, topic)
        : _buildOddTopic(context, topic);
  }

  // TODO: 手势操作展示
  Widget _buildTopicActionButton(BuildContext context, TopicModel topic) {
    return SpacedColumn(
      space: 20.px,
      children: [
        FlatButton(
          onPressed: () => print(1),
          color: NowTheme.orange,
          shape: CircleBorder(),
          padding: EdgeInsets.all(14.px),
          child: SvgPicture.asset(
            "assets/images/comment.svg",
            height: 22.px,
          ),
        ),
        FlatButton(
          onPressed: () => print(2),
          color: NowTheme.orange,
          shape: CircleBorder(),
          padding: EdgeInsets.all(14.px),
          child: SvgPicture.asset(
            "assets/images/mark.svg",
            height: 22.px,
          ),
        ),
        FlatButton(
          onPressed: () => print(3),
          color: NowTheme.orange,
          shape: CircleBorder(),
          padding: EdgeInsets.all(14.px),
          child: SvgPicture.asset(
            "assets/images/share.svg",
            height: 18.px,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> jsonResponse = json.decode(data);
    List<TopicModel> topics =
        jsonResponse.map((item) => TopicModel.fromJson(item)).toList();

    Widget topicBuilder(BuildContext context, int index) {
      return index == 0
          ? _buildFirstTopic(context, topics[index])
          : _buildTopic(context, index, topics[index]);
    }

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
      body: Container(
        child: ListView.builder(
          itemCount: topics.length,
          itemBuilder: topicBuilder,
        ),
      ),
    );
  }
}
