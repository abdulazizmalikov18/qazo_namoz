import 'dart:async';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:qazo_namaz/core/utils/colors.dart';
import 'package:qazo_namaz/core/utils/utils.dart';
import 'package:qazo_namaz/features/auth/controllers/auth_controller.dart';
import 'package:qazo_namaz/features/common/widgets/w_app_bar.dart';
import 'package:qazo_namaz/features/common/widgets/wbutton_widget.dart';
import 'package:qazo_namaz/features/ehtilam/widgets/ehtilam_splash.dart';
import 'package:qazo_namaz/features/main/main_screen.dart';

class OTPview extends StatefulWidget {
  const OTPview({super.key, required this.verificationId});
  final String verificationId;

  @override
  State<OTPview> createState() => _OTPviewState();
}

class _OTPviewState extends State<OTPview> {
  OtpFieldController otpController = OtpFieldController();
  Duration duration = const Duration();
  Timer? timer;
  bool isActivTime = true;
  bool isValidet = false;
  String? otpCode;

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
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    var size = MediaQuery.of(context).size;
    return KeyboardDismisser(
      child: Scaffold(
        appBar: const WAppBar(
          title: 'Raqamni tasdiqlash',
        ),
        body: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.purple,
                ),
              )
            : SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
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
                    Pinput(
                      length: 6,
                      showCursor: true,
                      defaultPinTheme: PinTheme(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.purple.shade200,
                          ),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onCompleted: (value) {
                        setState(() {
                          otpCode = value;
                        });
                      },
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
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => const AgeEndEhtilomSplash()));
                        if (otpCode != null) {
                          verifyOtp(context, otpCode!);
                        } else {
                          showSnackBar(context, "Enter 6-Digit code");
                        }
                      },
                      title: 'Kirish',
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

  void verifyOtp(BuildContext context, String userOtp) {
    final ap = Provider.of<AuthProvider>(context, listen: false);
    ap.verifyOtp(
      context: context,
      verificationId: widget.verificationId,
      userOtp: userOtp,
      onSuccess: () {
        // checking whether user exists in the db
        ap.checkExistingUser().then(
          (value) async {
            if (value == true) {
              // user exists in our app
              ap.getDataFromFirestore().then(
                    (value) => ap.saveUserDataToSP().then(
                          (value) => ap.setSignIn().then(
                                (value) => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MainScreen(),
                                    ),
                                    (route) => false),
                              ),
                        ),
                  );
            } else {
              // new user
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AgeEndEhtilomSplash()),
                  (route) => false);
            }
          },
        );
      },
    );
  }
}
