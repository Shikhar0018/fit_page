import 'package:flutter/material.dart';

class IndicatorTextField extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int defaultValue;

  const IndicatorTextField(
      {super.key, required this.minValue, required this.maxValue, required this.defaultValue});

  @override
  IndicatorTextFieldState createState() => IndicatorTextFieldState();
}

class IndicatorTextFieldState extends State<IndicatorTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.defaultValue.toString();
  }

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    }
    final double? numValue = double.tryParse(value);
    if (numValue == null) {
      return 'Please enter a valid number';
    }
    if (numValue < widget.minValue) {
      return 'Value must be at least ${widget.minValue}';
    }
    if (numValue > widget.maxValue) {
      return 'Value must not exceed ${widget.maxValue}';
    }
    return null; // means input is valid
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: _controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: const InputDecoration(
        labelText: 'Enter value',
        border: OutlineInputBorder(),
        errorStyle: TextStyle(color: Colors.redAccent),
      ),
      validator: _validateInput,
    );
  }
}
