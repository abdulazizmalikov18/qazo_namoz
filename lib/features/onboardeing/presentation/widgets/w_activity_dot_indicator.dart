import 'package:flutter/material.dart';
import 'package:qazo_namoz/assets/colors/colosrs.dart';

class WActivityDotted extends StatelessWidget {
  final int dotCount;
  final int active;

  const WActivityDotted(
      {super.key, required this.dotCount, required this.active});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (int i = 0; i < dotCount; i++)
          AnimatedContainer(
            width: active == i ? 32 : 8,
            height: 8,
            margin: EdgeInsets.only(left: i == 0 ? 0 : 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: active == i
                  ? AppColors.green
                  : AppColors.green.withOpacity(.2),
            ),
            duration: const Duration(milliseconds: 300),
          ),
      ],
    );
  }
}
