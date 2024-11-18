import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class CountryCodePhoneInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(PhoneNumber) onInputChanged;
  final String initialCountry;

  const CountryCodePhoneInput({
    Key? key,
    required this.controller,
    required this.onInputChanged,
    this.initialCountry = 'IN', // Default to 'IN'
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      onInputChanged: onInputChanged,
      textFieldController: controller,
      initialValue: PhoneNumber(isoCode: initialCountry),
      selectorConfig: const SelectorConfig(
        selectorType: PhoneInputSelectorType.BOTTOM_SHEET, // Dropdown style
        useEmoji: true, // Display country flag
      ),
      inputDecoration: InputDecoration(
        labelText: 'Phone Number',
        border: OutlineInputBorder(),
      ),
      formatInput: false,
    );
  }
}
