import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:now_app/generated/l10n.dart';
import 'package:now_app/models/overviews.dart';
import 'package:now_app/theme/now_theme.dart';
import 'package:now_app/ui/now_ui.dart';

class OverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final S s = S.of(context);
    final ThemeData theme = Theme.of(context);
    final List<String> buttons = [s.week, s.month, s.year];

    Widget _buildHeader() {
      return Container(
        alignment: Alignment.center,
        child: SpacedColumn(
          space: 60.px,
          children: [
            Text(
              s.theMost,
              style: theme.textTheme.headline5,
            ),
            HollowRoundedButtonGroup(buttons: buttons),
          ],
        ),
      );
    }

    Widget _buildCountInfo(String count, String typeName) {
      return SpacedColumn(
        space: 5.px,
        children: [
          Text(
            count,
            style: theme.textTheme.headline4.copyWith(
              fontSize: 34.px,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          Text(
            typeName,
            style: theme.textTheme.bodyText2.copyWith(
              fontSize: 10.px,
              fontWeight: FontWeight.w500,
              color: Colors.white.withOpacity(.6),
            ),
          ),
        ],
      );
    }

    Widget _buildSwipe() {
      List<dynamic> jsonResponse = json.decode(overviewJson);
      List<OverviewModel> models =
          jsonResponse.map((e) => OverviewModel.fromJson(e)).toList();
      List<Widget> items = [];
      List<Widget> itemsExtend = [];
      models.forEach((e) {
        items.add(ChannelCard(
          title: e.title,
          background: e.coverImage,
          isShowFollow: false,
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 140.px),
          foot: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                e.proportion.toString(),
                style: TextStyle(
                  fontSize: 180.px,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.withOpacity(.4),
                  height: 0,
                ),
              ),
              Text(
                "%",
                style: TextStyle(
                  fontSize: 40.px,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.withOpacity(.4),
                  height: 0,
                ),
              ),
            ],
          ),
        ));
        itemsExtend.add(Padding(
          padding: EdgeInsets.only(top: 30.px),
          child: SpacedRow(
            space: 70.px,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCountInfo(e.articlesCount, s.articles),
              _buildCountInfo(e.followersCount, s.followers),
            ],
          ),
        ));
      });

      return Swipe(
        items: items,
        itemsExtend: itemsExtend,
      );
    }

    return Container(
      height: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 50.px),
      color: NowTheme.orange.shade600,
      child: SpacedColumn(
        space: 100.px,
        children: [
          _buildHeader(),
          _buildSwipe(),
        ],
      ),
    );
  }
}
