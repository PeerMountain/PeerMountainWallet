import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/ui/main_screen/gallery/filter/list_type_cubit.dart';
import 'package:kyc3/ui/main_screen/gallery/gallery_cubit.dart';
import 'package:kyc3/ui/main_screen/marketplace/market_cubit.dart';
import 'package:kyc3/ui/main_screen/widgets/item_gallery_small.dart';
import 'package:kyc3/utils/export_utils.dart';
import 'package:kyc3/widgets/widgets.dart';
import 'package:xmpp_stone/xmpp_stone.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  StreamSubscription? _connSubscription;

  @override
  void initState() {
    super.initState();
    final blocMarket = context.read<MarketCubit>();
    final bloc = context.read<GalleryCubit>();
    if (blocMarket.state.items.isNotEmpty) {
      bloc.getUserPurchasedNfts();
    }

    /// This is to notify when user is creating new account and as we're already
    /// on main screen we need to get user's gallery when xmpp authentication connection
    /// establishes stable connection with kyc server.
    _connSubscription?.cancel();
    _connSubscription = eventBus.on<ServerConnectionEvent>().listen((event) {
      final state = event.connectionState;

      switch (state) {
        case XmppConnectionState.Ready:
          blocMarket.getNftsList();
          break;
        default:

        /// ignore if its null or any other state except defined above
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _connSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      isAppbar: true,
      titleStyle: CustomStyles.appbarTitle,
      backgroundColor: context.homeBackgroundColor,
      isLeading: false,
      title: Strings.gallery,
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

class PurchasedNftList extends StatelessWidget {
  const PurchasedNftList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listState = context.watch<ListTypeCubit>().state;
    final state = context.watch<GalleryCubit>().state as dynamic;

    switch (state.runtimeType) {
      case GalleryFailed:
        return NoDataFound(msg: (state as GalleryFailed).errorMessage);
      case GalleryChange:
      case GallerySuccess:
        final tokens = state.tokens.reversed.toList();

        if (tokens.isEmpty) {
          return const NoDataFound(msg: Strings.noPurchasedNft);
        }

        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: kBottomNavigationBarHeight,
                left: 5.0,
                right: 5.0,
              ),
              sliver: listState is ViewListType
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (_, index) {
                          final item = tokens[index];
                          return ItemGalleryTile(model: item);
                        },
                        childCount: tokens.length,
                      ),
                    )
                  : SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final item = tokens[index];
                          return ItemGalleryGrid(model: item);
                        },
                        childCount: tokens.length,
                      ),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 0.0,
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
