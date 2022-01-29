import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/models/hive_adapters/contact/kyc_contact.dart';
import 'package:kyc3/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  /// To be able to verify if user has created pin or not.
  ///
  /// If user has created before then it will consist
  /// either [Keys.pin] or [Keys.both] values.
  ///
  /// 1. It means now user can only change his previously set pin.
  ///
  /// Or
  ///
  /// If it consist only [Keys.bio] means user has opted for bio authentication
  /// while sign up / importing existing app.
  ///
  /// 1. So if that is the case then
  /// we need to provide a way to user to be able to create pin for himself.
  ///
  /// 1.1. So when he creates his pin after that [Keys.authType]'s value will be changed
  /// to [Keys.both] means now user can only change his previously set pin.
  ///
  bool isPinCreated = false;

  bool isPrimaryExpanded = false, isPublicExpanded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      isAppbar: true,
      titleStyle: CustomStyles.appbarTitle,
      backgroundColor: context.homeBackgroundColor,
      isLeading: false,
      title: Strings.settings,
      applyShape: true,
      child: ListView(
        padding: p20,
        children: [
          _nickName(),
          h16,
          _primaryAddress(),
          h16,
          _publicAddress(),
          h16,
          _showMyQrCode(),
          h16,
          _changePinTile(),
          h16,
          _logout(),
          h16,
          ListTile(
            selected: true,
            onTap: depositAmount,
            selectedTileColor: context.cardColor,
            leading: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: SvgImage(
                Assets.svgAvatar,
                width: 20.0,
                height: 20.0,
                color: context.textColor,
              ),
            ),
            horizontalTitleGap: 0.0,
            title: Texts(
              "All User Amounts",
              style: context.textTheme.bodyText1?.copyWith(fontSize: 15.0),
            ),
          ),
          h16,
          ListTile(
            selected: true,
            onTap: gotoInvoicesScreen,
            selectedTileColor: context.cardColor,
            leading: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: SvgImage(
                Assets.svgAvatar,
                width: 20.0,
                height: 20.0,
                color: context.textColor,
              ),
            ),
            horizontalTitleGap: 0.0,
            title: Texts(
              "Invoices",
              style: context.textTheme.bodyText1?.copyWith(fontSize: 15.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _nickName() {
    return ValueListenableBuilder<dynamic>(
      valueListenable: hiveStorage.liveUser(),
      builder: (context, value, child) {
        KycContact? user;
        if (value?.isNotEmpty == true) {
          user = value.getAt(0);
        }

        return ListTile(
          selected: true,
          selectedTileColor: context.cardColor,
          onTap: () => navUtils.gotoUserProfileScreen(user),
          leading: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: SvgImage(
              Assets.svgAvatar,
              width: 20.0,
              height: 20.0,
              color: context.textColor,
            ),
          ),
          horizontalTitleGap: 0.0,
          title: Texts(
            Strings.nickName,
            style: context.textTheme.bodyText1?.copyWith(fontSize: 15.0),
          ),
          trailing: Texts(user?.nickName ?? NA, color: context.subtitleColor),
        );
      },
    );
  }

  Widget _primaryAddress() {
    final icon = Padding(
      padding: const EdgeInsets.only(top: 2),
      child: SvgImage(
        Assets.svgLocation,
        width: 20.0,
        height: 20.0,
        color: context.textColor,
      ),
    );

    const padding = EdgeInsets.only(left: 16.0, right: 8.0, top: 8.0, bottom: 8.0);

    return StatefulBuilder(
      builder: (context, innerState) {
        return CustomExpansionTile(
          horizontalTitleGap: 0.0,
          backgroundColor: context.cardColor,
          collapsedBackgroundColor: context.cardColor,
          trailing: Icon(
            !isPrimaryExpanded ? Icons.keyboard_arrow_down_outlined : Icons.keyboard_arrow_up_outlined,
            color: context.textColor,
          ),
          onExpansionChanged: (value) {
            isPrimaryExpanded = value;
            innerState(() {});
          },
          leading: icon,
          title: Texts(
            Strings.primaryAddress,
            style: context.textTheme.bodyText1?.copyWith(fontSize: 15.0),
          ),
          children: [
            Divider(color: context.homeBackgroundColor, thickness: 5),
            ListTile(
              horizontalTitleGap: 0.0,
              contentPadding: padding,
              leading: icon,
              title: Texts(
                "3744 Rardin Drive, Burlingame, California, 94010.",
                color: context.subtitleColor,
              ),
            ),
            ListTile(
              horizontalTitleGap: 0.0,
              contentPadding: padding,
              leading: icon,
              title: Texts(
                "3744 Rardin Drive, Burlingame, California, 94010.",
                color: context.subtitleColor,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _publicAddress() {
    final icon = Padding(
      padding: const EdgeInsets.only(top: 2),
      child: SvgImage(
        Assets.svgLocationPin,
        width: 20.0,
        height: 20.0,
        color: context.textColor,
      ),
    );

    const padding = EdgeInsets.only(left: 16.0, right: 8.0, top: 8.0, bottom: 8.0);

    return StatefulBuilder(
      builder: (context, innerState) {
        return CustomExpansionTile(
          horizontalTitleGap: 0.0,
          backgroundColor: context.cardColor,
          collapsedBackgroundColor: context.cardColor,
          trailing: Icon(
            !isPublicExpanded ? Icons.keyboard_arrow_down_outlined : Icons.keyboard_arrow_up_outlined,
            color: context.textColor,
          ),
          onExpansionChanged: (value) {
            isPublicExpanded = value;
            innerState(() {});
          },
          leading: icon,
          title: Texts(
            Strings.publicAddress,
            style: context.textTheme.bodyText1?.copyWith(fontSize: 15.0),
          ),
          children: [
            Divider(color: context.homeBackgroundColor, thickness: 5),
            ListTile(
              horizontalTitleGap: 0.0,
              contentPadding: padding,
              leading: icon,
              title: Texts(
                "3744 Rardin Drive, Burlingame, California, 94010.",
                color: context.subtitleColor,
              ),
            ),
            ListTile(
              horizontalTitleGap: 0.0,
              contentPadding: padding,
              leading: icon,
              title: Texts(
                "3744 Rardin Drive, Burlingame, California, 94010.",
                color: context.subtitleColor,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _logout() {
    return ListTile(
      onTap: _logoutUser,
      selected: true,
      selectedTileColor: context.cardColor,
      leading: Padding(
        padding: const EdgeInsets.only(top: 2),
        child: SvgImage(
          Assets.svgLogout,
          width: 20.0,
          height: 20.0,
          color: context.textColor,
        ),
      ),
      horizontalTitleGap: 0.0,
      title: Texts(
        Strings.logout,
        style: context.textTheme.bodyText1?.copyWith(fontSize: 15.0),
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right_outlined,
        color: context.textColor,
      ),
    );
  }

  Widget _showMyQrCode() {
    return ListTile(
      onTap: showMyQrCode,
      selected: true,
      selectedTileColor: context.cardColor,
      leading: Transform.translate(
        offset: const Offset(-2.0, 0.0),
        child: Image.asset(
          Assets.imagesQrCode1,
          width: 25.0,
          color: context.textColor,
        ),
      ),
      horizontalTitleGap: 0.0,
      title: Texts(
        Strings.showMyQrCode,
        style: context.textTheme.bodyText1?.copyWith(fontSize: 15.0),
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right_outlined,
        color: context.textColor,
      ),
    );
  }

  Widget _changePinTile() {
    isPinCreated = prefs.getAuthType() != Keys.bio;
    return ListTile(
      onTap: createOrChangePin,
      selected: true,
      selectedTileColor: context.cardColor,
      leading: Icon(
        Icons.lock_outline,
        color: context.textColor,
      ),
      horizontalTitleGap: 0.0,
      title: Texts(
        !isPinCreated ? Strings.createPin : Strings.changePin,
        style: context.textTheme.bodyText1?.copyWith(fontSize: 15.0),
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right_outlined,
        color: context.textColor,
      ),
    );
  }

  void showMyQrCode() {
    navigationService.navigateTo(Routes.showQrCodeDetails.value);
  }

  Future<void> depositAmount() async {
    final result = await navUtils.gotoDepositScreen();
  }

  Future<void> gotoInvoicesScreen() async {
    final result = await navUtils.gotoInvoicesScreen();
  }

  Future<void> _logoutUser() async {
    final result = await dialogService.showConfirmationDialog(
      title: Strings.areYouSureLogout,
      cancelTitle: Strings.cancel.toUpperCase(),
      confirmationTitle: Strings.logout.toUpperCase(),
    );

    if (result != null && result.confirmed) {
      showLoader();
      final deleted = await secureStorage.deletePrivateKey();
      final response = await safeStorage.deletePrivateKey();

      normalXmppService.closeXmpp();

      /// To reopen anonymous connection channel
      anonymousService.initXmppServer();
      await Future.delayed(const Duration(seconds: 3));
      hiveStorage.clearAll();
      hideLoader();
      navUtils.gotoInitialSelectScreen();
    }
  }

  Future<void> createOrChangePin() async {
    /// if (userPin == null) means user has not created any pin previously
    /// so he/she can create pin first and then change pin if they've already created before.
    final result = await navUtils.gotoCreateOrChangePinScreen(isNew: !isPinCreated);

    /// User has successfully changed his/her pin.
    if (result == true) {
      if (!isPinCreated) {
        if (prefs.getAuthType() == Keys.bio) {
          await prefs.setAuthType(Keys.both);
        }
      } else {
        showSuccessSnackbar("Pin has been created successfully!");
      }
      setState(() {});
    }
  }
}
