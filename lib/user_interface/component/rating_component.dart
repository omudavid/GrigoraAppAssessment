import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingComponent extends StatelessWidget {
  final String rating;

  const RatingComponent({this.rating});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.red),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
        child: Row(
          children: [
            Icon(
              CupertinoIcons.star_fill,
              color: Colors.white,
              size: 15,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              rating,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
