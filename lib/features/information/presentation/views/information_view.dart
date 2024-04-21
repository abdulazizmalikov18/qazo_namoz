import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qazo_namoz/features/common/navigation/routs_contact.dart';

class InformationView extends StatelessWidget {
  const InformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ma’lumot"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            context.push(AppRoutPath.informationSelection);
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: const Text(
              "It has survived not only five centuries, but also the leap into electronic",
            ),
          ),
        ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 20,
      ),
    );
  }
}
