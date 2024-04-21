import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qazo_namoz/core/utils/size_config.dart';
import 'package:qazo_namoz/features/common/navigation/routs_contact.dart';

class MentionsView extends StatelessWidget {
  const MentionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Zikrlar")),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            context.push(AppRoutPath.mentionSelection);
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: SizeConfig.h(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Subhanalloh",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.blue,
                      ),
                      child: const Text(
                        "150",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: SizeConfig.h(8)),
                const Text(
                  "Alloh barcha kamchiliklardan pokdir.",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 20,
      ),
    );
  }
}
