import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/widgets/widgets.dart';

import 'locator.config.dart';

final locator = GetIt.instance;

@injectableInit
void setupLocator() => $initGetIt(locator);

/// The type of dialog to show
enum DialogType { error, success }

void setupDialogsAndSnackBars() {
  final builders = {
    DialogType.error: (context, request, completer) => PMOErrorDialog(
          request: request,
          completer: completer,
        ),
    DialogType.success: (context, request, completer) => PMOSuccessDialog(
          request: request,
          completer: completer,
        ),
  };

  /// register all dialogs
  dialogService.registerCustomDialogBuilders(builders);
}
