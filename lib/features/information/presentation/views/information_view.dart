import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qazo_namoz/core/utils/constants.dart';
import 'package:qazo_namoz/core/utils/log_service.dart';
import 'package:qazo_namoz/features/common/navigation/routs_contact.dart';

class InformationView extends StatelessWidget {
  const InformationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ma’lumot"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final respons = await supabase.from('questions').insert({
            'commit': 'Qanday qilib',
            'title': 'Qanday axir',
            'questions': 'Nimaga bilmiman'
          }).select();
          Log.i(respons);
        },
      ),
      body: FutureBuilder(
        future: supabase.from('questions').select(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  context.push(AppRoutPath.informationSelection);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(snapshot.data![index]['title']),
                ),
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: snapshot.data!.length,
            );
          }
          return const Center(child: CircularProgressIndicator.adaptive());
        },
      ),
    );
  }
}
