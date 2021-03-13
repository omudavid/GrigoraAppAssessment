import 'package:flutter/material.dart';

class CircleComponent extends StatelessWidget {
  final Color color;

  const CircleComponent({Key key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 8,
        width: 8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: color ?? Color(0xFFE39519)),
      ),
    );
  }
}
