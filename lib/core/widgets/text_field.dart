import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    this.maxLength,
    this.validator,
    this.errorMessage,
    this.fillColor,
    this.onChanged,
    this.hintColor,
    this.maxLines,
    this.contentPadding,
  });
  final String hintText;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final int? maxLength;
  final Function? validator;
  final String? errorMessage;
  final Color? fillColor;
  final Function(String)? onChanged;
  final Color? hintColor;
  final int? maxLines;
  final EdgeInsetsGeometry? contentPadding;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    final kSize = MediaQuery.of(context).size;
    return TextFormField(
      maxLines: widget.maxLines,
      textCapitalization: TextCapitalization.none,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(fontSize: 18, color: Colors.black),
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      readOnly: false,
      cursorColor: Colors.black,
      onChanged: widget.onChanged,
      validator: (value) {
        if (widget.validator != null && !widget.validator!(value)) {
          return widget.errorMessage;
        }
        return null;
      },
      decoration: InputDecoration(
          hoverColor: Colors.transparent,
          isCollapsed: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          counter: const SizedBox(),
          fillColor: Colors.white,
          filled: true,
          isDense: true,
          hintText: widget.hintText,
          hintStyle:
              TextStyle(fontSize: kSize.height * 0.021, color: Colors.grey)),
    );
  }
}
