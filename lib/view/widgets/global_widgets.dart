import 'package:flutter/material.dart';

class FilledButtonWidget extends StatelessWidget {
  const FilledButtonWidget(
      {super.key, required this.buttontext, required this.onPressedButton});
  final String buttontext;
  final VoidCallback onPressedButton;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressedButton,
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.black),
          foregroundColor: MaterialStatePropertyAll(Colors.white)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 11),
        child: Text(buttontext),
      ),
    );
  }
}

class SignupTextFormWidget extends StatelessWidget {
  const SignupTextFormWidget({
    super.key,
    required this.hinttext,
    this.controller,
    this.validator,
  });
  final String hinttext;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
          cursorColor: Colors.black,
          controller: controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15)),
              fillColor: Colors.grey[250],
              filled: true,
              hintText: hinttext,
              hintStyle: const TextStyle(fontSize: 13)),
          validator: validator),
    );
  }
}

class MainImageWidget extends StatelessWidget {
  const MainImageWidget({
    super.key,
    required this.imagepath,
  });
  final String imagepath;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Image.asset(
        imagepath,
        width: 600,
        height: 293,
      ),
    );
  }
}

class SearchFormField extends StatelessWidget {
  const SearchFormField({
    super.key,
    required this.hintText,
    this.onchanged,
  });
  final String hintText;
  final void Function(String)? onchanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 12),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.grey))),
      cursorColor: Colors.black,
    );
  }
}
