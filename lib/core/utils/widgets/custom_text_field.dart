import 'package:flutter/material.dart';

import '../../../constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.maxLines = 1,
      this.iconData,
      this.onSaved,
      this.onChanged,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.labelText = "",
      this.onPressedIcon,
      this.suffixIcon,
      required this.textEditingController,
      this.autofocus = false,
      this.decoration,
       this.enabled = true});

  final String hintText;
  final TextEditingController textEditingController;
  final int maxLines;
  final String labelText;
  final void Function()? onPressedIcon;
  final IconData? iconData, suffixIcon;
  final TextInputType keyboardType;
  final void Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final bool obscureText;
  final bool autofocus;
  final bool enabled;
  final InputDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      onSaved: onSaved,
      onChanged: onChanged,
      obscureText: obscureText,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Filed is required";
        } else {
          return null;
        }
      },
      enabled: enabled,
      cursorColor: kColor,
      autofocus: autofocus,
      maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          border: buildOutlineInputBorder(),
          // enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(color: kColor),
          prefixIcon: Icon(
            iconData,
            color: tColor,
          ),
          hintText: hintText,
          labelStyle: const TextStyle(color: tColor),
          labelText: labelText,
          suffixIcon: IconButton(
              icon: Icon(
                suffixIcon,
                color: tColor,
              ),
              onPressed: onPressedIcon),
          hintStyle: const TextStyle(
            color: tColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          )),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: color ?? Colors.white,
        ));
  }
}
