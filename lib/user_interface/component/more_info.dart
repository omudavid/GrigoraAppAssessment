import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoreInfo extends StatelessWidget {
  final Function onTap;

  const MoreInfo({this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            CupertinoIcons.exclamationmark_circle,
            color: Colors.white,
            size: 15,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'MORE INFO',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
