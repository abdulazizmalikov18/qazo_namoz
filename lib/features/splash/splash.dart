import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qazo_namaz/features/onboardeing/onboarding_view.dart';

class MySplashView extends StatelessWidget {
  const MySplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset("assets/vector.svg"),
          const Text(
            "Tilni tanlang / Выберите язык",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const OnboardPage(),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/uzb.png"),
                  ),
                  title: Text(
                    "O’zbek tili",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/uzb.png"),
                  ),
                  title: Text(
                    "Ўзбек тили",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/rus.png"),
                  ),
                  title: Text(
                    "Русский язык",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Divider()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
