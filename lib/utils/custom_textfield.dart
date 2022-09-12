import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String labelText;
  IconButton? trailingIcon;
  Widget? prefixIcon;
  Color? fillColor;
  TextEditingController? controller;
  bool obsecureText;
  TextInputType? keyBoard;
  CustomTextField(
      {Key? key,
      required this.labelText,
      this.trailingIcon,
      this.prefixIcon,
      this.fillColor,
      this.controller,
      required this.obsecureText,
      this.keyBoard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        obscureText: obsecureText,
        controller: controller,
        keyboardType: keyBoard,
        decoration: InputDecoration(
          filled: true,
          suffixIcon: Padding(
            padding: const EdgeInsetsDirectional.only(end: 12.0),
            child: trailingIcon,
          ),
          prefixIcon: prefixIcon,
          labelText: labelText,
          fillColor: fillColor ?? Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
