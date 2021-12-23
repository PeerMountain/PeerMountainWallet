import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/cubits/cubits.dart';
import 'package:kyc3/models/commons/common.dart';
import 'package:provider/provider.dart';

import 'curved_nav_bar/pmo_curved_nav_bar.dart';
import 'widgets.dart';

class BaseScaffold extends StatefulWidget {
  final bool isLeading;
  final bool isAppbar;
  final bool hasBack;
  final dynamic title;
  final Color? backgroundColor;
  final VoidCallback? onLeading;
  final bool? resizeToAvoidBottomInset;
  final Widget? floatingActionButton;

  final Widget child;
  final Widget? leading;
  final List<Widget>? actions;

  final Color? appBarColor;
  final bool hasNavBar;

  final bool applyShape;
  final bool extendBody;
  final bool extendBodyBehindAppBar;

  final FloatingActionButtonLocation? fabLocation;

  final TextStyle? titleStyle;

  const BaseScaffold({
    Key? key,
    required this.child,
    this.backgroundColor,
    this.isLeading = true,
    this.hasBack = false,
    this.title,
    this.actions,
    this.onLeading,
    this.isAppbar = true,
    this.leading,
    this.resizeToAvoidBottomInset,
    this.floatingActionButton,
    this.appBarColor,
    this.hasNavBar = false,
    this.applyShape = false,
    this.fabLocation,
    this.titleStyle,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
  }) : super(key: key);

  @override
  _BaseScaffoldState createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: widget.child,
      extendBody: widget.extendBody,
      extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
      floatingActionButton: widget.floatingActionButton,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      backgroundColor: widget.backgroundColor ?? Theme.of(context).backgroundColor,
      floatingActionButtonLocation: widget.fabLocation,
      bottomNavigationBar: widget.hasNavBar ? const PMOCurvedNavigationBar() : null,
    );
  }

  Widget backButton() => BackButton(
      color: context.textBlack,
      key: UniqueKey(),
      onPressed: widget.onLeading ??
          () {
            hideKeyboard(context);
            Navigator.of(context).maybePop();
          });

  AppBar? getAppBar() {
    if (!widget.isAppbar) {
      return null;
    }

    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: widget.appBarColor,
      leading: widget.isLeading ? widget.leading ?? backButton() : nil,
      title: widget.title == null
          ? null
          : widget.title is Widget
              ? widget.title
              : Transform.translate(
                  offset: const Offset(0.0, 2.0),
                  child: Texts(
                    widget.title ?? "",
                    style: widget.titleStyle ??
                        Texts.customTextStyle(
                          fontSize: 20.0,
                          color: context.textBlack,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
      actions: widget.actions,
      shape: widget.applyShape
          ? const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(18.0),
                bottomRight: Radius.circular(18.0),
              ),
            )
          : null,
    );
  }
}

class PMOCurvedNavigationBar extends StatelessWidget {
  const PMOCurvedNavigationBar({Key? key}) : super(key: key);
  static final List<CommonModel> list = [
    CommonModel(image: Assets.svgWallet, index: 0),
    CommonModel(image: Assets.svgContacts, index: 1),
    CommonModel(image: Assets.svgMarketplace, index: 2),
    CommonModel(image: Assets.svgConversation, index: 3),
    CommonModel(image: Assets.svgSetting, index: 4),
  ];

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<BottomNavCubit>().state;
    final bottomTheme = Theme.of(context).bottomNavigationBarTheme;

    return CurvedNavigationBarWidget(
      index: currentIndex,
      height: navBarHeight,
      color: bottomTheme.selectedItemColor!,
      backgroundColor: bottomTheme.backgroundColor!,
      buttonBackgroundColor: Palette.accentColor,
      items: list
          .map(
            (e) => SvgPicture.asset(
              e.image!,
              color: e.index == currentIndex ? Colors.white : Theme.of(context).textTheme.bodyText2?.color,
            ),
          )
          .toList(),
      onTap: (index) => context.read<BottomNavCubit>().setIndex(index),
    );
  }
}
