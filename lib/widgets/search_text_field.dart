import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kyc3/app/app.dart';

import 'text_field_widget.dart';

class SearchTextField extends StatefulWidget {
  final String? hint;
  final Widget? suffixIcon;
  final Function(String)? onChanged;
  final TextEditingController controller;

  const SearchTextField({
    Key? key,
    required this.controller,
    this.onChanged,
    this.hint,
    this.suffixIcon,
  }) : super(key: key);

  @override
  _SearchTextFieldState createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  Timer? debouncer;

  bool isRequested = false;

  @override
  Widget build(BuildContext context) {
    return TextFormFieldWidget(
      hintText: widget.hint ?? "Search",
      controller: widget.controller,
      textInputType: TextInputType.text,
      actionKeyboard: TextInputAction.done,
      onChanged: onSearchInputChange,
      hasDecoration: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: context.borderColor),
        borderRadius: BorderRadius.circular(30),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: context.borderColor),
        borderRadius: BorderRadius.circular(30),
      ),
      prefixIcon: Icon(Icons.search, color: context.primaryColor),
      maxLines: 1,
      filled: true,
      filledColor: context.bottomBarColor,
      contentPadding: const EdgeInsetsDirectional.all(13.0),
      onFieldSubmitted: (v) {},
    );
  }

  void onSearchInputChange(String value) {
    if (value.trim().removeSpaces().isEmpty) {
      debouncer?.cancel();
      if (isRequested == false) {
        isRequested = true;
        widget.onChanged?.call(value.trim());
      }
      return;
    }

    if (debouncer?.isActive ?? false) {
      debouncer!.cancel();
    }

    debouncer = Timer(const Duration(milliseconds: 500), () {
      isRequested = false;
      widget.onChanged?.call(value.trim());
    });
  }
}
