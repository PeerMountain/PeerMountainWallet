import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';
import 'package:stacked_services/stacked_services.dart';

import '../widgets.dart';

class PMOErrorDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const PMOErrorDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.only(left: 18, right: 18, bottom: 24.0, top: 24.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0, top: 10.0),
            child: Image.asset(
              Assets.imagesError,
              width: 65,
              height: 65,
            ),
          ),
          Texts(
            request.title!,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18.0),
          ),
          const SizedBox(height: 12.0),
          if (request.description != null)
            Texts(
              request.description!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(color: context.subtitleColor),
            ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: FilledButton(
            text: request.mainButtonTitle ?? Strings.ok.toUpperCase(),
            onTap: () {
              completer.call(DialogResponse(confirmed: true, data: 'ok'));
            },
          ),
        ),
      ],
    );
  }
}
