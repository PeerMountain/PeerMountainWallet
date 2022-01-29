import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/cubits/balance/balance_cubit.dart';
import 'package:kyc3/ui/deposit/allowance_balance_widget.dart';
import 'package:kyc3/ui/deposit/current_balance_widget.dart';
import 'package:kyc3/widgets/widgets.dart';

import 'minted_balance_widget.dart';

class DepositAmountScreen extends StatefulWidget {
  const DepositAmountScreen({Key? key}) : super(key: key);

  @override
  _DepositAmountScreenState createState() => _DepositAmountScreenState();
}

class _DepositAmountScreenState extends State<DepositAmountScreen> {
  final tcAmount = TextEditingController();
  final fcAmount = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    fcAmount.dispose();
    tcAmount.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: Strings.deposit,
      resizeToAvoidBottomInset: false,
      child: ListView(
        children: [
          _TopDepositLayout(
            focusNode: fcAmount,
            controller: tcAmount,
          ),
        ],
      ),
    );
  }
}

class _TopDepositLayout extends StatefulWidget {
  final FocusNode focusNode;
  final TextEditingController controller;

  const _TopDepositLayout({
    Key? key,
    required this.focusNode,
    required this.controller,
  }) : super(key: key);

  @override
  __TopDepositLayoutState createState() => __TopDepositLayoutState();
}

class __TopDepositLayoutState extends State<_TopDepositLayout> {
  final _formKey = GlobalKey<FormState>();
  final suggestions = ["100", "500", "1000", "2500"];

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_listener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_listener);
    super.dispose();
  }

  void _listener() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: p20,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),
            const MintedBalanceWidget(),
            SizedBox(height: screenHeight * 0.02),
            const AllowanceBalanceWidget(),
            SizedBox(height: screenHeight * 0.05),
            const CurrentBalanceWidget(),
            SizedBox(height: screenHeight * 0.05),
            _amountTextField(),
            SizedBox(height: screenHeight * 0.03),
            _suggestedAmounts(),
            SizedBox(height: screenHeight * 0.03),
            _minAndMaxWidget(),
            SizedBox(height: screenHeight * 0.03),
            _depositButton(),
          ],
        ),
      ),
    );
  }

  Widget _amountTextField() {
    return SizedBox(
      height: 110,
      child: TextFormFieldWidget(
        controller: widget.controller,
        focusNode: widget.focusNode,
        label: Strings.enterAmount,
        hintText: Strings.minAmountHint,
        textInputType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r"^\d+(\.\d)?\d*$")),
        ],
        textInputAction: TextInputAction.done,
        errorText: getErrorText(),
      ),
    );
  }

  Widget _suggestedAmounts() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: suggestions
            .map(
              (e) => InkWell(
                onTap: () => addValue(e),
                splashFactory: NoSplash.splashFactory,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Chip(
                  label: Texts("+$e"),
                  padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _minAndMaxWidget() {
    return Texts(
      Strings.minAmountErrorTextField,
      textAlign: TextAlign.center,
      style: context.textTheme.bodyText2?.copyWith(fontSize: 14.0),
    );
  }

  Widget _depositButton() {
    return FilledButton(
      onTap: deposit,
      text: Strings.deposit,
    );
  }

  String? getErrorText() {
    if (widget.focusNode.hasFocus) {
      final value = widget.controller.text.trim();
      if (value.isEmpty || value.toDouble() < 1.0 || value.toDouble() > 100000.00) {
        return Strings.minAmountError;
      } else {
        return null;
      }
    }
  }

  void addValue(String value) {
    if (!widget.focusNode.hasFocus) {
      widget.focusNode.requestFocus();
    }
    if (widget.controller.text.isNotEmpty) {
      final previous = widget.controller.text;
      try {
        num previousNum = num.parse(previous);
        previousNum += num.parse(value);
        widget.controller.text = previousNum.toString();
      } catch (e) {
        widget.controller.text = previous;
      }
    } else {
      widget.controller.text = value;
    }
    widget.controller.selection =
        TextSelection.fromPosition(TextPosition(offset: widget.controller.text.length));
  }

  void deposit() async {
    final amount = widget.controller.text.trim();

    if (amount.isEmpty) {
      return;
    }

    if (amount.toDouble() < 1.0 || amount.toDouble() > 100000) {
      return;
    }

    hideKeyboard(context);

    showLoader();
    final result = await context.read<BalanceCubit>().sendDepositRequest(amount.toInt());
    hideLoader();
    if (result == true) {
      widget.controller.clear();
    } else {
      /// error has been handled in bloc already
    }
  }
}
