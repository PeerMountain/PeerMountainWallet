import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'list_type_state.dart';

enum ListTypes { list, grid }

class ListTypeCubit extends Cubit<ListTypeState> {
  ListTypeCubit() : super(ViewListType());

  void changeListType(ListTypes type) {
    if (type == ListTypes.list) {
      emit(ViewListType());
    } else {
      emit(ViewGridType());
    }
  }
}
