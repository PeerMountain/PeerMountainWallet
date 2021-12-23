import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/generated/com/kyc3/oracle/nft/nft.pb.dart';
import 'package:kyc3/ui/main_screen/marketplace/market_cubit.dart';
import 'package:kyc3/ui/main_screen/marketplace/nft_details/nft_details_cubit.dart';
import 'package:kyc3/widgets/cached_image.dart';
import 'package:kyc3/widgets/widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class NftDetailsScreen extends StatefulWidget {
  final NftSettings nft;

  const NftDetailsScreen({Key? key, required this.nft}) : super(key: key);

  @override
  _NftDetailsScreenState createState() => _NftDetailsScreenState();
}

class _NftDetailsScreenState extends State<NftDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final nft = widget.nft;
    return BaseScaffold(
      title: "Services",
      child: BlocProvider<NftDetailsCubit>(
        create: (context) => NftDetailsCubit(),
        child: BlocConsumer<MarketCubit, MarketPlaceState>(
          listener: (_, state) {},
          builder: (_, state) {
            return CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              slivers: [
                SliverPadding(
                  padding: p16,
                  sliver: SliverToBoxAdapter(
                    child: SizedBox(
                      height: screenHeight * 0.45,
                      child: CachedImage(
                        nft.imageUrl,
                        isRound: false,
                        fit: BoxFit.contain,
                        borderRadius: CustomStyles.b50,
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: p20.copyWith(top: 5.0, left: 30.0, right: 30.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate.fixed(
                      [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Texts(
                                    nft.name,
                                    style: context.textTheme.headline5?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  15.heightBox,
                                  Texts(
                                    "${Units.pmtn} ${nft.price}",
                                    style: context.textTheme.headline6?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            FloatingActionButton(
                              heroTag: null,
                              onPressed: () {},
                              tooltip: "Favourite",
                              child: SvgImage(
                                Assets.svgHeartEmpty,
                                color: context.textColor,
                              ),
                            ),
                          ],
                        ),
                        h20,
                        Texts(
                          nft.description,
                          style: context.textTheme.bodyText2?.copyWith(),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: p20.copyWith(top: 50.0),
                  sliver: SliverToBoxAdapter(
                    child: FilledButton(
                      onTap: () => context.read<MarketCubit>().purchaseNft(nft),
                      text: Strings.buyNow,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
