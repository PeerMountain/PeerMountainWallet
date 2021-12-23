import 'package:kyc3/models/models.dart';

extension CommonListExt on List<CommonModel> {
  String toMnemonics() {
    String userMnemonics = '';
    for (var i in this) {
      userMnemonics += "${i.name} ";
    }
    return userMnemonics.trim();
  }
}
