import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/widgets/base_scaffold.dart';
import 'package:kyc3/widgets/svg_image.dart';
import 'package:kyc3/widgets/text_widget.dart';
import 'package:kyc3/widgets/widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
      title: "Settings",
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
    return ListTile(
      selected: true,
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
        "Nickname",
        style: context.textTheme.bodyText1?.copyWith(fontSize: 15.0),
      ),
      trailing: Texts("Kajal", color: context.subtitleColor),
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
      onTap: () async {
        final result = await dialogService.showConfirmationDialog(
          title: Strings.areYouSureLogout,
          cancelTitle: Strings.cancel.toUpperCase(),
          confirmationTitle: Strings.logout.toUpperCase(),
        );

        if (result != null && result.confirmed) {
          final response = await safeStorage.deletePrivateKey();
          if (response.isReadSuccess) {
            /// To reopen anonymous connection channel
            anonymousService.initXmppServer();
            navUtils.gotoInitialSelectScreen();
            hiveStorage.clearContacts();
            hiveStorage.clearConversations();
            hiveStorage.clearAllInvoices();
          }
        }
      },
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

  void showMyQrCode() {
    navigationService.navigateTo(Routes.showQrCodeDetails.value);
  }

  Future<void> depositAmount() async {
    final result = await navUtils.gotoDepositScreen();
  }

  Future<void> gotoInvoicesScreen() async {
    final result = await navUtils.gotoInvoicesScreen();
  }
}
