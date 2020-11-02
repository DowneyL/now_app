import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:now_app/models/topics.dart';
import 'package:now_app/theme/now_theme.dart';
import 'package:now_app/ui/now_ui.dart';

enum ArrowDirection {
  right,
  left,
}

class HomePage extends StatefulWidget {
  static const String routerName = "/home";

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  static const String avatarUrl =
      "http://himg.bdimg.com/sys/portrait/item/0660e585abe69c88e7acace4ba94e5a4a9913d.jpg";

  Widget _buildFirstTopicBackground(BuildContext context, TopicModel topic) {
    return Container(
      height: 430.px,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(topic.coverImage),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildFirstTopicTitle(BuildContext context, TopicModel topic) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(right: 120.px),
      child: Text(
        topic.title,
        style: theme.textTheme.headline4.copyWith(
          color: Colors.white,
          height: 1.6,
          fontWeight: FontWeight.w700,
          fontSize: 40.px,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildTopicBottomInfo(BuildContext context, TopicModel topic,
      Color textColor, Color iconColor) {
    ThemeData theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SpacedRow(
          space: 10.px,
          children: [
            SpacedRow(
              space: 2.px,
              children: [
                SvgPicture.asset(
                  "assets/images/announce.svg",
                  height: 28.0.px,
                  color: iconColor,
                ),
                Text(
                  topic.author,
                  style: theme.textTheme.bodyText2.copyWith(
                    fontSize: 13.px,
                    color: textColor,
                  ),
                ),
              ],
            ),
            SpacedRow(
              space: 2.px,
              children: [
                SvgPicture.asset(
                  "assets/images/time.svg",
                  height: 28.0.px,
                  color: iconColor,
                ),
                Text(
                  topic.createTime,
                  style: theme.textTheme.bodyText2.copyWith(
                    fontSize: 13.px,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        IntrinsicWidth(
          child: SpacedColumn(
            space: 8.px,
            children: [
              Text(
                topic.category,
                style: theme.textTheme.bodyText2.copyWith(
                  fontSize: 11.px,
                  color: textColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.px),
                child: SizedBox(
                  child: Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildFirstTopic(BuildContext context, TopicModel topic) {
    return Stack(
      children: [
        _buildFirstTopicBackground(context, topic),
        Container(
          height: 430.px,
          child: Padding(
            padding: EdgeInsets.fromLTRB(50.0.px, 220.0.px, 50.0.px, 0.px),
            child: SpacedColumn(
              space: 30.px,
              children: [
                _buildFirstTopicTitle(context, topic),
                _buildTopicBottomInfo(
                  context,
                  topic,
                  Colors.white,
                  Colors.white70,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildEachTopic(
      BuildContext context, TopicModel topic, ArrowDirection arrowDirection) {
    ThemeData theme = Theme.of(context);

    Widget _buildImageCard(ArrowDirection arrowDirection) {
      Alignment alignment;
      SvgPicture arrow;
      Widget image;

      if (arrowDirection == ArrowDirection.right) {
        alignment = Alignment.centerLeft;
        arrow = SvgPicture.asset(
          "assets/images/arrow_right.svg",
          width: 18.px,
          height: 18.px,
        );
        image = Positioned(
          child: Align(alignment: alignment, child: arrow),
          left: -1,
        );
      } else {
        alignment = Alignment.centerRight;
        arrow = SvgPicture.asset(
          "assets/images/arrow_left.svg",
          width: 18.px,
          height: 18.px,
        );
        image = Positioned(
          child: Align(alignment: alignment, child: arrow),
          right: -1,
        );
      }

      return Expanded(
        flex: 5,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(topic.coverImage),
            image,
          ],
        ),
      );
    }

    Widget topicInfoCard = Expanded(
      flex: 5,
      child: Stack(
        children: [
          Container(color: Colors.white),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.px),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 58.px),
                  child: Text(
                    topic.title,
                    style: theme.textTheme.headline4.copyWith(
                      color: Colors.black,
                      fontSize: 22.px,
                      fontWeight: FontWeight.bold,
                      height: 1.6,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                _buildTopicBottomInfo(
                  context,
                  topic,
                  Colors.black,
                  Colors.black54,
                ),
              ],
            ),
          ),
        ],
      ),
    );

    List<Widget> children = arrowDirection == ArrowDirection.right
        ? [topicInfoCard, _buildImageCard(ArrowDirection.right)]
        : [_buildImageCard(ArrowDirection.left), topicInfoCard];

    return Container(
      height: 265.px,
      child: Flex(
        direction: Axis.horizontal,
        children: children,
      ),
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

  Widget _buildFloatingActionButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 100.px),
      child: SpacedColumn(
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
      ),
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
      backgroundColor: Color(0xFFF2F2F2),
      body: Container(
        child: ListView.builder(
          itemCount: topics.length,
          itemBuilder: topicBuilder,
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
