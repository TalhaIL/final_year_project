import 'package:flutter/material.dart';
import 'package:playbeat/resuableComponents/InputFields/text_field_container.dart';

class RoundedTextField extends StatelessWidget {
  final Icon icon;
  final String hintText;
  final void Function(String) onChanged;

  const RoundedTextField({
    Key? key,
    required this.icon,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          icon: icon,
          iconColor: Colors.deepPurple,
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
