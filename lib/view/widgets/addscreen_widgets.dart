import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddFormField extends StatelessWidget {
  const AddFormField(
      {super.key,
      required this.hintText,
      this.controller,
      this.validator,
      required this.keyboardType,
      this.inputformat,
      this.maxLength});

  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final String? inputformat;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: TextFormField(
        maxLength: maxLength,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(inputformat!))
        ],
        keyboardType: keyboardType,
        cursorColor: Colors.black,
        controller: controller,
        decoration: InputDecoration(
            counterText: '',
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2)),
            hintText: hintText,
            hintStyle: const TextStyle(fontSize: 12)),
        validator: validator,
      ),
    );
  }
}
