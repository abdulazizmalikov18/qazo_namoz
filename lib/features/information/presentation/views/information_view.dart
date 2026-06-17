import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qazo_namoz/core/utils/constants.dart';
// import 'package:qazo_namoz/core/utils/log_service.dart';
import 'package:qazo_namoz/features/common/navigation/routs_contact.dart';
import 'package:qazo_namoz/features/information/presentation/views/information_create_view.dart';
import 'package:qazo_namoz/models/questions_model.dart';

class InformationView extends StatelessWidget {
  const InformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ma’lumot")),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_rounded),
        onPressed: () async {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const InformationCreateView(),
            ),
          );
        },
      ),
      body: FutureBuilder(
        future: supabase.from('questions').select(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final list = snapshot.data!
                .map((e) => QuestionsModel.fromJson(e))
                .toList();
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  context.push(
                    AppRoutPath.informationSelection,
                    extra: list[index],
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(list[index].title),
                ),
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: list.length,
            );
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
