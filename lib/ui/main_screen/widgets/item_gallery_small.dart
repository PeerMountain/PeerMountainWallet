import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/generated/com/kyc3/oracle/nft/token.pb.dart';
import 'package:kyc3/ui/main_screen/marketplace/market_cubit.dart';
import 'package:kyc3/widgets/cached_image.dart';
import 'package:kyc3/widgets/list_tile/custom_list_tile.dart';
import 'package:kyc3/widgets/text_widget.dart';
import 'package:provider/provider.dart';

class ItemGalleryTile extends StatelessWidget {
  final Token model;

  const ItemGalleryTile({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final found = context.read<MarketCubit>().getNftDetails(model.nftType.toInt());
    final nft = found?.nft;
    if (found == null || nft == null) {
      return const SizedBox();
    }

    return CustomListTile(
      onTap: () {
        navigationService.navigateTo(Routes.nftDetailsScreen.value,
            arguments: NftDetailsScreenArguments(nft: nft));
      },
      margin: const EdgeInsets.only(bottom: 10.0),
      leading: CachedImage(
        nft.imageUrl,
        radius: 45,
        placeholder: Assets.imagesCryptoPlaceholder,
      ),
      title: Container(
        padding: const EdgeInsets.only(left: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Texts(
                    nft.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16.0),
                  ),
                  h8,
                  Texts(
                    nft.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    color: context.subtitleColor,
                    fontSize: 13.5,
                  ),
                ],
              ),
            ),
            Padding(
              padding: p8.copyWith(right: 0.0),
              child: Texts(
                "#${model.tokenId}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemGalleryGrid extends StatelessWidget {
  final Token model;

  const ItemGalleryGrid({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final found = context.read<MarketCubit>().getNftDetails(model.nftType.toInt());
    final nft = found?.nft;
    if (found == null || nft == null) {
      return const SizedBox();
    }
    return InkWell(
      onTap: () {
        navigationService.navigateTo(Routes.nftDetailsScreen.value,
            arguments: NftDetailsScreenArguments(nft: nft));
      },
      borderRadius: CustomStyles.b12,
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).dialogBackgroundColor,
          borderRadius: CustomStyles.b12,
          boxShadow: const [
            BoxShadow(color: Palette.accentColor),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CachedImage(
                nft.imageUrl,
                isRound: false,
                fit: BoxFit.contain,
                width: double.infinity,
                placeholder: Assets.imagesCryptoPlaceholder,
              ),
            ),
            h16,
            Center(
              child: Texts(
                "#${model.tokenId}",
                style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Center(
                child: Texts(
                  nft.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 16.0),
                ),
              ),
            ),
            h16,
          ],
        ),
      ), // other widget
    );
  }
}
