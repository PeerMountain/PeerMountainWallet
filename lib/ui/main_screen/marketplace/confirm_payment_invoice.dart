import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/generated/com/kyc3/oracle/nft/nft.pb.dart';
import 'package:kyc3/generated/com/kyc3/oracle/user/initiate-nft-purchase.pb.dart';
import 'package:kyc3/widgets/base_scaffold.dart';
import 'package:kyc3/widgets/button_widgets.dart';
import 'package:kyc3/widgets/text_widget.dart';

class ConfirmPaymentInvoiceDialog extends StatelessWidget {
  final NftSettings nftSettings;
  final InitiateNFTPurchaseResponse initiateNFTPurchaseResponse;

  const ConfirmPaymentInvoiceDialog({
    Key? key,
    required this.nftSettings,
    required this.initiateNFTPurchaseResponse,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nft = nftSettings;
    final invoice = initiateNFTPurchaseResponse.invoice;
    return BaseScaffold(
      title: Texts(
        "${Strings.buy} ${nft.name}",
        color: context.textBlack,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      leading: const SizedBox(),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close),
        )
      ],
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: p16,
              children: [
                SizedBox(height: screenHeight * 0.10),
                Texts(
                  "${Strings.total} ${Units.pmtn}",
                  fontSize: 13.0,
                  textAlign: TextAlign.center,
                  color: context.subtitleColor,
                ),
                const SizedBox(height: 5),
                Texts(
                  "${Units.pmtn} " + invoice.price.toString(),
                  fontSize: 30.0,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: screenHeight * 0.05),
                Row(
                  children: [
                    Expanded(
                      child: Texts(
                        "${Strings.invoiceNo} :",
                        fontSize: 16.0,
                        color: context.subtitleColor,
                      ),
                    ),
                    Expanded(
                      child: Texts(
                        "#${invoice.paymentNonce}",
                        fontSize: 17.0,
                        textAlign: TextAlign.end,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          _buttonBar(),
        ],
      ),
    );
  }

  Padding _buttonBar() {
    hideLoader();
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0, top: 8.0),
      child: Row(
        children: [
          Expanded(
            child: FilledButton(
              onTap: () => navigationService.back(result: false),
              text: Strings.cancel,
              color: Palette.red,
              applyGradient: false,
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: FilledButton(
              onTap: () => navigationService.back(result: true),
              text: Strings.payNow,
            ),
          ),
        ],
      ),
    );
  }
}
