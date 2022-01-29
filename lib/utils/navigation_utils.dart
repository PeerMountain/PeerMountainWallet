import 'package:kyc3/app/app.dart';
import 'package:kyc3/models/hive_adapters/contact/kyc_contact.dart';

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
  Future<T?> gotoMainScreen({bool? sendRequest}) async {
    prefs.setIntros(false);
    prefs.setAllDone(true);
    return await navigationService.pushNamedAndRemoveUntil(Routes.mainScreen.value, arguments: sendRequest);
  }

  Future<T?> gotoDepositScreen() async => await navigationService.navigateTo(Routes.depositAmount.value);

  Future<T?> gotoInvoicesScreen() async => await navigationService.navigateTo(Routes.allInvoicesScreen.value);

  /// This will be used to navigate user to add new contact screen.
  Future<T?> addNewContact() async => await navigationService.navigateTo(
        Routes.addOrEditContacts.value,
        arguments: EditContactsArguments(
          isNew: true,
          isMe: false,
        ),
      );

  Future<T?> gotoUserProfileScreen(KycContact? user) async => await navigationService.navigateTo(
        Routes.addOrEditContacts.value,
        arguments: EditContactsArguments(
          isMe: true,
          isNew: false,
          contact: user,
          title: Strings.profile,
        ),
      );

  Future<T?> gotoCreateOrChangePinScreen({bool isNew = true}) async => await navigationService.navigateTo(
        Routes.createOrChangePin.value,
        arguments: isNew,
      );

  Future<T?> gotoValidatePinScreen() async => await navigationService.navigateTo(Routes.validatePin.value);
}
