import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/models/models.dart';
import 'package:kyc3/services/services.dart';
import 'package:kyc3/widgets/widgets.dart';

import '../widgets/item_words.dart';

class VerifyKeywordsScreen extends StatefulWidget {
  final String privateKey;
  final List<CommonModel> phraseList;

  const VerifyKeywordsScreen({
    Key? key,
    required this.privateKey,
    required this.phraseList,
  }) : super(key: key);

  @override
  _VerifyKeywordsScreenState createState() => _VerifyKeywordsScreenState();
}

class _VerifyKeywordsScreenState extends State<VerifyKeywordsScreen> {
  List<CommonModel> originalPhraseList = [];
  List<CommonModel> original6WordsList = [];
  List<CommonModel> shuffledPhraseList = [];
  List<CommonModel> usersPhraseList = [];

  late String privateKey;

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() {
    privateKey = widget.privateKey;
    originalPhraseList = widget.phraseList.toList();

    /// generate new random other words and add into verification list
    final result = web3Service.generateMnemonics();
    if (result != null) {
      final ksList = List.generate(
        result.mnemonicsList!.length,
        (index) => CommonModel(
          id: index,
          index: index,
          isSelected: false,
          name: result.mnemonicsList![index],
        ),
      )..shuffle();

      /// get any 6 random shuffled words from [original] mnemonics list
      final temp = originalPhraseList.toList()..shuffle();
      original6WordsList = temp.take(6).toList();

      /// ONLY IN DEBUG MODE FOR DEV EASE CASE
      /// replaces first 6 words of newly generated list with [originalPhraseList]
      /// so that users can directly verify first 6 words of their
      /// original account's mnemonics
      if (kDebugMode) {
        ksList.setRange(0, 6, original6WordsList);
      } else {
        final randomInts = List<int>.generate(24, (int index) => index);
        randomInts.shuffle();
        final sixInts = randomInts.sublist(0, 6);
        for (var i = 0; i < sixInts.length; ++i) {
          var o = sixInts[i];
          ksList[o] = original6WordsList[i];
        }
      }

      shuffledPhraseList = ksList.toList();

      /// this is to maintain order of adding the words and removing the words
      for (var i = 0; i < shuffledPhraseList.length; ++i) {
        final o = shuffledPhraseList[i];
        o.index = i;
        o.isSelected = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      isAppbar: true,
      hasBack: true,
      appBarColor: Theme.of(context).backgroundColor,
      child: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: true,
            child: Column(
              children: [
                // SizedBox(height: screenHeight * 0.05),
                const Center(
                  child: Texts(
                    Strings.keywordsVerification,
                    fontWeight: FontWeight.bold,
                    fontSize: 26.0,
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Texts(
                    Strings.keywordsVerificationMsg,
                    fontSize: 16.0,
                    color: Theme.of(context).colorScheme.secondaryVariant,
                    textAlign: TextAlign.center,
                  ),
                ),

                /// selected words
                Expanded(
                  child: Container(
                    margin: p20,
                    decoration: BoxDecoration(
                      color: context.homeBackgroundColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Theme.of(context).primaryColor),
                    ),
                    child: Center(
                      child: ScrollConfiguration(
                        behavior: const NoGlowingBehavior(),
                        child: GridView.count(
                          crossAxisCount: 3,
                          shrinkWrap: true,
                          childAspectRatio: 4 / 1.5,
                          mainAxisSpacing: 12.0,
                          crossAxisSpacing: 12.0,
                          // physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 3.0),
                          children: usersPhraseList
                              .mapIndexed((index, word) => ItemWords(
                                    word: word,
                                    visible: true,
                                    invisible: false,
                                    textColor: Colors.white,
                                    color: Theme.of(context).primaryColor,
                                    onTap: () => removeFromInput(index, word),
                                  ))
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                Flexible(
                  child: Center(
                    child: ScrollConfiguration(
                      behavior: const NoGlowingBehavior(),
                      child: GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        childAspectRatio: 4 / 1.5,
                        mainAxisSpacing: 12.0,
                        crossAxisSpacing: 12.0,
                        // physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 3.0),
                        children: shuffledPhraseList.mapIndexed(
                          (index, word) {
                            bool isSelected = kDebugMode ? index < 6 : false;
                            return ItemWords(
                              word: word,
                              text: isSelected ? "${word.name}*" : word.name,
                              visible: !word.isSelected!,
                              textColor: isSelected ? Colors.white : context.textBlack,
                              applyGradient: isSelected ? true : false,
                              color: isSelected ? Theme.of(context).colorScheme.secondary : null,
                              onTap: () => addToInput(index, word),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                LinkedText(
                  Strings.whyDoINeedThis,
                  fontWeight: FontWeight.w500,
                  onTap: () => navigationService.navigateTo(Routes.noScreenShots.value),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 8.0),
                  child: FilledButton(
                    onTap: onSubmit,
                    text: Strings.verify,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void addToInput(int index, CommonModel word) {
    usersPhraseList.add(word);
    shuffledPhraseList.firstWhere((element) => element.name == word.name).isSelected = true;
    setState(() {});
  }

  void removeFromInput(int index, CommonModel word) {
    usersPhraseList.remove(word);
    shuffledPhraseList.firstWhere((element) => element.name == word.name).isSelected = false;
    setState(() {});
  }

  void onSubmit() async {
    if (usersPhraseList.length != 6) {
      showErrorSnackbar("Invalid pass-phrase!");
      return;
    }
    final first6OfUsersList = usersPhraseList.toList().take(6).toList();

    final isListHasAllTheWords =
        const UnorderedIterableEquality().equals(original6WordsList, first6OfUsersList);

    if (!isListHasAllTheWords) {
      showErrorSnackbar("Invalid pass-phrase!");
      return;
    }

    /// On Success will goto main screen otherwise
    /// Error has been handled in below methods directly
    final didSave = await safeStorage.savePrivateKey(
      privateKey,
      cancelText: Strings.usePin,
      onUsePin: () {
        showLog("onUsePin");
        createPin(isUsePin: true);
      },
      errorHwUnavailable: () {
        showLog("errorHwUnavailable");
        createPin();
      },
      errorNoHardware: () {
        showLog("errorNoHardware");
        createPin();
      },
      statusUnknown: () {
        showLog("statusUnknown");
        createPin();
      },
      errorNoBiometricEnrolled: () async {
        showLog("errorNoBiometricEnrolled");
        createPin();
      },
    );

    if (didSave == true) {
      prefs.setAuthType(Keys.bio);
      signUpUserOnServer();
    }
  }

  void createPin({bool isUsePin = false}) async {
    if (!isUsePin) {
      final result = await showErrorDialog(
        title: Strings.authenticationFailed,
        description: Strings.errorMsgAuthFailed,
        okText: Strings.usePin,
      );
    }

    /// create new pin here
    final response = await navUtils.gotoCreateOrChangePinScreen();

    if (response == true) {
      prefs.setAuthType(Keys.pin);
      signUpUserOnServer();
    }
  }

  void signUpUserOnServer() async {
    /// Save in secure storage also because if user has bio metrics enrolled
    /// while sign up and if user removes it later on we wont be able to
    /// retrieve user's private key from bio storage instead we have to use
    /// secure storage as a backup private key for user's account retrieval
    /// when user restarts the application.
    await secureStorage.savePrivateKey(privateKey);

    /// login user to server here
    /// Assign new account as user's current crypto account into app.
    cryptoAccount = web3Service.getUserCryptoAccount(privateKey)!;
    showLoader();
    anonymousReceiveService.isNewUser = true;
    anonymousSendService.sendExchangeKeyRequest();
  }
}
