import 'package:flutter/material.dart';

class SocialContainer extends StatelessWidget {
  final String name;
  final String imageName;
  const SocialContainer({
    Key? key,
    required this.name,
    required this.imageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      height: 62,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Image.asset(
            imageName,
            height: 30,
            width: 30,
          ),
          const SizedBox(width: 16),
          Text(
            name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
