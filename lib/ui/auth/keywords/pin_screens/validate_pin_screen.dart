import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/widgets/base_scaffold.dart';
import 'package:kyc3/widgets/button_widgets.dart';
import 'package:kyc3/widgets/svg_image.dart';
import 'package:kyc3/widgets/text_field_widget.dart';

class ValidatePinScreen extends StatefulWidget {
  const ValidatePinScreen({Key? key}) : super(key: key);

  @override
  _ValidatePinScreenState createState() => _ValidatePinScreenState();
}

class _ValidatePinScreenState extends State<ValidatePinScreen> {
  final fcPin = FocusNode();
  final tcPin = TextEditingController();

  bool obscurePin = true;

  String? userPin;

  @override
  void initState() {
    super.initState();
    secureStorage.readPin().then((value) {
      userPin = value;
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    fcPin.dispose();
    tcPin.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: Strings.verifyPin,
      child: ListView(
        padding: p20,
        children: [
          CircleAvatar(
            backgroundColor: context.subtitleColor,
            radius: 50,
            child: const Icon(
              Icons.lock,
              size: 40,
            ),
          ),
          const SizedBox(height: 50),
          TextFormFieldWidget(
            focusNode: fcPin,
            controller: tcPin,
            label: Strings.enterYourPin,
            maxLength: 6,
            isObscure: obscurePin,
            textInputType: const TextInputType.numberWithOptions(
              decimal: false,
              signed: false,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscurePin = !obscurePin;
                });
              },
              icon: SvgImage(
                obscurePin ? Assets.svgOpenEye : Assets.svgHiddenEye,
                width: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 50),
          FilledButton(
            onTap: validatePin,
            text: Strings.verify,
          ),
        ],
      ),
    );
  }

  void validatePin() async {
    assert(userPin != null);

    final newPin = tcPin.text.trim();

    if (newPin != userPin) {
      showErrorSnackbar("Invalid pin!");
      return;
    }

    /// All good now we can continue here
    secureStorage.savePin(newPin).then((value) {
      Navigator.of(context).pop(true);
    });
  }
}
