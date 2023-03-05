import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qazo_namaz/core/utils/utils.dart';
import 'package:qazo_namaz/features/auth/controllers/auth_controller.dart';
import 'package:qazo_namaz/features/auth/model/user_model.dart';
import 'package:qazo_namaz/features/common/controllers/controller.dart';
import 'package:qazo_namaz/features/common/widgets/w_app_bar.dart';
import 'package:qazo_namaz/features/common/widgets/wbutton_widget.dart';
import 'package:qazo_namaz/features/ehtilam/views/information_container.dart';
import 'package:qazo_namaz/features/ehtilam/views/chek.dart';

class InfoChkScreen extends StatefulWidget {
  final DateTime data;
  final DateTime hayz;
  final DateTime namoz;
  const InfoChkScreen(
      {super.key, required this.data, required this.hayz, required this.namoz});

  @override
  State<InfoChkScreen> createState() => _InfoChkScreenState();
}

class _InfoChkScreenState extends State<InfoChkScreen> {
  File? image;
  // for selecting image
  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WAppBar(title: ''),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: Text(
                  'Tasdiqlash',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Ma’lumotlaringiz to’g’riligini tekshiring',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 16),
              ),
              const Spacer(),
              InformationContainer(
                data: context.watch<Counter>().dataBir,
                hayz: widget.hayz,
                namoz: widget.namoz,
              ),
              const Spacer(),
              WButton(
                onTap: () => storeData(),
                title: 'Tasdiqlash',
                isActiv: true,
              )
            ],
          ),
        ),
      ),
    );
  }

  void storeData() async {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
      createdAt: "",
      phoneNumber: "",
      uid: "",
      brtday: widget.data.toString(),
      extilam: widget.hayz.toString(),
      firstNamaz: widget.namoz.toString(),
    );
    ap.saveUserDataToFirebase(
      context: context,
      userModel: userModel,
      onSuccess: () {
        ap.saveUserDataToSP().then(
              (value) => ap.setSignIn().then(
                    (value) => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CheckingList(),
                        ),
                        (route) => false),
                  ),
            );
      },
    );
  }
}
