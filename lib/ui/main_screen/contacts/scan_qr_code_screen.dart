import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/utils/validations.dart';
import 'package:kyc3/widgets/base_scaffold.dart';
import 'package:kyc3/widgets/qr_code/qr_code_overlay.dart' as q;
import 'package:kyc3/widgets/widgets.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ScanQrCodeScreen extends StatefulWidget {
  final String? barcode;

  const ScanQrCodeScreen({Key? key, this.barcode}) : super(key: key);

  @override
  _ScanQrCodeScreenState createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
  Barcode? result;
  QRViewController? controller;

  @override
  void initState() {
    super.initState();

    if (widget.barcode != null && widget.barcode!.isNotEmpty) {
      result = Barcode(widget.barcode!, BarcodeFormat.qrcode, null);
    }
  }

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    }
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "Scan QR Code",
      titleStyle: CustomStyles.appbarTitle,
      backgroundColor: context.homeBackgroundColor,
      applyShape: true,
      child: Padding(
        padding: p16,
        child: Column(
          children: [
            const _TitleWidgets(),
            h20,
            _barcodeAddress(),
            h20,
            Expanded(
              child: KycBarcodeWidget(
                qrCode: result,
                onViewCreated: (c) {
                  if (controller == null) {
                    controller = c;
                    setState(() {});
                    controller!.scannedDataStream.listen((scanData) {
                      if (result == null &&
                          scanData.code != null &&
                          validator.isValidEthFormat(scanData.code!.removeAllWhiteSpace())) {
                        result = scanData;
                        Navigator.of(context).maybePop(result);
                      }
                    });
                  }
                },
              ),
            ),
            h20,
            _scanAgainButton(),
            h10,
            _cancelButton(),
          ],
        ),
      ),
    );
  }

  Column _barcodeAddress() {
    return Column(
      children: [
        Texts(
          "Wallet Address",
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 17.0),
        ),
        h8,
        Texts(
          "${result != null ? widget.barcode : NA}",
        ),
      ],
    );
  }

  FilledButton _scanAgainButton() {
    return FilledButton(
      onTap: () {
        if (result != null) {
          setState(() {
            result = null;
          });
        }
      },
      useExpanded: false,
      leading: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Image.asset(
          Assets.imagesQrCode1,
          width: 25.0,
        ),
      ),
      color: Theme.of(context).backgroundColor,
      text: Strings.scanAgain,
    );
  }

  FilledButton _cancelButton() {
    return FilledButton(
      onTap: () {
        Navigator.of(context).maybePop();
      },
      applyGradient: false,
      color: context.textColor,
      textColor: context.backgroundColor,
      text: Strings.cancel,
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class _TitleWidgets extends StatelessWidget {
  const _TitleWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     Image.asset(
        //       Assets.imagesCamera1,
        //       width: 30,
        //     ),
        //     w10,
        //     const Texts(
        //       Strings.scanQrCode,
        //       fontSize: 17.0,
        //       fontWeight: FontWeight.bold,
        //     ),
        //   ],
        // ),
        Texts(
          Strings.scanQrCodeMsg,
          fontSize: 13.5,
          textAlign: TextAlign.center,
          color: context.subtitleColor,
        ),
      ],
    );
  }
}

class KycBarcodeWidget extends StatefulWidget {
  final Barcode? qrCode;
  final QRViewCreatedCallback onViewCreated;

  const KycBarcodeWidget({
    Key? key,
    required this.qrCode,
    required this.onViewCreated,
  }) : super(key: key);

  @override
  State<KycBarcodeWidget> createState() => _KycBarcodeWidgetState();
}

class _KycBarcodeWidgetState extends State<KycBarcodeWidget> {
  Widget? image;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  Widget build(BuildContext context) {
    if (widget.qrCode != null) {
      image = QrImage(
        data: widget.qrCode!.code!,
        size: screenWidth * .8,
      );
    } else {
      image = Transform.scale(
        scale: 1.015,
        child: QRView(
          key: qrKey,
          formatsAllowed: const [BarcodeFormat.qrcode],
          onQRViewCreated: widget.onViewCreated,
        ),
      );
    }

    return Container(
      decoration: ShapeDecoration(
        color: context.backgroundColor,
        shape: q.QrScannerOverlayShape(
          cutOutHeight: double.infinity,
          cutOutWidth: double.infinity,
          borderColor: Theme.of(context).accentColor,
          overlayColor: Theme.of(context).backgroundColor,
          cutoutColor: context.homeBackgroundColor!,
          borderWidth: 10.0,
          borderLength: 25.0,
        ),
      ),
      child: Center(child: image),
    );
  }
}
