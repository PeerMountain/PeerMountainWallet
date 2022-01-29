import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/cubits/balance/balance_cubit.dart';
import 'package:kyc3/cubits/cubits.dart';
import 'package:kyc3/ui/chat_screen/cubit/chat_cubit.dart';
import 'package:kyc3/ui/main_screen/contacts/contacts_screen.dart';
import 'package:kyc3/ui/main_screen/conversations/conversations_screen.dart';
import 'package:kyc3/ui/main_screen/gallery/filter/list_type_cubit.dart';
import 'package:kyc3/ui/main_screen/gallery/gallery_cubit.dart';
import 'package:kyc3/ui/main_screen/gallery/gallery_screen.dart';
import 'package:kyc3/ui/main_screen/marketplace/market_place_screen.dart';
import 'package:kyc3/ui/main_screen/settings/settings_screen.dart';
import 'package:kyc3/utils/app_events.dart';
import 'package:kyc3/widgets/base_scaffold.dart';
import 'package:xmpp_stone/xmpp_stone.dart';

import 'marketplace/market_cubit.dart';

class MainScreen extends StatefulWidget {
  /// This flag will be true if we want to call
  /// SearchNftRequest when main screen is loads.
  final bool? sendRequest;

  const MainScreen({Key? key, this.sendRequest}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final pages = <Widget>[
    const GalleryScreen(),
    const ContactsScreen(),
    const MarketplaceScreen(),
    const ConversationsScreen(),
    const SettingsScreen(),
  ];

  @override
  void initState() {
    super.initState();

    initializeCubits();
  }

  /// initialize cubits response subs so that we can
  /// receive server responses in bloc directly.
  void initializeCubits() {
    context.read<BottomNavCubit>().setIndex(0);
    context.read<GalleryCubit>().initSubscription();
    context.read<MarketCubit>().initSubscription();
    context.read<BalanceCubit>().initSubscription();
    context.read<ChatCubit>().initSubscription();

    /// It will be TRUE only when user is coming to main screen
    /// after creating new wallet from sign up screen.
    ///
    /// Otherwise FALSE always.
    if (widget.sendRequest == true) {
      /// Send [ServerConnectionEvent] to request user gallery.
      ///
      /// See more info in [GalleryScreen].
      Future.delayed(const Duration(milliseconds: 1000) /* After 1 second. */, () {
        eventBus.fire(const ServerConnectionEvent(connectionState: XmppConnectionState.Ready));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListTypeCubit>(create: (_) => ListTypeCubit()),
      ],
      child: BaseScaffold(
        isAppbar: false,
        hasNavBar: true,
        child: BlocConsumer<BottomNavCubit, int>(
          builder: (_, state) => pages[state],
          listener: (_, index) {},
        ),
      ),
    );
  }
}
