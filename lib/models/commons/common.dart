import 'package:equatable/equatable.dart';

class CommonModel with EquatableMixin {
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

  @override
  List<Object?> get props => [id, index, name, mobile, image, isSelected, removedIndex];
}