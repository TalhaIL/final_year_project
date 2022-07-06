import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    Key? key,
    required this.size,
    required this.isLogin,
    required this.onPress,
  }) : super(key: key);
  final void Function() onPress;
  final Size size;
  final bool isLogin;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          minimumSize: Size(size.width * 0.8, 60)),
      onPressed: onPress,
      child: Text(
        !isLogin ? 'Signup' : 'Login',
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
