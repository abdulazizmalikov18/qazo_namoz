import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qazo_namoz/assets/constants/images.dart';
import 'package:qazo_namoz/core/utils/size_config.dart';
import 'package:qazo_namoz/features/common/navigation/routs_contact.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(
            16, MediaQuery.of(context).viewPadding.top, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Sozlamalar",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: SizeConfig.h(40)),
            Image.asset(AppImages.setting, height: SizeConfig.h(220)),
            SizedBox(height: SizeConfig.h(40)),
            ListTile(
              title: const Text("Umumiy"),
              onTap: () {
                context.push(AppRoutPath.generalSettings);
              },
              leading: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey,
                ),
                child: const Icon(Icons.settings, color: Colors.white),
              ),
              trailing: const Icon(CupertinoIcons.forward),
            ),
            const Divider(),
            ListTile(
              title: const Text("Tilni o’zgartirish"),
              onTap: () {
                context.push(AppRoutPath.lenguage);
              },
              leading: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.blue,
                ),
                child: const Icon(Icons.translate, color: Colors.white),
              ),
              trailing: const Icon(CupertinoIcons.forward),
            ),
            const Divider(),
            ListTile(
              title: const Text("Tizimdan chiqish"),
              onTap: () {
                showAdaptiveDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text('Tizimdan chiqish'),
                    content: const Text('Haqiqatan tizimdan chiqmoqchimisiz?'),
                    actions: <CupertinoDialogAction>[
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Yo\'q'),
                      ),
                      CupertinoDialogAction(
                        isDestructiveAction: true,
                        onPressed: () {
                          context.pushReplacement(AppRoutPath.login);
                        },
                        child: const Text('Ha'),
                      ),
                    ],
                  ),
                );
              },
              leading: Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.red,
                ),
                child: const Icon(Icons.login, color: Colors.white),
              ),
              trailing: const Icon(CupertinoIcons.forward),
            ),
          ],
        ),
      ),
    );
  }
}
