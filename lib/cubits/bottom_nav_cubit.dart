import 'package:bloc/bloc.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  /// To update the index onTap in BottomNavigationBar
  void setIndex(int index) => emit(index);
}
