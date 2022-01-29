import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';

enum LoaderPlatform { android, ios }

class NativeLoader extends StatelessWidget {
  final double scale;
  final Color valueColor;
  final LoaderPlatform? platform;

  const NativeLoader({
    Key? key,
    this.scale = 1.0,
    this.valueColor = Palette.accentColor,
    this.platform,
  }) : super(key: key);

  const NativeLoader.android({
    Key? key,
    this.valueColor = Palette.accentColor,
    this.scale = 1.0,
  })  : platform = LoaderPlatform.android,
        super(key: key);

  const NativeLoader.ios({
    Key? key,
    this.valueColor = Palette.accentColor,
    this.scale = 1.0,
  })  : platform = LoaderPlatform.ios,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isAndroid = Platform.isAndroid;

    /// null = PlatformSpecific meaning native loader will be shown
    if (platform != null) {
      isAndroid = platform == LoaderPlatform.android;
    }

    return Transform.scale(
      scale: scale,
      child: Center(
        child: isAndroid
            ? const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Palette.accentColor),
              )
            : const CupertinoActivityIndicator(),
      ),
    );
  }
}

class APILoader extends StatefulWidget {
  const APILoader({Key? key}) : super(key: key);

  @override
  _APILoaderState createState() => _APILoaderState();
}

class _APILoaderState extends State<APILoader> {
  @override
  Widget build(BuildContext context) {
    return const NativeLoader.android();
  }
}
