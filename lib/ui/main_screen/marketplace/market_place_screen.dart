import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/generated/com/kyc3/oracle/nft/signed-nft.pb.dart';
import 'package:kyc3/utils/app_events.dart';
import 'package:kyc3/widgets/cached_image.dart';
import 'package:kyc3/widgets/widgets.dart';

import 'market_cubit.dart';

class MarketplaceScreen extends StatefulWidget {
  const MarketplaceScreen({Key? key}) : super(key: key);

  @override
  _MarketplaceScreenState createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
  @override
  void initState() {
    super.initState();
    final bloc = context.read<MarketCubit>();
    bloc.getNftsList();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      isAppbar: true,
      titleStyle: CustomStyles.appbarTitle,
      appBarColor: Palette.appBarColor,
      backgroundColor: context.homeBackgroundColor,
      isLeading: false,
      title: Strings.marketplace,
      applyShape: false,
      extendBody: true,
      extendBodyBehindAppBar: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            Assets.imagesFilter,
            width: 24.0,
          ),
        ),
      ],
      child: const NftsList(),
    );
  }
}

class NftsList extends StatefulWidget {
  const NftsList({Key? key}) : super(key: key);

  @override
  State<NftsList> createState() => _NftsListState();
}

class _NftsListState extends State<NftsList> {
  final tcSearch = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tcSearch.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: Palette.appBarColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(18.0),
              bottomRight: Radius.circular(18.0),
            ),
          ),
          elevation: 0.0,
          toolbarHeight: kToolbarHeight + 10.0,
          title: SearchTextField(
            controller: tcSearch,
            onChanged: (v) {
              context.read<MarketCubit>().getNftsList(keywords: v.justifyContent());
            },
          ),
        ),
        Expanded(
          child: BlocConsumer<MarketCubit, MarketPlaceState>(
            builder: (_, state) {
              switch (state.status) {
                case CubitState.initial:
                  return const SizedBox();
                case CubitState.failure:
                  return NoDataFound(msg: state.errorMessage);
                case CubitState.success:
                  final nftList = state.items;

                  if (nftList.isEmpty) {
                    return const NoDataFound(msg: Strings.noPurchasedNft);
                  }

                  return CustomScrollView(
                    slivers: [
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Padding(
                              padding: const EdgeInsets.all(16.0).copyWith(top: 30.0, bottom: 20.0),
                              child: Texts(
                                Strings.nfts,
                                style: context.textTheme.headline3,
                              ),
                            ),
                            SizedBox(
                              height: screenHeight * 0.3,
                              child: ListView.separated(
                                itemCount: state.items.length,
                                scrollDirection: Axis.horizontal,
                                padding: p16.copyWith(top: 0.0, bottom: 0.0),
                                separatorBuilder: (_, index) => w16,
                                itemBuilder: (_, index) {
                                  final item = state.items[index];

                                  return _ItemNft(item: item);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                default:
                  return const NativeLoader.android();
              }
            },
            listener: (_, state) {},
          ),
        ),
      ],
    );
  }
}

class _ItemNft extends StatelessWidget {
  final SignedNftSettings item;

  const _ItemNft({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nft = item.nft;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: CustomStyles.b25,
      ),
      child: InkWell(
        onTap: () {
          navigationService.navigateTo(Routes.nftDetailsScreen.value,
              arguments: NftDetailsScreenArguments(signedNft: item));
        },
        borderRadius: CustomStyles.b25,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: CachedImage(
                nft.imageUrl,
                isRound: false,
                width: screenWidth * 0.53,
                fit: BoxFit.contain,
                borderRadius: CustomStyles.b25,
                placeholder: Assets.imagesSplash,
              ),
            ),
            h16,
            Texts(
              nft.name.isNotBlank ? nft.name : NA,
              style: context.textTheme.bodyText1?.copyWith(fontSize: 18.0),
            ).px16(),
            h5,
            RichText(
              text: TextSpan(children: <InlineSpan>[
                TextSpan(
                  text: "${Strings.price} : ",
                  style: context.textTheme.bodyText1?.copyWith(
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                TextSpan(
                  text: "${Units.pmtn} ${nft.price}",
                  style: context.textTheme.bodyText1?.copyWith(fontSize: 15.0),
                ),
              ]),
            ).px16(),
            h8,
          ],
        ),
      ),
    );
  }
}
