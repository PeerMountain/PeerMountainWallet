import 'package:kyc3/app/app.dart';

final navUtils = NavigationUtils.instance;

class NavigationUtils<T> {
  NavigationUtils._();

  static NavigationUtils get instance => NavigationUtils._();

  Future<T?> gotoIntros() async {
    return await navigationService.pushNamedAndRemoveUntil(Routes.intros.value);
  }

  Future<T?> gotoInitialSelectScreen() async {
    prefs.setIntros(false);
    prefs.setAllDone(false);
    return await navigationService.pushNamedAndRemoveUntil(Routes.initialSelectOptionScreen.value);
  }

  /// By calling this method we can assure that user had successfully completed
  /// all of the authentication flow and its *[Keys.privateKey] has been
  /// saved successfully in secure storage via bio metric storage.
  Future<T?> gotoMainScreen() async {
    prefs.setIntros(false);
    prefs.setAllDone(true);
    return await navigationService.pushNamedAndRemoveUntil(Routes.mainScreen.value);
  }

  Future<T?> gotoDepositScreen() async => await navigationService.navigateTo(Routes.depositAmount.value);

  Future<T?> gotoInvoicesScreen() async => await navigationService.navigateTo(Routes.allInvoicesScreen.value);
}
