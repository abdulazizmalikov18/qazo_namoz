import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:qazo_namoz/assets/colors/colosrs.dart';
import 'package:qazo_namoz/assets/constants/anims.dart';

class DayNumberAnim extends StatelessWidget {
  const DayNumberAnim({
    super.key,
    required this.day,
    this.color,
    required this.size,
    required this.margin,
    required this.dateTime,
    required this.onTap,
  });

  final int day;
  final Color? color;
  final double size;
  final double margin;
  final DateTime dateTime;
  final Function(DateTime day) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        onTap(dateTime);
      },
      child: Stack(
        children: [
          Container(
            width: size,
            height: size,
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.all(6),
            margin: EdgeInsets.all(margin),
            decoration: BoxDecoration(
              color: day < 1 ? null : AppColors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          if (color != null)
            Container(
              width: size,
              height: size,
              margin: EdgeInsets.all(margin),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    top: size / 5 * 3,
                    right: 0,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.green,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    top: -(size / 5 - 6),
                    left: 0,
                    right: 0,
                    child: Lottie.asset(AppAnim.wave),
                  ),
                ],
              ),
            ),
          Positioned(
            bottom: 6,
            right: 6,
            child: Text(
              day < 1 ? '' : day.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color != null ? Colors.white : Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
