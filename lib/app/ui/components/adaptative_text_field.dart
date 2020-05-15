import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdaptativeTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onSubmitted;
  final TextInputType inputType;
  final List<TextInputFormatter> inputFormatters;
  final TextInputAction textInputAction;
  final String placeholder;

  const AdaptativeTextField({
    Key key,
    this.controller,
    this.onSubmitted,
    this.inputType,
    this.inputFormatters,
    this.textInputAction,
    this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextField(
            controller: controller,
            inputFormatters: inputFormatters,
            keyboardType: inputType,
            onSubmitted: onSubmitted,
            textInputAction: textInputAction,
            placeholder: placeholder,
          )
        : TextField(
            controller: controller,
            decoration: InputDecoration(labelText: placeholder),
            inputFormatters: inputFormatters,
            keyboardType: inputType,
            onSubmitted: onSubmitted,
            textInputAction: textInputAction,
          );
  }
}
