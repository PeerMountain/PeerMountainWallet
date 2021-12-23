import 'package:bip39/src/wordlists/english.dart' show WORDLIST;
import 'package:collection/collection.dart';
import 'package:kyc3/models/models.dart';

/// This will convert all of the string mnemonics words to *[CommonModel] class.
List<CommonModel> allSuggestionsList = WORDLIST
    .mapIndexed<CommonModel>((index, element) => CommonModel(
          name: element,
          index: index,
        ))
    .toList();

/// This will return all of the words matching the query parsed.
List<CommonModel> getWordsSuggestions(String query) {
  return allSuggestionsList.where((value) => value.name!.startsWith(query)).toList();
}
