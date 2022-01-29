import 'package:kyc3/models/models.dart';

export 'package:collection/collection.dart';

extension CommonListExt on List<CommonModel> {
  String toMnemonics() {
    String userMnemonics = '';
    for (var i in this) {
      userMnemonics += "${i.name} ";
    }
    return userMnemonics.trim();
  }
}

extension Filter<K, V> on Map<K, V> {
  Iterable<MapEntry<K, V>> filter(
    bool Function(MapEntry<K, V> entry) f,
  ) sync* {
    for (final entry in entries) {
      if (f(entry)) {
        yield entry;
      }
    }
  }
}
