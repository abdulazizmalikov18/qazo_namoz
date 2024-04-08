import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:qazo_namoz/assets/colors/colosrs.dart';

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
      width: MediaQuery.of(context).size.width - 32,
      margin: EdgeInsets.only(top: paddingTop),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.green),
      ),
      child: Row(
        children: [
          AnimatedContainer(
            width: (MediaQuery.of(context).size.width - 34) / width,
            color: AppColors.green,
            duration: const Duration(milliseconds: 300),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
