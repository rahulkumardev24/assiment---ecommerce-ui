import 'package:application/helper/custom_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesItemCard extends StatefulWidget {
  Color cardColor;
  String title;
  IconData icon;
  CategoriesItemCard({
    super.key,
    required this.cardColor,
    required this.title,
    required this.icon,
  });

  @override
  State<CategoriesItemCard> createState() => _CategoriesItemCardState();
}

class _CategoriesItemCardState extends State<CategoriesItemCard> {
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        children: [
          Container(
            height: mqData.height * 0.09,
            width: mqData.height * 0.09,
            decoration: BoxDecoration(
              color: widget.cardColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              widget.icon,
              size: mqData.width * 0.1,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(widget.title, style: myTextStyle18()),
          ),
        ],
      ),
    );
  }
}
