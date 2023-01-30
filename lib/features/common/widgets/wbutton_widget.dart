import 'package:flutter/material.dart';
import 'package:qazo_namaz/core/utils/colors.dart';

class WButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Icon? icons;
  final bool? isActiv;
  const WButton(
      {super.key,
      required this.onTap,
      required this.title,
      this.isActiv = true,
      this.icons});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isActiv == true ? AppColors.gren : AppColors.grey,
        ),
        onPressed: onTap,
        child: icons ?? Text(
                title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
      ),
    );
  }
}
