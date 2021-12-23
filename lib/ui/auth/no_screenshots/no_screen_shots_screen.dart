import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/ui/auth/widgets/image_and_content_widget.dart';
import 'package:kyc3/utils/constants.dart';
import 'package:kyc3/widgets/base_scaffold.dart';
import 'package:kyc3/widgets/widgets.dart';

class NoScreenShotsScreen extends StatefulWidget {
  const NoScreenShotsScreen({Key? key}) : super(key: key);

  @override
  _NoScreenShotsScreenState createState() => _NoScreenShotsScreenState();
}

class _NoScreenShotsScreenState extends State<NoScreenShotsScreen> {
  final _contentController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarColor: Theme.of(context).backgroundColor,
      isLeading: true,
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _contentController,
              physics: const NeverScrollableScrollPhysics(),
              children: Constants.noScreenShotsList.map((e) => _ItemSlider(model: e)).toList(),
            ).removeGlow(),
          ),
          _BottomButtons(controller: _contentController),
        ],
      ),
    );
  }
}

class _ItemSlider extends StatelessWidget {
  final IntroModel model;

  const _ItemSlider({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextIntroSlider(
          intro: model,
        ),
        const Spacer(),
        Center(
          child: ImageIntroSlider(
            intro: model,
            height: screenHeight * 0.4,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: SizedBox(
            height: 40,
            child: Texts(
              model.extra1 ?? "",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        if (model.extra2 != null)
          LinkedText(
            model.extra2!,
            color: Theme.of(context).primaryColor,
            fontSize: 15.0,
            onTap: () {},
          ),
      ],
    );
  }
}

class _BottomButtons extends StatefulWidget {
  final PageController controller;

  const _BottomButtons({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<_BottomButtons> createState() => _BottomButtonsState();
}

class _BottomButtonsState extends State<_BottomButtons> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: p20.copyWith(top: 10.0),
      child: Row(
        children: [
          if (currentIndex != 0)
            Expanded(
              child: BorderButton(
                onTap: () {
                  /// move to previous
                  if (currentIndex > 0) {
                    final previousIndex = --currentIndex;
                    widget.controller.animateToPage(
                      previousIndex,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                    setState(() {});
                  }
                },
                text: Strings.previous,
              ),
            ),
          if (currentIndex != 0 && currentIndex < 2) const SizedBox(width: 50),
          if (currentIndex != Constants.noScreenShotsList.length - 1)
            Expanded(
              child: FilledButton(
                onTap: () {
                  if (currentIndex < Constants.noScreenShotsList.length - 1) {
                    final nextIndex = ++currentIndex;
                    widget.controller.animateToPage(
                      nextIndex,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  } else {
                    /// go to next screen
                  }
                  setState(() {});
                },
                text: Strings.next,
              ),
            ),
        ],
      ),
    );
  }
}
