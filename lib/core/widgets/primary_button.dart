import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key, required this.label, required this.onPressed});
  final String label;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    final kSize = MediaQuery.of(context).size;
    return SizedBox(
      height: 50,
      width: kSize.width,
      child: TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.black),
          onPressed: onPressed,
          child: Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          )),
    );
  }
}
