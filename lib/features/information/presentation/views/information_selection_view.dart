import 'package:flutter/material.dart';
import 'package:qazo_namoz/core/utils/size_config.dart';
import 'package:qazo_namoz/models/questions_model.dart';

class InformationSelectionView extends StatelessWidget {
  const InformationSelectionView({super.key, required this.model});
  final QuestionsModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(model.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Savol:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: SizeConfig.h(12)),
            Text(
              model.questions,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: SizeConfig.h(24)),
            const Text(
              "Javob:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: SizeConfig.h(12)),
            Text(
              model.commit,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
