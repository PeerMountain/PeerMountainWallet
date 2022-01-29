import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sodium/flutter_sodium.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/cubits/balance/balance_cubit.dart';
import 'package:kyc3/cubits/cubits.dart';
import 'package:kyc3/di/locator.dart';
import 'package:kyc3/ui/chat_screen/cubit/chat_cubit.dart';
import 'package:kyc3/ui/invoices/invoice_cubit.dart';

import 'kyc3.dart';
import 'services/local_notification_service.dart';
import 'ui/main_screen/contacts/contacts_cubit.dart';
import 'ui/main_screen/gallery/gallery_cubit.dart';
import 'ui/main_screen/marketplace/market_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// initialize sodium library
  Sodium.init();

  /// setup locator and dependency injection
  setupLocator();
  setupDialogsAndSnackBars();

  /// initialize shared preferences
  await Prefs.init();

  /// initialize current device information
  deviceInfoService.init();

  /// initialize hive local database storage
  await Hive.initFlutter();
  hiveStorage.initHiveStorage();

  /// initialize flutter local notifications
  localNotificationService.init();

  hideKeyboard();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit(prefs.getThemeMode())),
        BlocProvider<BottomNavCubit>(create: (_) => BottomNavCubit()),
        BlocProvider<GalleryCubit>(create: (_) => GalleryCubit()),
        BlocProvider<BalanceCubit>(create: (_) => BalanceCubit()),
        BlocProvider<ContactsCubit>(create: (_) => ContactsCubit()),
        BlocProvider<MarketCubit>(create: (_) => MarketCubit()),
        BlocProvider<ChatCubit>(create: (_) => ChatCubit()),
        BlocProvider<InvoiceCubit>(create: (_) => InvoiceCubit()),
      ],
      child: const Kyc3App(),
    ),
  );
}
