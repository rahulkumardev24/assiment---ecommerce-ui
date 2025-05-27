import 'package:application/helper/custom_text_style.dart';
import 'package:flutter/material.dart';

class MyTextButton extends StatefulWidget {
  String btnText;
  VoidCallback onPress;
  Color backgroundColor;
  Color btnTextColor;

  MyTextButton({
    super.key,
    this.backgroundColor = Colors.red,
    this.btnTextColor = Colors.white,
    required this.btnText,
    required this.onPress,
  });

  @override
  State<MyTextButton> createState() => _TextButtonState();
}

class _TextButtonState extends State<MyTextButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPress,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        backgroundColor: widget.backgroundColor,
      ),
      child: Text(
        widget.btnText,
        style: myTextStyle21(textColor: widget.btnTextColor),
      ),
    );
  }
}
