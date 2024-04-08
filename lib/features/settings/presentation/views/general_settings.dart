import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qazo_namoz/core/utils/formatters.dart';
import 'package:qazo_namoz/core/utils/size_config.dart';
import 'package:qazo_namoz/features/common/widgets/w_button.dart';

class GeneralSettings extends StatefulWidget {
  const GeneralSettings({super.key});

  @override
  State<GeneralSettings> createState() => _GeneralSettingsState();
}

class _GeneralSettingsState extends State<GeneralSettings> {
  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Umumiy sozlamalar")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Telefon raqam"),
            TextFormField(
              inputFormatters: [Formatters.phoneFormatter],
              decoration: const InputDecoration(
                prefixIcon: Icon(CupertinoIcons.phone),
                hintText: "Raqamingizni yozing",
              ),
            ),
            SizedBox(height: SizeConfig.h(32)),
            const Text("Parol yarating"),
            TextFormField(
              obscureText: isObscure,
              decoration: InputDecoration(
                prefixIcon: const Icon(CupertinoIcons.lock),
                suffixIcon: InkWell(
                  onTap: () {
                    isObscure = !isObscure;
                    setState(() {});
                  },
                  child: isObscure
                      ? const Icon(CupertinoIcons.eye)
                      : const Icon(CupertinoIcons.eye_slash),
                ),
                hintText: "Yangi parol yozing",
              ),
            ),
            SizedBox(height: SizeConfig.h(32)),
            const Text("Tug’ilgan kun"),
            TextFormField(
              inputFormatters: [Formatters.phoneFormatter],
              decoration: const InputDecoration(
                hintText: "24.11.2000",
              ),
            ),
            SizedBox(height: SizeConfig.h(32)),
            const Text("Birinchi ehtilom/hayz payti"),
            TextFormField(
              inputFormatters: [Formatters.phoneFormatter],
              decoration: const InputDecoration(
                hintText: "24.11.2000",
              ),
            ),
            SizedBox(height: SizeConfig.h(32)),
            const Text("Namoz boshlangan kun"),
            TextFormField(
              inputFormatters: [Formatters.phoneFormatter],
              decoration: const InputDecoration(
                hintText: "24.11.2000",
              ),
            ),
            SizedBox(height: SizeConfig.h(32)),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: WButton(
          onTap: () {},
          text: "Saqlash",
        ),
      ),
    );
  }
}
