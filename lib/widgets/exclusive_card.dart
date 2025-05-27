import 'package:application/helper/custom_text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExclusiveCard extends StatefulWidget {
  String offers;
  String mobileImage;
  String price;
  String details;

  ExclusiveCard({
    super.key,
    required this.offers,
    required this.mobileImage,
    required this.price,
    required this.details,
  });

  @override
  State<ExclusiveCard> createState() => _ExclusiveCardState();
}

class _ExclusiveCardState extends State<ExclusiveCard> {
  @override
  Widget build(BuildContext context) {
    final mqData = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: mqData.height * 0.8,
        width: mqData.width * 0.5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            /// offers
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 4,
                      ),
                      child: Text(
                        widget.offers,
                        style: myTextStyle18(
                          fontWeight: FontWeight.bold,
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Image.asset(widget.mobileImage),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 4,
              ),
              child: Row(
                children: [
                  Text(
                    widget.price,
                    style: myTextStyle21(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.currency_rupee, size: 18),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text(widget.details, style: myTextStyle18())],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
