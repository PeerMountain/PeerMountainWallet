import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/ui/auth/widgets/image_and_content_widget.dart';
import 'package:kyc3/utils/constants.dart';
import 'package:kyc3/utils/navigation_utils.dart';
import 'package:kyc3/widgets/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreens extends StatefulWidget {
  const IntroScreens({Key? key}) : super(key: key);

  @override
  _IntroScreensState createState() => _IntroScreensState();
}

class _IntroScreensState extends State<IntroScreens> {
  final _imageController = PageController();
  final _contentController = PageController();

  @override
  void dispose() {
    super.dispose();
    _imageController.dispose();
    _contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      isAppbar: false,
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(
              height: kToolbarHeight,
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: TextButton(
                    onPressed: () => navUtils.gotoInitialSelectScreen(),
                    child: const Texts(Strings.skip),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: PageView(
                controller: _imageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ImageIntroSlider(intro: Constants.introList[0]),
                  ImageIntroSlider(intro: Constants.introList[1]),
                  ImageIntroSlider(intro: Constants.introList[2]),
                  // _ImageIntroSlider(intro: Constants.introList[3]),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SmoothPageIndicator(
                count: 3,
                controller: _imageController,
                effect: ExpandingDotsEffect(
                  activeDotColor: Theme.of(context).colorScheme.primary,
                  dotColor: Theme.of(context).colorScheme.primary.withOpacity(0.4),
                  spacing: 10,
                  dotHeight: 12,
                  dotWidth: 12,
                ),
                onDotClicked: (index) {},
              ),
            ),
            Flexible(
              child: PageView(
                controller: _contentController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  TextIntroSlider(intro: Constants.introList[0]),
                  TextIntroSlider(intro: Constants.introList[1]),
                  TextIntroSlider(intro: Constants.introList[2]),
                  // _TextIntroSlider(intro: Constants.introList[3]),
                ],
              ),
            ),
            _BottomButtons(
              controller1: _imageController,
              controller2: _contentController,
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomButtons extends StatefulWidget {
  final PageController controller1;
  final PageController controller2;

  const _BottomButtons({Key? key, required this.controller1, required this.controller2}) : super(key: key);

  @override
  State<_BottomButtons> createState() => _BottomButtonsState();
}

class _BottomButtonsState extends State<_BottomButtons> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.11,
      decoration: const BoxDecoration(
        color: Palette.accentLight,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: p20,
      child: Center(
        child: Row(
          children: [
            if (currentIndex != 0)
              Expanded(
                child: BorderButton(
                  onTap: () {
                    /// move to previous
                    if (currentIndex > 0) {
                      final previousIndex = --currentIndex;
                      widget.controller1.animateToPage(
                        previousIndex,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                      widget.controller2.animateToPage(
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
            if (currentIndex != 0) const SizedBox(width: 50),
            Expanded(
              child: FilledButton(
                onTap: () {
                  /// move to next
                  if (currentIndex < Constants.introList.length - 1) {
                    final nextIndex = ++currentIndex;
                    widget.controller1.animateToPage(
                      nextIndex,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                    widget.controller2.animateToPage(
                      nextIndex,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  } else {
                    /// go to create wallet screen

                    navUtils.gotoInitialSelectScreen();
                  }
                  setState(() {});
                },
                text: Strings.next,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
