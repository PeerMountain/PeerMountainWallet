import 'package:kyc3/app/app.dart';

class IntroModel {
  int index;
  String image;
  String title;
  String message;
  String? extra1;
  String? extra2;

  IntroModel({
    required this.index,
    required this.image,
    required this.title,
    required this.message,
    this.extra1,
    this.extra2,
  });
}

class Constants {
  static final List<IntroModel> introList = [
    IntroModel(
      index: 0,
      image: Assets.imagesIntro1,
      title: Strings.introTitle1,
      message: Strings.introMessage1,
    ),
    IntroModel(
      index: 1,
      image: Assets.imagesIntro2,
      title: Strings.introTitle2,
      message: Strings.introMessage2,
    ),
    IntroModel(
      index: 2,
      image: Assets.imagesIntro3,
      title: Strings.introTitle3,
      message: Strings.introMessage3,
    ),
  ];

  static final List<IntroModel> noScreenShotsList = [
    IntroModel(
      index: 0,
      image: Assets.imagesNoScreenShot1,
      title: Strings.sTitle1,
      message: Strings.sMsg1,
      extra2: Strings.iUnderstand,
    ),
    IntroModel(
      index: 1,
      image: Assets.imagesNoScreenShot2,
      title: Strings.sTitle2,
      message: Strings.sMsg2,
      extra1: Strings.sExtra2,
      extra2: Strings.gotIt,
    ),
    IntroModel(
      index: 2,
      image: Assets.imagesNoScreenShot3,
      title: Strings.sTitle3,
      message: Strings.sMsg3,
      extra1: Strings.sExtra3,
      extra2: Strings.iUnderstand,
    ),
  ];

  static const longDateFormat = "MMMM dd, yyyy";
}
