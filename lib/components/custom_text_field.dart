import 'package:flutter/material.dart';

// ignore: must_be_immutable
class InputField extends StatelessWidget {
  String? label;
  bool? hidden;
  TextInputType? typeOfKeyboard;
  TextEditingController? controller;
  InputField(
      {super.key,
      this.label,
      this.typeOfKeyboard,
      this.controller,
      this.hidden = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: hidden ?? true,
      keyboardType: typeOfKeyboard,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color.fromARGB(255, 223, 233, 238),
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 239, 245, 248),
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 239, 245, 248),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(
            color: Colors.transparent,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
