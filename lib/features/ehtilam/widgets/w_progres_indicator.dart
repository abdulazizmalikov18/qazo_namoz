import 'package:flutter/material.dart';
import 'package:qazo_namaz/core/utils/colors.dart';

class WProgresindecator extends StatelessWidget {
  const WProgresindecator({
    super.key,
    required this.width,
    required this.paddingTop,
  });
  final double width;
  final double paddingTop;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: double.infinity,
      margin: EdgeInsets.only(top: paddingTop),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.gren),
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * width,
            color: AppColors.gren,
          ),
          const Spacer()
        ],
      ),
    );
  }
}
