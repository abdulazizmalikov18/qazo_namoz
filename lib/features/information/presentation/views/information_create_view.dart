import 'package:flutter/material.dart';
import 'package:qazo_namoz/core/utils/constants.dart';
import 'package:qazo_namoz/core/utils/log_service.dart';
import 'package:qazo_namoz/features/common/widgets/w_button.dart';

class InformationCreateView extends StatefulWidget {
  const InformationCreateView({super.key});

  @override
  State<InformationCreateView> createState() => _InformationCreateViewState();
}

class _InformationCreateViewState extends State<InformationCreateView> {
  late TextEditingController controllerQuest;
  late TextEditingController controllerTitle;
  late TextEditingController controllerCommit;
  late TextEditingController controllerUrl;
  late TextEditingController controllerWhoDid;
  @override
  void initState() {
    controllerTitle = TextEditingController();
    controllerQuest = TextEditingController();
    controllerCommit = TextEditingController();
    controllerUrl = TextEditingController();
    controllerWhoDid = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: WButton(
            onTap: () async {
              if (controllerCommit.text.isNotEmpty &&
                  controllerTitle.text.isNotEmpty &&
                  controllerQuest.text.isNotEmpty &&
                  controllerWhoDid.text.isNotEmpty &&
                  controllerUrl.text.isNotEmpty) {
                final respons = await supabase.from('questions').insert({
                  'commit': controllerCommit.text,
                  'title': controllerTitle.text,
                  'questions': controllerQuest.text,
                  'where_did': controllerWhoDid.text,
                  'url': controllerUrl.text
                }).select();
                Log.i(respons);
              } else {
                context.showErrorSnackBar(message: "Barcha qatorni to'ldiring");
              }
            },
            text: "Saqlash",
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Mavzu nomi"),
            TextFormField(
              controller: controllerTitle,
              decoration: const InputDecoration(
                hintText: "Title",
              ),
            ),
            SizedBox(height: 24),
            const Text("Savol"),
            TextFormField(
              controller: controllerQuest,
              minLines: 1,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: "Savol",
              ),
            ),
            SizedBox(height: 24),
            const Text("Javob"),
            TextFormField(
              controller: controllerCommit,
              minLines: 1,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: "Javob",
              ),
            ),
            SizedBox(height: 24),
            const Text("Manbasi"),
            TextFormField(
              controller: controllerWhoDid,
              decoration: const InputDecoration(
                hintText: "Manbasi",
              ),
            ),
            SizedBox(height: 24),
            const Text("Url"),
            TextFormField(
              controller: controllerUrl,
              decoration: const InputDecoration(
                hintText: "Url",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
