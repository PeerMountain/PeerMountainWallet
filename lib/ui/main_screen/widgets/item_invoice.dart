import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/models/hive_adapters/invoices/kyc_invoice.dart';
import 'package:kyc3/ui/main_screen/marketplace/market_cubit.dart';
import 'package:kyc3/widgets/cached_image.dart';
import 'package:kyc3/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ItemInvoice extends StatelessWidget {
  final KycInvoice invoice;

  const ItemInvoice({Key? key, required this.invoice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final found = context.read<MarketCubit>().getNftDetails(invoice.nftType!);
    final nft = found?.nft;
    if (found == null || nft == null) {
      return const SizedBox();
    }
    return CustomListTile(
      padding: p10.copyWith(top: 14.0, bottom: 14),
      margin: const EdgeInsets.only(bottom: 10.0, left: 10.0, right: 10.0),
      leading: CachedImage(
        nft.imageUrl,
        isRound: true,
        radius: 50,
      ),
      title: Container(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Texts(
                    nft.name,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16.0),
                  ),
                ),
              ],
            ),
            h5,
            Texts(
              "#${invoice.paymentNonce}",
              style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14.0),
            ),
          ],
        ),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Builder(
            builder: (context) {
              Color color = context.accentColor;
              String status = "PENDING";
              if (invoice.status == "payment_success") {
                status = "PAID";
                color = Palette.green;
              } else if (invoice.status == "payment_failed") {
                status = "FAILED";
                color = Palette.red;
              }
              return Texts(
                status,
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      fontSize: 14.0,
                      color: color,
                    ),
              );
            },
          ),
          h5,
          Texts(
            "${Units.pmtn} ${invoice.price!}",
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}
