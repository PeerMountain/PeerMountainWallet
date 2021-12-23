import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:kyc3/generated/com/kyc3/oracle/nft/nft.pb.dart';
import 'package:kyc3/models/hive_adapters/contact/kyc_contact.dart';
import 'package:kyc3/models/models.dart';
import 'package:kyc3/ui/screens.dart';

enum Routes {
  intros,
  noScreenShots,
  setSecurityPin,
  alreadyHaveKeywords,
  generateKeywords,
  verifyKeywords,
  initialSelectOptionScreen,
  mainScreen,
  addOrEditContacts,
  scanContactQrCode,
  showQrCodeDetails,
  searchConversations,
  chatScreen,
  purchaseNftWebview,
  depositAmount,
  nftDetailsScreen,
  allInvoicesScreen,
}

extension RouteExt on Routes {
  String get value => toString().split(".").last;
}

class AppRouter {
  AppRouter._();

  static AppRouter get instance => AppRouter._();

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Widget screen = const NoRouteFoundScreen();
    if (settings.name != null) {
      switch (EnumToString.fromString(Routes.values, settings.name!)) {
        case Routes.intros:
          screen = const IntroScreens();
          break;
        case Routes.noScreenShots:
          screen = const NoScreenShotsScreen();
          break;

        /// select create new wallet or i already have screen
        case Routes.initialSelectOptionScreen:
          screen = const InitialSelectOptionScreen();
          break;
        case Routes.alreadyHaveKeywords:
          screen = const AlreadyHaveKeywordsScreen();
          break;
        case Routes.generateKeywords:
          screen = const GenerateKeywordsScreen();
          break;
        case Routes.verifyKeywords:
          final args = settings.arguments as VerifyWordsArguments;
          screen = VerifyKeywordsScreen(phraseList: args.phraseList, privateKey: args.pvKey);
          break;

        /// main screens
        case Routes.mainScreen:
          screen = const MainScreen();
          break;
        case Routes.setSecurityPin:
          // TODO: Handle this case.
          break;
        case Routes.addOrEditContacts:
          final args = settings.arguments as EditContactsArguments?;
          screen = AddOrEditContactsScreen(contact: args?.contact);
          break;
        case Routes.scanContactQrCode:
          final args = settings.arguments as StringOnlyArguments?;
          screen = ScanQrCodeScreen(barcode: args?.barcode);
          break;
        case Routes.showQrCodeDetails:
          final args = settings.arguments as StringOnlyArguments?;
          screen = ShowQrCodeScreen(barcode: args?.barcode);
          break;
        case Routes.searchConversations:
          screen = const SearchConversationsScreen();
          break;
        case Routes.chatScreen:
          final args = settings.arguments as ChatScreenArguments;
          screen = ChatScreen(user: args.user);
          break;
        case Routes.purchaseNftWebview:
          final args = settings.arguments as StringOnlyArguments;
          screen = PurchaseNftWebView(redirectUrl: args.redirectUrl!);
          break;
        case Routes.depositAmount:
          screen = const DepositAmountScreen();
          break;
        case Routes.nftDetailsScreen:
          final args = settings.arguments as NftDetailsScreenArguments;
          screen = NftDetailsScreen(nft: args.nft);
          break;
        case Routes.allInvoicesScreen:
          screen = const AllInvoicesScreen();
          break;
        default:
      }
    }

    return MaterialPageRoute(settings: settings, builder: (context) => screen);
  }
}

class VerifyWordsArguments {
  final String pvKey;
  final List<CommonModel> phraseList;

  VerifyWordsArguments({required this.pvKey, required this.phraseList});
}

class EditContactsArguments {
  final KycContact? contact;

  EditContactsArguments({this.contact});
}

class StringOnlyArguments {
  final String? barcode;
  final String? redirectUrl;

  StringOnlyArguments({this.barcode, this.redirectUrl});
}

class ChatScreenArguments {
  final KycContact user;

  ChatScreenArguments({required this.user});
}

class NftDetailsScreenArguments {
  final NftSettings nft;

  NftDetailsScreenArguments({required this.nft});
}
