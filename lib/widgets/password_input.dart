import 'package:flutter/material.dart';

import '../palatte.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    Key? key,
    required this.icon,
    required this.hint,
    //required this.inputType,
    required this.inputAction,
  }) : super(key: key);
  final IconData icon;
  final String hint;
  // final TextInputType inputType;
  final TextInputAction inputAction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[600]!.withOpacity(0.5),
            borderRadius: BorderRadius.circular(16)),
        child: TextFormField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: kBodyText,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(icon, color: Colors.white, size: 30),
              )),
          obscureText: true,
          style: kBodyText,
          //   keyboardType: inputType,
          textInputAction: inputAction,
        ),
      ),
    );
  }
}
