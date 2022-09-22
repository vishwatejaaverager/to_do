import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:to_do/features/auth/controller/auth_controller.dart';

class OtpScreen extends ConsumerWidget {
  final String verificationId;
  static const routeName = '/otp-screen';

  const OtpScreen({super.key, required this.verificationId});

  void verifyOTP(BuildContext context, WidgetRef ref, String OTP) {
    ref.read(authControllerProvider).verifyOTP(context, verificationId, OTP);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("verify otp"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "enter otp"
              ),
              onChanged: ((value) {
                if (value.length == 6) {
                  verifyOTP(context, ref, value.trim());
                }
              }),
            ),
          )
        ],
      ),
    );
  }
}
