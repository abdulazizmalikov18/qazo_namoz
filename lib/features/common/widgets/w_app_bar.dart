import 'package:flutter/material.dart';
import 'package:qazo_namaz/core/utils/colors.dart';

class WAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WAppBar({
    super.key,
    required this.title,
    this.isRedy,
  });
  final String title;
  final VoidCallback? isRedy;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
      ),
      centerTitle: true,
      leading: TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Row(
          children: const [
            Icon(
              Icons.arrow_back_ios_new,
              size: 20,
            ),
            Spacer(),
            Text(
              'Back',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: AppColors.blue,
              ),
            )
          ],
        ),
      ),
      leadingWidth: 80,
      actions: [
        if (isRedy != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: isRedy,
              child: const Text(
                "Tayyor",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(54);
}
