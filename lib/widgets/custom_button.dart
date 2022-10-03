import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function buttonCta;
  final String buttonText;
  const CustomButton(
      {required this.buttonText, required this.buttonCta, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: ElevatedButton(
          onPressed: () => buttonCta,
          child: Center(
            child: Text(buttonText),
          )),
    );
  }
}
