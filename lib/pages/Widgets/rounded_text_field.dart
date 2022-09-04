import 'package:flutter/material.dart';
import 'package:playbeat/pages/Widgets/text_field_container.dart';

class RoundedTextField extends StatelessWidget {
  final Icon icon;
  final String hintText;
  final String? Function(String?)? validator;
  final void Function(String) onChanged;

  const RoundedTextField({
    Key? key,
    required this.icon,
    required this.hintText,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: icon,
          iconColor: Colors.deepPurple,
          hintText: hintText,
          border: InputBorder.none,
        ),
        validator: validator,
      ),
    );
  }
}