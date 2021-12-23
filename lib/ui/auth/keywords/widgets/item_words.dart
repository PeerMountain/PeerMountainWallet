import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/models/models.dart';
import 'package:kyc3/widgets/widgets.dart';

class ItemWords extends StatelessWidget {
  final CommonModel word;
  final Color? color;
  final Color? textColor;
  final VoidCallback? onTap;
  final bool visible;
  final bool invisible;
  final Widget? trailing;
  final bool applyGradient;
  final String? text;

  const ItemWords({
    Key? key,
    this.onTap,
    required this.word,
    this.color,
    this.textColor = Colors.white,
    this.visible = true,
    this.invisible = true,
    this.trailing,
    this.applyGradient = true,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      maintainSize: invisible,
      maintainState: invisible,
      maintainAnimation: invisible,
      child: FilledButton(
        onTap: onTap,
        text: text ?? word.name!,
        elevation: 1.0,
        fontSize: 14.0,
        trailing: trailing,
        applyGradient: applyGradient,
        color: color ?? Palette.accentLight,
        splashFactory: NoSplash.splashFactory,
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        textColor: textColor ?? Theme.of(context).textTheme.bodyText2!.color!,
      ),
    );
  }
}

class ItemWordsGradient extends StatelessWidget {
  final CommonModel word;
  final Color? color;
  final Color? textColor;
  final VoidCallback? onTap;
  final bool visible;
  final bool invisible;
  final bool hasClose;
  final VoidCallback? onClose;

  const ItemWordsGradient({
    Key? key,
    this.onTap,
    required this.word,
    this.color,
    this.textColor,
    this.visible = true,
    this.invisible = true,
    this.onClose,
    this.hasClose = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: Palette.accentGradient,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: EdgeInsets.only(left: hasClose ? 8.0 : 2.0, right: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Texts(
              word.name!,
              color: textColor,
              fontSize: 15.0,
              textAlign: TextAlign.center,
            ),
          ),
          if (hasClose)
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: IconButton(
                iconSize: 20,
                icon: const Icon(Icons.close, color: Colors.white),
                color: Colors.white,
                constraints: const BoxConstraints(minWidth: 30.0, minHeight: 30.0),
                padding: const EdgeInsets.all(5),
                onPressed: () => onClose?.call(),
              ),
            ),
        ],
      ),
    );
  }
}
