import 'package:flutter/material.dart';
import 'package:istudy/widgets/sized_box.dart';
import 'package:istudy/widgets/text_widget.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String son;
  final Color? color;
  const CardWidget({super.key, required this.title, required this.son, this.color, });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.10), // Shadow color
              spreadRadius: 2, // Spread radius
              blurRadius: 5, // Blur radius
              offset: const Offset(0, 3),
            ),
          ]),
      child:   Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              txt: title,
              size: 13,
            ),
            const Hg(),
            TextWidget(
              txt: son,
              size: 30,
              fontWeight: FontWeight.bold,
              txtColor:color ?? Color(0xff5DE094),
            ),
            const Hg(),
            const TextWidget(
              txt: "C++",
              size: 12,
              txtColor: Color(0xff666E7A),
            )
          ],
        ),
      ),
    );
  }
}
