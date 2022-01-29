import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:kyc3/app/app.dart';

class SecureScreen extends StatelessWidget {
  final bool isSecure;
  final Widget child;

  const SecureScreen({
    Key? key,
    required this.child,
    this.isSecure = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isSecure) {
      return child;
    }
    return FocusedScreen(
      onFocusGained: () => secureScreen(),
      onFocusLost: () => unsecureScreen(),
      child: child,
    );
  }
}

class FocusedScreen extends StatefulWidget {
  final Widget child;
  final VoidCallback? onFocusGained;
  final VoidCallback? onFocusLost;
  final VoidCallback? onFocusGainedWithinApp;
  final VoidCallback? onFocusLostInApp;

  const FocusedScreen({
    Key? key,
    required this.child,
    this.onFocusGained,
    this.onFocusLost,
    this.onFocusGainedWithinApp,
    this.onFocusLostInApp,
  }) : super(key: key);

  @override
  _FocusedScreenState createState() => _FocusedScreenState();
}

class _FocusedScreenState extends State<FocusedScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusLost: () {
        widget.onFocusLost?.call();
      },
      onFocusGained: () {
        widget.onFocusGained?.call();
      },
      onVisibilityLost: () {
        widget.onFocusLost?.call();
        widget.onFocusLostInApp?.call();
      },
      onVisibilityGained: () {
        widget.onFocusGained?.call();
        widget.onFocusGainedWithinApp?.call();
      },
      onForegroundLost: () {
        widget.onFocusLost?.call();
      },
      onForegroundGained: () {
        widget.onFocusGained?.call();
      },
      child: widget.child,
    );
  }
}
