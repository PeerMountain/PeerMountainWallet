import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kyc3/app/app.dart';

import '../widgets.dart';

class CupertinoSelectImageActionSheet extends StatelessWidget {
  const CupertinoSelectImageActionSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      title: const Texts(
        Strings.chooseOptions,
        fontSize: 17.0,
        fontWeight: FontWeight.w600,
        height: 1.3,
        letterSpacing: -0.5,
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Texts(
            Strings.camera,
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context, ImageSource.camera);
          },
        ),
        CupertinoActionSheetAction(
          child: Texts(
            Strings.gallery,
            fontSize: 20.0,
            fontWeight: FontWeight.w400,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.pop(context, ImageSource.gallery);
          },
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: const Text(Strings.cancel),
        isDefaultAction: true,
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
