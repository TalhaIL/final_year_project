import 'package:flutter/material.dart';
import 'package:playbeat/resuableComponents/InputFields/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final bool isVisible;
  final Icon icon;
  final String hintText;
  final void Function(String) onChanged;
  final void Function() onPressed;
  const RoundedPasswordField({
    Key? key,
    required this.icon,
    required this.hintText,
    required this.onChanged,
    required this.isVisible,
    required this.onPressed,
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
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.visibility),
          ),
        ),
        obscureText: isVisible,
      ),
    );
  }
}
