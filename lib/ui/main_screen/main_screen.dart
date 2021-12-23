import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyc3/cubits/balance/balance_cubit.dart';
import 'package:kyc3/cubits/cubits.dart';
import 'package:kyc3/ui/main_screen/contacts/contacts_screen.dart';
import 'package:kyc3/ui/main_screen/conversations/conversations_screen.dart';
import 'package:kyc3/ui/main_screen/gallery/filter/list_type_cubit.dart';
import 'package:kyc3/ui/main_screen/gallery/gallery_cubit.dart';
import 'package:kyc3/ui/main_screen/gallery/gallery_screen.dart';
import 'package:kyc3/ui/main_screen/marketplace/market_place_screen.dart';
import 'package:kyc3/ui/main_screen/settings/settings_screen.dart';
import 'package:kyc3/widgets/base_scaffold.dart';

import 'marketplace/market_cubit.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

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
    context.read<GalleryCubit>().initSubscription();
    context.read<MarketCubit>().initSubscription();
    context.read<BalanceCubit>().initSubscription();
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
