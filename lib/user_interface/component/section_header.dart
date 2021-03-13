import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final RichText header;
  final String subHeader;

  const SectionHeader({this.header, this.subHeader});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [header, Text(subHeader)],
    );
  }
}
