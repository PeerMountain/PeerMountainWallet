import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';

class CustomListTile extends StatelessWidget {
  /// If this is specified and is not null then all [leading], [title], [trailing]
  /// all of widgets will be ignored
  final Widget? child;
  final Widget? leading;
  final Widget? title;
  final Widget? trailing;
  final int? flex;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onDoubleTap;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const CustomListTile({
    Key? key,
    this.child,
    this.leading,
    this.title,
    this.trailing,
    this.onTap,
    this.onDoubleTap,
    this.flex = 1,
    this.padding = const EdgeInsets.all(16.0),
    this.margin = const EdgeInsets.all(8.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return ScaleTap(
    // onPressed: () {},
    // scaleMinValue: 1.0,
    // opacityMinValue: 0.4,

    return Padding(
      padding: margin!,
      child: InkWell(
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          decoration: BoxDecoration(
            color: Theme.of(context).dialogBackgroundColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(color: Palette.accentColor),
            ],
          ),
          padding: padding!,
          child: child ??
              Row(
                children: [
                  if (leading != null) leading!,
                  Expanded(flex: flex!, child: title!),
                  if (trailing != null) trailing!,
                ],
              ),
        ), // other widget
      ),
    );
  }
}
