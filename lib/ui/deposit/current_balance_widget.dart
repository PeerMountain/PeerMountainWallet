import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/cubits/balance/balance_cubit.dart';
import 'package:kyc3/widgets/widgets.dart';

class CurrentBalanceWidget extends StatefulWidget {
  const CurrentBalanceWidget({Key? key}) : super(key: key);

  @override
  State<CurrentBalanceWidget> createState() => _CurrentBalanceWidgetState();
}

class _CurrentBalanceWidgetState extends State<CurrentBalanceWidget> {
  Future<List<dynamic>?>? _future;

  @override
  void initState() {
    super.initState();
    _future = context.read<BalanceCubit>().checkPmtnBalance();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Texts(
          Units.pmtn,
          textAlign: TextAlign.center,
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
        ),
        BlocConsumer<BalanceCubit, BalanceState>(
          listener: (context, state) {
            if (state.status == BalanceCubitState.requestBalance) {
              setState(() {
                _future = context.read<BalanceCubit>().checkPmtnBalance();
              });
            }
          },
          builder: (context, state) {
            return FutureBuilder<List<dynamic>?>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final balance = snapshot.data?[0] ?? 0.0;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Texts(
                      balance.toString(),
                      textAlign: TextAlign.center,
                      fontSize: 34.0,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                } else if (snapshot.hasError) {
                  return const Icon(Icons.error_outline);
                } else {
                  return const NativeLoader(scale: 0.8);
                }
              },
            );
          },
        ),
        h5,
        Texts(
          " ${Strings.currentBalance}".toUpperCase(),
          textAlign: TextAlign.center,
          style: context.textTheme.bodyText2?.copyWith(fontSize: 14.0),
        ),
      ],
    );
  }
}
