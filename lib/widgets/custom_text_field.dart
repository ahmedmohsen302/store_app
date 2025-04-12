import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    this.onChanged,
    this.obsecureText = false,
    this.keyboardType,
  });
  final String hintText;
  final String labelText;
  Function(String)? onChanged;
  final bool obsecureText;
  TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obsecureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        label: Text(labelText),
        alignLabelWithHint: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(gapPadding: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          gapPadding: 20,
        ),
      ),
    );
  }
}
