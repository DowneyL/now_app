import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:now_app/ui/now_ui.dart';

class Swipe extends StatefulWidget {
  final double _ratio = 0.8;

  final List<Widget> items;
  final List<Widget> itemsExtend;
  final double size;

  Swipe({
    Key key,
    this.items,
    this.itemsExtend,
    double size,
  })  : this.size = 400.px,
        super(key: key);

  @override
  _SwipeState createState() => _SwipeState();
}

class _SwipeState extends State<Swipe> {
  int itemIndex = 1;

  @override
  Widget build(BuildContext context) {
    final double mainSize = widget.size;
    final double subSize = widget.size * widget._ratio;
    final double xDistance = subSize - ((Window.screenWidth - mainSize) / 2);
    final double yDistance = subSize / 8;
    int itemCount = widget.items.length;

    Widget _getItem(int index) {
      if (index < 0 || index >= itemCount) {
        return Container();
      }

      return widget.items[index];
    }

    Widget _getItemExtend(int index) {
      if (index < 0 || index >= itemCount) {
        return Container();
      }

      return widget.itemsExtend[index];
    }

    Widget _buildSwipeContent() {
      return Container(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          overflow: Overflow.visible,
          children: [
            Positioned(
              left: -(xDistance),
              top: yDistance,
              child: Opacity(
                opacity: .5,
                child: Container(
                  height: widget.size * widget._ratio,
                  width: widget.size * widget._ratio,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        itemIndex -= 1;
                      });
                    },
                    child: _getItem(itemIndex - 1),
                  ),
                ),
              ),
            ),
            Positioned(
              child: Container(
                height: widget.size,
                width: widget.size,
                child: _getItem(itemIndex),
              ),
            ),
            Positioned(
              right: -(xDistance),
              top: yDistance,
              child: Opacity(
                opacity: .5,
                child: Container(
                  height: widget.size * widget._ratio,
                  width: widget.size * widget._ratio,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        itemIndex += 1;
                      });
                    },
                    child: _getItem(itemIndex + 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    List<Widget> _buildScrollBarItems() {
      List<Widget> scrollBarItems = [];
      int flex = 10 ~/ itemCount;
      for (var i = 0; i < itemCount; i++) {
        Color color = i == itemIndex ? Colors.white : Colors.transparent;
        scrollBarItems.add(Expanded(
          flex: flex,
          child: Container(
            height: 2.px,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
              color: color,
            ),
          ),
        ));
      }

      return scrollBarItems;
    }

    Widget _buildScrollBar() {
      return Container(
        height: 2.px,
        width: 160.px,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
          color: Colors.white.withOpacity(.5),
        ),
        child: Row(
          children: _buildScrollBarItems(),
        ),
      );
    }

    List<Widget> children = [];

    if (widget.itemsExtend == null || widget.itemsExtend.isEmpty) {
      children = [
        _buildSwipeContent(),
        _buildScrollBar(),
      ];
    } else {
      children = [
        _buildSwipeContent(),
        _buildScrollBar(),
        _getItemExtend(itemIndex),
      ];
    }

    return SpacedColumn(
      space: 70.px,
      children: children,
    );
  }
}
