import 'package:flutter/material.dart';

class DetailsStackedText extends StatelessWidget {
  final String header;
  final String subHeader;

  const DetailsStackedText({Key key, this.header, this.subHeader})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          header,
          style: TextStyle(color: Color(0xFFE39519), fontSize: 13),
        ),
        Text(
          subHeader,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ],
    );
  }
}
