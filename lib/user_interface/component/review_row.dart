import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grigora_coding_challenge/user_interface/component/circle_component.dart';

class ReviewRow extends StatelessWidget {
  final String review;
  final String rating;

  const ReviewRow({this.review, this.rating});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          CupertinoIcons.star,
          color: Colors.white,
          size: 13,
        ),
        Text(
          '$rating($review REVIEWS)',
          style: TextStyle(color: Colors.white),
        ),
        CircleComponent(
          color: Colors.white,
        ),
        Text(
          '3.21 KM Away',
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
