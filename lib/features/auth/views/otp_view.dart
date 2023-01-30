import 'dart:async';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:qazo_namaz/core/utils/colors.dart';
import 'package:qazo_namaz/features/common/widgets/w_app_bar.dart';
import 'package:qazo_namaz/features/common/widgets/wbutton_widget.dart';
import 'package:qazo_namaz/features/ehtilam/widgets/ehtilam_splash.dart';

class OTPview extends StatefulWidget {
  const OTPview({super.key});

  @override
  State<OTPview> createState() => _OTPviewState();
}

class _OTPviewState extends State<OTPview> {
  OtpFieldController otpController = OtpFieldController();
  Duration duration = const Duration();
  Timer? timer;
  bool isActivTime = true;
  bool isValidet = false;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void reset() {
    setState(() {
      isActivTime = true;
      duration = const Duration(seconds: 0);
    });
  }

  void addTIme() {
    setState(() {
      final second = duration.inSeconds + 1;
      duration = Duration(seconds: second);
    });
    if (duration.inSeconds >= 120) {
      isActivTime = false;
      timer!.cancel();
      setState(() {});
    }
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) => addTIme(),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return KeyboardDismisser(
      child: Scaffold(
        appBar: const WAppBar(
          title: 'Raqamni tasdiqlash',
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '+998 ** *** ** 67 raqamiga tasdiqlash kodi yuborildi',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * 0.1),
              OTPTextField(
                controller: otpController,
                length: 4,
                width: MediaQuery.of(context).size.width,
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldWidth: 55,
                fieldStyle: FieldStyle.box,
                outlineBorderRadius: 6,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                onChanged: (pin) {
                  if (pin.length == 4) {
                    isValidet = true;
                  } else {
                    isValidet = false;
                  }
                  setState(() {});
                },
                onCompleted: (pin) {},
              ),
              const SizedBox(height: 36),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: isActivTime
                    ? Text('Kodni qayta yuborish: ${buildTime()}')
                    : TextButton(
                        onPressed: () {
                          reset();
                          startTimer();
                        },
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(0),
                        ),
                        child: const Text('Qayta yuborish'),
                      ),
              ),
              SizedBox(height: size.height * 0.18),
              WButton(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AgeEndEhtilomSplash()));
                },
                title: 'Kirish',
                isActiv: isValidet,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String buildTime() {
    String twoDigits(int a) => a.toString().padLeft(2, '0');
    final minuts = twoDigits(duration.inMinutes.remainder(60));
    final second = twoDigits(duration.inSeconds.remainder(60));
    return '$minuts:$second';
  }
}
