import 'package:flutter/material.dart';
import 'package:to_do/features/auth/screens/login_screen.dart';
import 'package:to_do/features/auth/screens/otp_screen.dart';
import 'package:to_do/features/auth/screens/user_info_screen.dart';
import 'package:to_do/features/todo/todo_screens/todo_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: ((context) => LoginScreen()));

    case OtpScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
          builder: (context) => OtpScreen(
                verificationId: verificationId,
              ));

    case UserInfoScreen.route:
      return MaterialPageRoute(builder: ((context) => UserInfoScreen()));

    case TodoScreen.routname:
      return MaterialPageRoute(builder: ((context) => TodoScreen()));

    default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: Text("Error bruh"),
              ));
  }
}
