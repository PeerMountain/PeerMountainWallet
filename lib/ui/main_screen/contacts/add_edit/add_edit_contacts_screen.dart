import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';
import 'package:kyc3/models/hive_adapters/contact/kyc_contact.dart';
import 'package:kyc3/utils/app_utils.dart';
import 'package:kyc3/utils/validations.dart';
import 'package:kyc3/widgets/widgets.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class AddOrEditContactsScreen extends StatefulWidget {
  final bool isMe;
  final bool? isNew;
  final String? title;
  final KycContact? contact;

  const AddOrEditContactsScreen({
    Key? key,
    this.contact,
    required this.isMe,
    this.title,
    this.isNew,
  }) : super(key: key);

  @override
  _AddOrEditContactsScreenState createState() => _AddOrEditContactsScreenState();
}

class _AddOrEditContactsScreenState extends State<AddOrEditContactsScreen> {
  final tcAddress = TextEditingController();
  final tcNickname = TextEditingController();
  final tcFullname = TextEditingController();

  final fcAddress = FocusNode();
  final fcNickname = FocusNode();
  final fcFullname = FocusNode();

  String? fileName, filePath, barcode;
  File? pickedFile;

  num? _trustLevel = 0;

  @override
  void initState() {
    super.initState();

    initData();
  }

  void initData() {
    if (widget.contact != null) {
      final contact = widget.contact!;
      tcAddress.text = contact.blockchainAddress!;
      tcNickname.text = contact.nickName!;
      tcFullname.text = contact.fullName!;
      _trustLevel = contact.trustLevel;
      filePath = contact.image;
      barcode = contact.blockchainAddress;
    }

    if (widget.isMe) {
      tcAddress.text = cryptoAccount.address!;
    }
  }

  @override
  void dispose() {
    super.dispose();

    tcAddress.dispose();
    tcNickname.dispose();
    tcFullname.dispose();
    fcAddress.dispose();
    fcNickname.dispose();
    fcFullname.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      titleStyle: CustomStyles.appbarTitle,
      title: widget.title ?? Strings.newContact,
      backgroundColor: context.homeBackgroundColor,
      actions: [
        if (widget.isMe == false)
          IconButton(
            onPressed: scanBarcode,
            icon: const SvgImage(
              Assets.svgBarcode,
              width: 24.0,
            ),
          ),
      ],
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: p8,
              children: [
                h20,
                ProfileImage(
                  width: 120.0,
                  height: 120.0,
                  radius: 60.0,
                  onTap: pickImage,
                  imageFile: filePath,
                ),
                const SizedBox(height: 28),
                _contactForm(),
              ],
            ),
          ),
          _saveButton(),
        ],
      ),
    );
  }

  Card _contactForm() {
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0, bottom: 20.0),
        child: Form(
          child: Column(
            children: [
              _addressTextField(),
              h30,
              _nickNameTextField(),
              h30,
              _fullNameTextField(),
              h30,
              _trustLevelBar(),
            ],
          ),
        ),
      ),
    );
  }

  TextFormFieldWidget _addressTextField() {
    return TextFormFieldWidget(
      controller: tcAddress,
      focusNode: fcAddress,
      autoCorrect: false,
      readOnly: widget.isMe == true,
      label: Strings.blockChainAddress,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (v) => changeFocus(context, fcAddress, fcNickname),
    );
  }

  TextFormFieldWidget _nickNameTextField() {
    return TextFormFieldWidget(
      controller: tcNickname,
      focusNode: fcNickname,
      label: Strings.nickName,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (v) => changeFocus(context, fcNickname, fcFullname),
    );
  }

  TextFormFieldWidget _fullNameTextField() {
    return TextFormFieldWidget(
      controller: tcFullname,
      focusNode: fcFullname,
      label: Strings.fullname,
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (v) => hideKeyboard(context),
    );
  }

  Column _trustLevelBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Label(Strings.trustLevel),
        h5,
        RatingBar.builder(
          minRating: 0,
          itemCount: 5,
          itemSize: 24.0,
          initialRating: _trustLevel?.toDouble() ?? 0,
          ignoreGestures: false,
          allowHalfRating: true,
          direction: Axis.horizontal,
          unratedColor: Colors.grey[400],
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: context.primaryColor,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              _trustLevel = rating;
            });
          },
        ),
      ],
    );
  }

  FilledButton _saveButton() {
    return FilledButton(
      onTap: saveContactToLocalStorage,
      margin: p20.copyWith(top: 8.0),
      text: Strings.save,
    );
  }

  void saveContactToLocalStorage() async {
    final address = tcAddress.text.trim().removeSpaces();
    final nickname = tcNickname.text.trim();
    final fullname = tcFullname.text.trim();

    if (!validator.isValidEthFormat(address)) {
      showErrorSnackbar('Please enter valid ethereum address');
      return;
    }

    if (nickname.isEmpty) {
      showErrorSnackbar('Please enter nick name');
      return;
    }

    if (!validator.isValidName(nickname, allowNumbers: true)) {
      showErrorSnackbar('Please enter valid nick name');
      return;
    }

    if (fullname.isEmpty) {
      showErrorSnackbar('Please enter full name');
      return;
    }

    if (!validator.isValidName(fullname, allowNumbers: true)) {
      showErrorSnackbar('Please enter valid full name');
      return;
    }

    hideKeyboard(context);

    /// if user is setting up his/her own profile then save that
    /// data to local storage and ignore other operations
    if (widget.isMe == true) {
      final contact = widget.contact ?? KycContact()
        ..blockchainAddress = address
        ..jid = address.addXmppKycHost()
        ..nickName = nickname
        ..fullName = fullname
        ..image = filePath
        ..trustLevel = _trustLevel;
      if (widget.contact == null) {
        hiveStorage.addUser(contact);
        showSuccessSnackbar("Profile saved successfully!");
      } else {
        hiveStorage.updateUser(contact);
        showSuccessSnackbar("Profile updated successfully!");
      }
      return;
    }

    /// if its NULL then it means user is adding new contact
    /// if its NOT then it should update current contact in storage

    if (widget.isNew == true) {
      final newContact = KycContact()
        ..jid = address.addXmppKycHost()
        ..ownerJid = cryptoAccount.address!.addXmppKycHost()
        ..blockchainAddress = address
        ..nickName = nickname
        ..fullName = fullname
        ..image = filePath
        ..trustLevel = _trustLevel;
      await hiveStorage.addContact(newContact);
      showSuccessSnackbar("Contact saved successfully!");
      tcAddress.clear();
      tcNickname.clear();
      tcFullname.clear();
      _trustLevel = 0;
      filePath = null;
      setState(() {});
    } else {
      final contact = widget.contact!
        ..jid = address.addXmppKycHost()
        ..ownerJid = cryptoAccount.address!.addXmppKycHost()
        ..blockchainAddress = address
        ..nickName = nickname
        ..fullName = fullname
        ..image = filePath
        ..trustLevel = _trustLevel;
      await hiveStorage.updateContact(contact);
      showSuccessSnackbar("Contact updated successfully!");
    }
  }

  void pickImage() async {
    try {
      hideKeyboard(context);
      final source = await showCupertinoModalPopup(
        context: context,
        builder: (_) => const CupertinoSelectImageActionSheet(),
      );

      showLog("selected image source =====>>> $source");
      if (source != null) {
        final image = await Utils.pickImage(source);

        /// if its not null then we will surely have file
        /// and its attributes in result data
        if (image != null) {
          pickedFile = image['file'];
          fileName = image['file_name'];
          filePath = image['file_path'];

          setState(() {});
        }
      }
    } catch (e, stackTrace) {
      showLog("pickImage exception =====>>> $e");
      showLog("pickImage exception stackTrace =====>>> $stackTrace");
    }
  }

  void scanBarcode() async {
    hideKeyboard(context);
    final result = await navigationService.navigateTo(
      Routes.scanContactQrCode.value,
      arguments: StringOnlyArguments(barcode: barcode),
    );

    if (result != null && result is Barcode) {
      tcAddress.text = result.code!.removeAllWhiteSpace();
      barcode = tcAddress.text;
    }
  }
}
