import 'package:flutter/material.dart';
import 'package:qazo_namaz/assets/images/images.dart';
import 'package:qazo_namaz/features/settings/view/common_view.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  "Sozlamalar",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 56, vertical: 20),
                child: Image.asset(AppImages.settings),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                trailing: const Icon(Icons.forward),
                title: const Text("Umumiy"),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CommonView(),
                  ));
                },
              ),
              Row(
                children: [
                  const SizedBox(width: 60),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                trailing: const Icon(Icons.forward),
                title: const Text("Umumiy"),
                onTap: () {},
              ),
              Row(
                children: [
                  const SizedBox(width: 60),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      height: 1,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                trailing: const Icon(Icons.forward),
                title: const Text("Umumiy"),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
