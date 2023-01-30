import 'package:flutter/material.dart';

class WDivider extends StatelessWidget {
  const WDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: size.width * 0.349,
          height: 1,
          color: Colors.grey,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text('yoki'),
        ),
        Container(
          width: size.width * 0.349,
          height: 1,
          color: Colors.grey,
        ),
      ],
    );
  }
}
