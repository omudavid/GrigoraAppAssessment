import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(CupertinoIcons.location),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            'Central Business District',
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
    );
  }
}
