import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/ui/main_screen/gallery/filter/list_type_cubit.dart';
import 'package:kyc3/ui/main_screen/gallery/gallery_cubit.dart';
import 'package:kyc3/ui/main_screen/marketplace/market_cubit.dart';
import 'package:kyc3/ui/main_screen/widgets/item_gallery_small.dart';
import 'package:kyc3/widgets/widgets.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  void initState() {
    super.initState();
    final blocMarket = context.read<MarketCubit>();
    final bloc = context.read<GalleryCubit>();
    if (blocMarket.state.items.isNotEmpty) {
      bloc.getUserPurchasedNfts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      isAppbar: true,
      titleStyle: CustomStyles.appbarTitle,
      backgroundColor: context.homeBackgroundColor,
      isLeading: false,
      title: "Gallery",
      applyShape: true,
      actions: [
        BlocConsumer<ListTypeCubit, ListTypeState>(
          listener: (context, state) {},
          builder: (context, state) {
            ListTypes listType = ListTypes.list;

            if (state is ViewListType) {
              listType = ListTypes.list;
            } else {
              listType = ListTypes.grid;
            }

            bool isList = listType == ListTypes.list;

            return IconButton(
              onPressed: () =>
                  context.read<ListTypeCubit>().changeListType(isList ? ListTypes.grid : ListTypes.list),
              icon: Icon(
                isList ? Icons.grid_view : Icons.list,
                color: context.textBlack,
              ),
            );
          },
        ),
      ],
      child: const PurchasedNftList(),
    );
  }
}

class PurchasedNftList extends StatefulWidget {
  const PurchasedNftList({Key? key}) : super(key: key);

  @override
  State<PurchasedNftList> createState() => _PurchasedNftListState();
}

class _PurchasedNftListState extends State<PurchasedNftList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final listState = context.watch<ListTypeCubit>().state;
    final state = context.watch<GalleryCubit>().state;

    switch (state.runtimeType) {
      case GalleryFailed:
        return NoDataFound(msg: (state as GalleryFailed).errorMessage);
      case GallerySuccess:
        final tokens = (state as GallerySuccess).tokens;

        if (tokens.isEmpty) {
          return const NoDataFound(msg: "No wallets to show!");
        }

        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(
                top: 13.0,
                bottom: kBottomNavigationBarHeight,
                left: 12.0,
                right: 12.0,
              ),
              sliver: listState is ViewListType
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (_, index) {
                          final item = state.tokens[index];
                          return ItemGalleryTile(model: item);
                        },
                        childCount: state.tokens.length,
                      ),
                    )
                  : SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final item = state.tokens[index];
                          return ItemGalleryGrid(model: item);
                        },
                        childCount: state.tokens.length,
                      ),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        childAspectRatio: 2 / 3,
                      ),
                    ),
            )
          ],
        );
      default:
        return const NativeLoader.android();
    }
  }
}
