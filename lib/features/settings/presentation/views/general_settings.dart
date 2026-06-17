import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qazo_namoz/application/auth/auth_bloc.dart';
import 'package:qazo_namoz/core/utils/formatters.dart';
import 'package:qazo_namoz/features/common/widgets/w_button.dart';

class GeneralSettings extends StatefulWidget {
  const GeneralSettings({super.key});

  @override
  State<GeneralSettings> createState() => _GeneralSettingsState();
}

class _GeneralSettingsState extends State<GeneralSettings> {
  late TextEditingController controllerphone;
  late TextEditingController password;
  late TextEditingController birthday;
  late TextEditingController dayOfPuberty;
  late TextEditingController startDate;
  bool isObscure = false;

  @override
  void initState() {
    final profile = context.read<AuthBloc>().state.profile;
    controllerphone = TextEditingController(text: profile.username);
    birthday = TextEditingController(text: profile.birthday);
    dayOfPuberty = TextEditingController(text: profile.dayOfPuberty);
    startDate = TextEditingController(text: profile.startDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Umumiy sozlamalar")),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Telefon raqam"),
                TextFormField(
                  inputFormatters: [Formatters.phoneFormatter],
                  controller: controllerphone,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(CupertinoIcons.phone),
                    hintText: "Raqamingizni yozing",
                  ),
                ),
                SizedBox(height: 32),
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
                SizedBox(height: 32),
                const Text("Tug’ilgan kun"),
                TextFormField(
                  controller: birthday,
                  decoration: const InputDecoration(hintText: "24.11.2000"),
                ),
                SizedBox(height: 32),
                const Text("Birinchi ehtilom/hayz payti"),
                TextFormField(
                  controller: dayOfPuberty,
                  decoration: const InputDecoration(hintText: "24.11.2000"),
                ),
                SizedBox(height: 32),
                const Text("Namoz boshlangan kun"),
                TextFormField(
                  controller: startDate,
                  decoration: const InputDecoration(hintText: "24.11.2000"),
                ),
                SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: WButton(onTap: () {}, text: "Saqlash"),
      ),
    );
  }
}
