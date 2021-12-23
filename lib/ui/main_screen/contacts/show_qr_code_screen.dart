import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/utils/app_utils.dart';
import 'package:kyc3/widgets/base_scaffold.dart';
import 'package:kyc3/widgets/text_field_widget.dart';
import 'package:kyc3/widgets/text_widget.dart';
import 'package:kyc3/widgets/widgets.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ShowQrCodeScreen extends StatefulWidget {
  /// If barcode is null means we will show current logged in user's barcode.
  /// Else passed barcode will be shown to the user.
  final String? barcode;

  const ShowQrCodeScreen({Key? key, this.barcode}) : super(key: key);

  @override
  _ShowQrCodeScreenState createState() => _ShowQrCodeScreenState();
}

class _ShowQrCodeScreenState extends State<ShowQrCodeScreen> {
  late String barcode;
  final tcAddress = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.barcode != null) {
      barcode = widget.barcode!;
    } else {
      barcode = cryptoAccount.address!;
    }

    tcAddress.text = barcode;
  }

  @override
  void dispose() {
    super.dispose();
    tcAddress.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "QR Code",
      applyShape: true,
      child: Padding(
        padding: p12,
        child: Column(
          children: [
            Expanded(
              child: Card(
                elevation: 5.0,
                child: ScrollConfiguration(
                  behavior: const NoGlowingBehavior(),
                  child: ListView(
                    children: [
                      h30,
                      Center(
                        child: ClipOval(
                          child: Image.asset(
                            Assets.imagesCryptoPlaceholder,
                            width: 80.0,
                            height: 80.0,
                          ),
                        ),
                      ),
                      h30,
                      Texts(
                        Strings.myQrCode,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyText1,
                      ),
                      h30,
                      Center(
                        child: QrImage(
                          data: barcode,
                          size: screenWidth * .6,
                        ),
                      ),
                      h30,
                      Row(
                        children: [
                          const Expanded(child: Divider(thickness: 1.0)),
                          Texts(" " + Strings.or.toUpperCase() + " "),
                          const Expanded(child: Divider(thickness: 1.0)),
                        ],
                      ),
                      h30,
                      Texts(
                        Strings.myPMOAddress,
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyText1,
                      ),
                      h20,
                      _barcodeTextField(),
                      h20,
                      _copyAddressButton(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _barcodeTextField() {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      child: TextFormFieldWidget(
        controller: tcAddress,
        readOnly: true,
        enabled: true,
        maxLines: 1,
        contentPadding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 15.0, bottom: 15.0),
        textAlign: TextAlign.center,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: context.subtitleColor),
          borderRadius: BorderRadius.circular(30.0),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: context.subtitleColor),
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }

  Center _copyAddressButton() {
    return Center(
      child: BorderButton(
        onTap: () {
          Utils.copyToClipboard(cryptoAccount.address!);
          showSuccessSnackbar("Address copied!");
        },
        text: Strings.copyAddress,
        width: screenWidth * 0.4,
        color: Palette.accentLight,
      ),
    );
  }

  Widget _scanQrCodeButton() {
    return Opacity(
      opacity: 0.0,
      child: FilledButton(
        onTap: () {},
        useExpanded: false,
        margin: p20.copyWith(left: 4.0, right: 4.0, bottom: 4.0),
        leading: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Image.asset(
            Assets.imagesCamera3,
            width: 25.0,
          ),
        ),
        color: Theme.of(context).backgroundColor,
        text: Strings.scanQrCode,
      ),
    );
  }
}
