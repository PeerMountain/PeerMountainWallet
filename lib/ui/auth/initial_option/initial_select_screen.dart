import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/ui/auth/widgets/image_and_content_widget.dart';
import 'package:kyc3/utils/constants.dart';
import 'package:kyc3/widgets/widgets.dart';

class InitialSelectOptionScreen extends StatefulWidget {
  const InitialSelectOptionScreen({Key? key}) : super(key: key);

  @override
  _InitialSelectOptionScreenState createState() => _InitialSelectOptionScreenState();
}

class _InitialSelectOptionScreenState extends State<InitialSelectOptionScreen> {
  final introModel = IntroModel(
    index: 0,
    image: Assets.imagesPrivateSecure,
    title: Strings.introTitle4,
    message: Strings.introMessage4,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarColor: Theme.of(context).backgroundColor,
      isLeading: false,
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                const SizedBox(height: 25.0),
                Expanded(flex: 7, child: ImageIntroSlider(intro: introModel)),
                const SizedBox(height: 30.0),
                Expanded(flex: 5, child: TextIntroSlider(intro: introModel)),
              ],
            ),
          ),
          const _BottomButtons(),
        ],
      ),
    );
  }
}

class _BottomButtons extends StatelessWidget {
  const _BottomButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Palette.accentLight,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: p20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton(
            onTap: () {
              navigationService.navigateTo(Routes.generateKeywords.value);
            },
            text: Strings.createNewWallet,
          ),
          const SizedBox(height: 12.0),
          EmptyButton(
            onTap: () {
              navigationService.navigateTo(Routes.alreadyHaveKeywords.value);
            },
            color: Colors.transparent,
            text: Strings.alreadyHaveWallet,
          ),
        ],
      ),
    );
  }
}
