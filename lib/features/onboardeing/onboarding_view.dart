import 'package:flutter/material.dart';
import 'package:qazo_namaz/core/utils/data.dart';
import 'package:qazo_namaz/features/auth/sign_up_view.dart';
import 'package:qazo_namaz/features/common/widgets/wbutton_widget.dart';
import 'package:qazo_namaz/features/onboardeing/widgets/my_indicator_widget.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  late List<PageController> pageControllersList;
  int myIndex = 0;
  final time = const Duration(milliseconds: 300);

  @override
  void initState() {
    pageControllersList = [...List.generate(3, (index) => PageController())];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: size.height * 0.51,
              width: size.width,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                controller: pageControllersList[0],
                onPageChanged: (value) {
                  myIndex = value;
                  pageControllersList[1].animateToPage(myIndex,
                      duration: time, curve: Curves.ease);
                  setState(() {});
                },
                itemCount: AppData.info.length,
                itemBuilder: (context, index) => Image.asset(
                  AppData.info[index]['image'],
                  fit: BoxFit.cover,
                  width: size.width,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  AppData.info.length,
                  (index) => MyIndicatorWidgets(
                    myIndex: myIndex,
                    size: size,
                    pageControllersList: pageControllersList,
                    index: index,
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: AppData.info.length,
                scrollDirection: Axis.horizontal,
                controller: pageControllersList[1],
                onPageChanged: (val) {
                  myIndex = val;
                  pageControllersList[0].animateToPage(myIndex,
                      duration: time, curve: Curves.ease);
                  setState(() {});
                },
                itemBuilder: (context, index) => Container(
                  height: 120,
                  width: size.width,
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Text(
                        AppData.info[index]['title'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppData.info[index]['text'],
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: WButton(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SignUpView(),
                    ),
                  );
                },
                title: 'Ro’yxatdan o’tish',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
