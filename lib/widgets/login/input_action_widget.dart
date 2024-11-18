// widget/input_action_widget.dart
import 'package:flutter/material.dart';

class InputActionWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const InputActionWidget({
    Key? key,
    required this.controller,
    required this.labelText,
    required this.buttonText,
    required this.onButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(labelText: labelText),
          keyboardType: TextInputType.text,
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: onButtonPressed,
          child: Text(buttonText),
        ),
      ],
    );
  }
}
