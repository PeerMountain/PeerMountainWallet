class CommonModel {
  dynamic id;
  int? index;
  String? name;
  String? mobile;
  String? image;
  bool? isSelected;
  int? removedIndex;

  CommonModel({
    this.id,
    this.index,
    this.name,
    this.mobile,
    this.image,
    this.isSelected,
    this.removedIndex,
  });

  @override
  String toString() {
    return "index: $index, name: $name";
  }
}

class WalletData {
  dynamic id;

  String? title;
  String? shortName;
  String? image;
  dynamic priceInBTC;
  String? marketStatus;
  String? address;
  String? group;
  String? ratings;

  WalletData({
    this.id,
    this.title,
    this.shortName,
    this.image,
    this.priceInBTC,
    this.marketStatus,
    this.address,
    this.group,
    this.ratings,
  });

  @override
  String toString() {
    return "index: $id, name: $title";
  }
}
