import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/widgets/widgets.dart';

class NoRouteFoundScreen extends StatelessWidget {
  const NoRouteFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: NoDataFound(msg: Strings.noRouteFound));
  }
}
