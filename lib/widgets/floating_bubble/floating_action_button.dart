import 'package:flutter/material.dart';

import '../text_widget.dart';

class Bubble {
  final String title;
  final Widget? icon;
  final Color? bubbleColor;
  final VoidCallback onPress;
  final TextStyle? titleStyle;

  const Bubble({
    required this.title,
    required this.onPress,
    this.titleStyle,
    this.bubbleColor,
    this.icon,
  });
}

class BubbleMenu extends StatelessWidget {
  const BubbleMenu(this.item, {Key? key}) : super(key: key);

  final Bubble item;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 2,
        primary: item.bubbleColor,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 6, right: 16.0),
      ),
      onPressed: item.onPress,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          item.icon ?? const SizedBox(),
          const SizedBox(width: 10.0),
          Texts(
            item.title,
            style: item.titleStyle,
          ),
        ],
      ),
    );
  }
}

class CustomFloatButton extends StatefulWidget {
  const CustomFloatButton({
    Key? key,
    required this.items,
    required this.onPress,
    required this.animation,
    required this.animationController,
    this.backgroundColor,
  }) : super(key: key);

  final List<Bubble> items;
  final VoidCallback onPress;
  final Color? backgroundColor;
  final Animation<dynamic> animation;
  final AnimationController animationController;

  @override
  _CustomFloatButtonState createState() => _CustomFloatButtonState();
}

class _CustomFloatButtonState extends State<CustomFloatButton> with TickerProviderStateMixin {
  Widget buildItem(BuildContext context, int index) {
    final screenWidth = MediaQuery.of(context).size.width;

    final textDirection = Directionality.of(context);

    final animationDirection = textDirection == TextDirection.ltr ? -1 : 1;

    final transform = Matrix4.translationValues(
      animationDirection *
          (screenWidth - widget.animation.value * screenWidth) *
          ((widget.items.length - index) / 4),
      0.0,
      0.0,
    );

    return Align(
      alignment: textDirection == TextDirection.ltr ? Alignment.centerRight : Alignment.centerLeft,
      child: Transform(
        transform: transform,
        child: Opacity(
          opacity: widget.animation.value,
          child: BubbleMenu(widget.items[index]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animation,
      builder: (_, child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IgnorePointer(
              ignoring: widget.animation.value == 0,
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (_, __) => const SizedBox(height: 12.0),
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemCount: widget.items.length,
                itemBuilder: buildItem,
              ),
            ),

            // FAB
            FloatingActionButton(
              elevation: 5.0,
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: widget.onPress,
              child: Center(
                child: (widget.animation.value == 1.0
                    ? const Icon(Icons.close, color: Colors.white, size: 28.0)
                    : const Icon(Icons.add, color: Colors.white, size: 30.0)),
              ),
            ),
          ],
        );
      },
    );
  }
}
