import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/app/router/routes.dart';
import 'package:kyc3/models/models.dart';
import 'package:kyc3/widgets/text_widget.dart';
import 'package:kyc3/widgets/widgets.dart';

import '../widgets/item_words.dart';

class GenerateKeywordsScreen extends StatefulWidget {
  const GenerateKeywordsScreen({Key? key}) : super(key: key);

  @override
  _GenerateKeywordsScreenState createState() => _GenerateKeywordsScreenState();
}

class _GenerateKeywordsScreenState extends State<GenerateKeywordsScreen> {
  String? pvKey;
  List<CommonModel> phraseList = [];

  @override
  void initState() {
    super.initState();

    final result = web3Service.generateMnemonics();
    if (result != null) {
      pvKey = result.privateKey!;
      phraseList = List.generate(
        result.mnemonicsList!.length,
        (index) => CommonModel(
          id: index,
          index: index,
          isSelected: false,
          name: result.mnemonicsList![index],
        ),
      ).toUnmodifiable();
    }
  }

  @override
  void dispose() {
    super.dispose();
    unsecureScreen();
  }

  @override
  Widget build(BuildContext context) {
    return SecureScreen(
      child: BaseScaffold(
        isAppbar: true,
        hasBack: false,
        appBarColor: Theme.of(context).backgroundColor,
        child: Column(
          children: [
            const Center(
              child: Texts(
                Strings.keywords,
                fontWeight: FontWeight.bold,
                fontSize: 26.0,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Texts(
                Strings.generateKeywordsMsg,
                fontSize: 16.0,
                color: Theme.of(context).colorScheme.secondaryVariant,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 4 / 1.5,
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 12.0,
                padding: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
                children: phraseList
                    .map((word) => ItemWords(
                          word: word,
                          onTap: () {},
                        ))
                    .toList(),
              ).removeGlow(),
            ),
            LinkedText(
              Strings.whyDoINeedThis,
              fontWeight: FontWeight.w500,
              onTap: () => navigationService.navigateTo(Routes.noScreenShots.value),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 8.0),
                child: FilledButton(
                  onTap: () {
                    if (pvKey != null && phraseList.isNotEmpty) {
                      navigationService.navigateTo(
                        Routes.verifyKeywords.value,
                        arguments: VerifyWordsArguments(
                          pvKey: pvKey!,
                          phraseList: phraseList.toList(),
                        ),
                      );
                    } else {
                      showErrorSnackbar(Strings.couldNotSignupUser);
                    }
                  },
                  text: Strings.iHaveWrittenDown,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
