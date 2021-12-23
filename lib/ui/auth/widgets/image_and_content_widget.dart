import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/app/theme/palette.dart';
import 'package:kyc3/utils/constants.dart';
import 'package:kyc3/widgets/widgets.dart';

class ImageIntroSlider extends StatelessWidget {
  final IntroModel intro;
  final double? width;
  final double? height;

  const ImageIntroSlider({
    Key? key,
    required this.intro,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: p16,
      child: Image.asset(
        intro.image,
        width: width,
        height: height,
      ),
    );
  }
}

class TextIntroSlider extends StatelessWidget {
  final IntroModel intro;

  const TextIntroSlider({Key? key, required this.intro}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Texts(
            intro.title,
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Texts(
              intro.message,
              fontSize: 16.0,
              color: Theme.of(context).colorScheme.secondaryVariant,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
