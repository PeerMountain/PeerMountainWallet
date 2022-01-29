import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/utils/export_utils.dart';
import 'package:kyc3/widgets/base_scaffold.dart';
import 'package:kyc3/widgets/button_widgets.dart';
import 'package:kyc3/widgets/svg_image.dart';
import 'package:kyc3/widgets/text_field_widget.dart';

class CreateOrChangePinScreen extends StatefulWidget {
  /// This flag will be true if user is creating a new pin
  /// and false if he is changing is old pin to new pin
  final bool isNew;

  const CreateOrChangePinScreen({
    Key? key,
    required this.isNew,
  }) : super(key: key);

  @override
  _CreateOrChangePinScreenState createState() => _CreateOrChangePinScreenState();
}

class _CreateOrChangePinScreenState extends State<CreateOrChangePinScreen> {
  final fcOld = FocusNode();
  final fcNew = FocusNode();
  final fcConfirm = FocusNode();

  final tcOld = TextEditingController();
  final tcNew = TextEditingController();
  final tcConfirm = TextEditingController();

  bool obscureOld = true, obscureNew = true, obscureConfirm = true;

  String? userPin;

  @override
  void initState() {
    super.initState();
    if (!widget.isNew) {
      secureStorage.readPin().then((value) {
        userPin = value;
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    fcOld.dispose();
    tcOld.dispose();
    fcNew.dispose();
    fcConfirm.dispose();
    tcNew.dispose();
    tcConfirm.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isNew = widget.isNew;

    return BaseScaffold(
      title: isNew ? Strings.createPin : Strings.changePin,
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
          if (!isNew)
            TextFormFieldWidget(
              focusNode: fcOld,
              controller: tcOld,
              label: Strings.oldPin,
              maxLength: 6,
              isObscure: obscureOld,
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
                    obscureOld = !obscureOld;
                  });
                },
                icon: SvgImage(
                  obscureOld ? Assets.svgOpenEye : Assets.svgHiddenEye,
                  width: 20,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              onFieldSubmitted: (v) {
                changeFocus(context, fcNew, fcConfirm);
              },
            ),
          if (!isNew) h20,
          TextFormFieldWidget(
            focusNode: fcNew,
            controller: tcNew,
            label: Strings.newPin,
            maxLength: 6,
            isObscure: obscureNew,
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
                  obscureNew = !obscureNew;
                });
              },
              icon: SvgImage(
                obscureNew ? Assets.svgOpenEye : Assets.svgHiddenEye,
                width: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
            onFieldSubmitted: (v) {
              changeFocus(context, fcNew, fcConfirm);
            },
          ),
          h20,
          TextFormFieldWidget(
            focusNode: fcConfirm,
            controller: tcConfirm,
            label: Strings.confirmPin,
            maxLength: 6,
            isObscure: obscureConfirm,
            textInputAction: TextInputAction.done,
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
                  obscureConfirm = !obscureConfirm;
                });
              },
              icon: SvgImage(
                obscureConfirm ? Assets.svgOpenEye : Assets.svgHiddenEye,
                width: 20,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 50),
          FilledButton(
            onTap: validatePin,
            text: isNew ? Strings.create : Strings.change,
          ),
        ],
      ),
    );
  }

  void validatePin() async {
    final oldPin = tcOld.text.trim();
    final newPin = tcNew.text.trim();
    final confirmPin = tcConfirm.text.trim();

    if (!widget.isNew) {
      if (oldPin.length < 6) {
        showErrorSnackbar("Please enter valid old pin!");
        return;
      }
    }

    if (newPin.length < 6) {
      showErrorSnackbar("Minimum length for pin is 6 digits!");
      return;
    }

    if (!validator.numeric.hasMatch(newPin)) {
      showErrorSnackbar("Only numbers are allowed in pin input!");
      return;
    }

    if (confirmPin != newPin) {
      showErrorSnackbar("Confirm pin doesn't match!");
      return;
    }

    if (!widget.isNew) {
      if (userPin != oldPin) {
        showErrorSnackbar("Old pin doesn't match!");
        return;
      }
    }

    hideKeyboard(context);

    /// All good now we can save users pin in secure storage
    /// and complete user signup / create pin / change pin
    secureStorage.savePin(newPin).then((value) {
      if (widget.isNew) {
        Navigator.of(context).pop(true);
      } else {
        showSuccessSnackbar("Pin has been changed successfully!");
        tcOld.clear();
        tcNew.clear();
        tcConfirm.clear();
      }
    });
  }
}
