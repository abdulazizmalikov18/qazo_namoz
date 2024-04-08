import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:qazo_namoz/assets/colors/colosrs.dart';
import 'package:qazo_namoz/assets/constants/icons.dart';
import 'package:qazo_namoz/core/utils/size_config.dart';

class MentionSelectionView extends StatefulWidget {
  const MentionSelectionView({super.key});

  @override
  State<MentionSelectionView> createState() => _MentionSelectionViewState();
}

class _MentionSelectionViewState extends State<MentionSelectionView> {
  int progres = 0;
  int dan = 400;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Zikrlar")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              "Sollallohu alayka ya Rosulalloh",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: SizeConfig.h(80)),
            const Text(
              "Ey, Allohning rasuli, sizga Allohning salomi bo’lsin",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: SizeConfig.h(60)),
            SizedBox(
              height: SizeConfig.h(200),
              width: SizeConfig.v(200),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CircularProgressIndicator(
                    value: (progres / dan),
                    strokeWidth: 16,
                    backgroundColor: AppColors.green.withOpacity(.2),
                    color: AppColors.green,
                  ),
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          progres.toString(),
                          style: TextStyle(
                            fontSize: progres.toString().length == 7 ? 40 : 48,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Maqsad: $dan",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: SizeConfig.h(100)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    progres = 0;
                    setState(() {});
                  },
                  icon: const Icon(
                    CupertinoIcons.restart,
                    size: 28,
                  ),
                ),
                Container(
                  height: SizeConfig.h(84),
                  width: SizeConfig.v(84),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {
                      progres += 1;
                      setState(() {});
                    },
                    icon: const Icon(Icons.add),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      constraints: BoxConstraints(maxHeight: SizeConfig.h(160)),
                      builder: (context) => Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      context.pop();
                                    },
                                    child: const Text(
                                      "Bekor qilish",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                                const Expanded(
                                  child: Text(
                                    "Maqsad",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      context.pop();
                                    },
                                    child: const Text(
                                      "Done",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: SizeConfig.h(16)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text("Kunlik zikrlar miqdorini kiriting"),
                                SizedBox(height: SizeConfig.h(8)),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]'),
                                    )
                                  ],
                                  decoration: InputDecoration(
                                    prefixIconConstraints: const BoxConstraints(
                                      maxHeight: 22,
                                      maxWidth: 40,
                                    ),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: AppIcons.focusTarget.svg(),
                                    ),
                                    hintText: "Raqamingizni yozing",
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.my_location_rounded,
                    size: 28,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
