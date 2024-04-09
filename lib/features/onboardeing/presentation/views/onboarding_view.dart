import 'package:flutter/material.dart';
import 'package:qazo_namoz/assets/constants/images.dart';
import 'package:qazo_namoz/core/utils/my_function.dart';
import 'package:qazo_namoz/core/utils/size_config.dart';
import 'package:qazo_namoz/features/common/widgets/w_button.dart';
import 'package:qazo_namoz/features/onboardeing/domain/entity/onboarding_entity.dart';
import 'package:qazo_namoz/features/onboardeing/presentation/widgets/w_activity_dot_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController controller = PageController();
  ValueNotifier index = ValueNotifier(0);
  List<OnboardingEntity> list = [
    OnboardingEntity(
      image: AppImages.onboarding_1,
      title: 'Namozingizni to’la-to’kis qiling',
      text:
          'Vitae a odio fusce eu, eget massa ut. Consectetur ut nisl, turpis arcu massa at magna quisque.',
    ),
    OnboardingEntity(
      image: AppImages.onboarding_2,
      title: 'Consectetur ut nisl, turpis arcu ',
      text:
          'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration',
    ),
    OnboardingEntity(
      image: AppImages.onboarding_3,
      title: 'Massa at magna quisque.',
      text:
          'Integer neque erat, vehicula nec ante vel, congue sagittis elit. Nullam semper eu odio at placerat. Etiam lacinia lorem dui.',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: PageView.builder(
              onPageChanged: (value) {
                index.value = value;
              },
              itemBuilder: (context, index) => Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: SizeConfig.h(380),
                    child: Image.asset(
                      list[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: SizeConfig.h(100)),
                  Text(
                    list[index].title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: SizeConfig.h(16)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      list[index].text,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
              itemCount: list.length,
            ),
          ),
          Positioned(
            top: SizeConfig.h(420),
            left: 0,
            right: 0,
            child: ValueListenableBuilder(
              valueListenable: index,
              builder: (BuildContext context, value, Widget? child) {
                return WActivityDotted(
                  dotCount: list.length,
                  active: value,
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(
          16,
          16,
          16,
          MyFunctions.paddingBottom(context),
        ),
        child: WButton(
          onTap: () {},
          text: "Ro’yxatdan o’tish",
        ),
      ),
    );
  }
}
