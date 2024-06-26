import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qazo_namoz/assets/colors/colosrs.dart';
import 'package:qazo_namoz/assets/constants/icons.dart';
import 'package:qazo_namoz/core/utils/my_function.dart';
import 'package:qazo_namoz/core/utils/size_config.dart';
import 'package:qazo_namoz/features/auth/presentation/controllers/controller_register.dart';
import 'package:qazo_namoz/features/common/navigation/routs_contact.dart';
import 'package:qazo_namoz/features/common/widgets/w_button.dart';

class RegisterInfoView extends StatefulWidget {
  const RegisterInfoView({super.key});

  @override
  State<RegisterInfoView> createState() => _RegisterInfoViewState();
}

class _RegisterInfoViewState extends State<RegisterInfoView> {
  PageController controller = PageController();
  ValueNotifier index = ValueNotifier(0);
  RegisterController vm = RegisterController();
  List<Widget> list = [];
  @override
  void initState() {
    list = [
      RegisterGender(vm: vm),
      RegisterBrithDay(vm: vm),
      RegisterEhtilam(vm: vm),
      RegisterStartPrayer(vm: vm),
      RegisterConfirmation(vm: vm),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: index,
      builder: (context, value, child) {
        return Scaffold(
          appBar: index.value != 0
              ? AppBar(
                  leading: IconButton(
                    onPressed: () {
                      controller.animateToPage(
                        index.value - 1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    icon: const Icon(CupertinoIcons.back),
                  ),
                )
              : null,
          body: Column(
            children: [
              if (index.value != list.length - 1)
                Padding(
                  padding: EdgeInsets.fromLTRB(
                    16,
                    index.value == 0
                        ? MediaQuery.of(context).viewPadding.top + 32
                        : 16,
                    16,
                    16,
                  ),
                  child: SizedBox(
                    height: 12,
                    child: LinearProgressIndicator(
                      value: 1 / list.length * (index.value + 1),
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.green,
                    ),
                  ),
                  // child: WProgresindecator(
                  //   paddingTop: 0,
                  //   width: double.parse(
                  //     (list.length - (index.value + 1)).toString(),
                  //   ),
                  // ),
                ),
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  onPageChanged: (value) {
                    index.value = value;
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: list.length,
                  itemBuilder: (context, index) => list[index],
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
              onTap: () {
                if (index.value != list.length - 1) {
                  controller.animateToPage(
                    index.value + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                } else {
                  final date = vm.startPrayer.difference(vm.ehtilam).inDays;

                  context.go(AppRoutPath.registerCheck, extra: {"day": date});
                }
              },
              child: index.value != list.length - 1
                  ? const Icon(Icons.arrow_right_alt_outlined)
                  : const Text("Tasdiqlash"),
            ),
          ),
        );
      },
    );
  }
}

class RegisterGender extends StatefulWidget {
  const RegisterGender({super.key, required this.vm});
  final RegisterController vm;

  @override
  State<RegisterGender> createState() => _RegisterGenderState();
}

class _RegisterGenderState extends State<RegisterGender> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CupertinoButton(
          onPressed: () {
            widget.vm.gender = true;
            setState(() {});
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border:
                  widget.vm.gender ? Border.all(color: AppColors.green) : null,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  spreadRadius: 0,
                  offset: const Offset(0, 0),
                  color: const Color(0xFF0C1230).withOpacity(.07),
                )
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                AppIcons.manMuslim.svg(),
                const SizedBox(height: 8),
                const Text(
                  "Erkak kishi",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        CupertinoButton(
          onPressed: () {
            widget.vm.gender = false;
            setState(() {});
          },
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              border:
                  widget.vm.gender ? null : Border.all(color: AppColors.green),
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  spreadRadius: 0,
                  offset: const Offset(0, 0),
                  color: const Color(0xFF0C1230).withOpacity(.07),
                )
              ],
            ),
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: [
                AppIcons.muslimParanja.svg(),
                const SizedBox(height: 8),
                const Text(
                  "Ayol kishi",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class RegisterBrithDay extends StatelessWidget {
  const RegisterBrithDay({super.key, required this.vm});
  final RegisterController vm;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppIcons.calendar.svg(),
        Padding(
          padding: const EdgeInsets.only(top: 32),
          child: Text(
            'Tug’ilgan kuningiz',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: SizeConfig.h(40)),
        SizedBox(
          width: double.infinity,
          height: 220,
          child: CupertinoDatePicker(
            minimumYear: 1950,
            maximumYear: DateTime.now().year - 9,
            initialDateTime: vm.brithDay,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (val) {
              vm.brithDay = val;
              vm.ehtilam = vm.brithDay.add(const Duration(days: 2600));
            },
          ),
        ),
      ],
    );
  }
}

class RegisterEhtilam extends StatelessWidget {
  const RegisterEhtilam({super.key, required this.vm});
  final RegisterController vm;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Birinchi marta ehtilom/hayz paytingizni kiriting',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: SizeConfig.h(12)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.v(30)),
          child: Text(
            'Musulmon kishiga shu vaqtdan boshlab namoz farz bo’ladi.',
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
          ),
        ),
        SizedBox(height: SizeConfig.h(40)),
        SizedBox(
          width: double.infinity,
          height: 220,
          child: CupertinoDatePicker(
            minimumYear: vm.brithDay.year + 7,
            maximumDate: DateTime.now(),
            initialDateTime: vm.ehtilam,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (val) {
              vm.ehtilam = val;
            },
          ),
        ),
      ],
    );
  }
}

class RegisterStartPrayer extends StatelessWidget {
  const RegisterStartPrayer({super.key, required this.vm});
  final RegisterController vm;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Namozni boshlagan vaqtingiz',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 24, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: SizeConfig.h(12)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.v(30)),
          child: Text(
            'Shunga qarab qazo namozlaringiz hisoblanadi',
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
          ),
        ),
        SizedBox(height: SizeConfig.h(40)),
        SizedBox(
          width: double.infinity,
          height: 220,
          child: CupertinoDatePicker(
            minimumYear: vm.ehtilam.year,
            maximumYear: DateTime.now().year,
            initialDateTime: DateTime.now(),
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (val) {
              vm.startPrayer = val;
            },
          ),
        ),
      ],
    );
  }
}

class RegisterConfirmation extends StatelessWidget {
  const RegisterConfirmation({super.key, required this.vm});
  final RegisterController vm;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Tasdiqlash',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(height: SizeConfig.h(12)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.v(30)),
            child: Text(
              'Ma’lumotlaringiz to’g’riligini tekshiring',
              textAlign: TextAlign.center,
              style:
                  Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
            ),
          ),
          SizedBox(height: SizeConfig.h(40)),
          TitleInfo(
            title: 'Tug’ilgan kuningiz:',
            info: MyFunctions.dateTimeFormatMonth(vm.brithDay),
          ),
          const Divider(height: 40),
          TitleInfo(
            title: 'Ehtilom/hayz vaqti:',
            info: MyFunctions.dateTimeFormatMonth(vm.ehtilam),
          ),
          const Divider(height: 40),
          TitleInfo(
            title: 'Namozni boshladingiz:',
            info: MyFunctions.dateTimeFormatMonth(vm.startPrayer),
          ),
        ],
      ),
    );
  }
}

class TitleInfo extends StatelessWidget {
  const TitleInfo({super.key, required this.title, required this.info});
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style:
                Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16),
          ),
        ),
        Expanded(
          child: Text(
            info,
            textAlign: TextAlign.end,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
