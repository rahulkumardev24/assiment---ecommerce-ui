import 'package:flutter/material.dart';

class NavigationIconButton extends StatefulWidget {
  VoidCallback onTap;
  NavigationIconButton({super.key, required this.onTap});

  @override
  State<NavigationIconButton> createState() => _NavigationIconButtonState();
}

class _NavigationIconButtonState extends State<NavigationIconButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(Icons.arrow_back_ios_rounded, size: 27),
        ),
      ),
    );
  }
}
