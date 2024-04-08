import 'package:flutter/material.dart';
import 'package:qazo_namoz/assets/constants/images.dart';

class LenguageView extends StatefulWidget {
  const LenguageView({super.key});

  @override
  State<LenguageView> createState() => _LenguageViewState();
}

class _LenguageViewState extends State<LenguageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tilni o’zgartirish")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Image.asset(AppImages.uz, height: 36),
              title: const Text("O’zbek tili"),
            ),
            const Divider(),
            ListTile(
              leading: Image.asset(
                AppImages.uz,
                height: 36,
              ),
              title: const Text("O’zbek tili"),
            ),
            const Divider(),
            ListTile(
              leading: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  border: Border.all(color: Colors.grey),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AppImages.ru),
                  ),
                ),
              ),
              title: const Text("O’zbek tili"),
            ),
          ],
        ),
      ),
    );
  }
}
