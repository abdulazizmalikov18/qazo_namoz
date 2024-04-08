import 'package:flutter/material.dart';
import 'package:qazo_namoz/assets/constants/icons.dart';
import 'package:qazo_namoz/assets/constants/images.dart';
import 'package:qazo_namoz/core/utils/size_config.dart';

class SplashLenguageView extends StatelessWidget {
  const SplashLenguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.h(200)),
            AppIcons.logo.svg(),
            SizedBox(height: SizeConfig.h(80)),
            Text(
              "Tilni tanlang / Выберите язык",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: SizeConfig.h(120)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
            )
          ],
        ),
      ),
    );
  }
}
