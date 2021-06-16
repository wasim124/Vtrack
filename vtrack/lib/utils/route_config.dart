import 'package:vtrack/routes.dart';
import 'package:flutter/material.dart';
import 'package:vtrack/screens/ForgotPassword.dart';
import 'package:vtrack/screens/home_screen.dart';
import 'package:vtrack/screens/login.dart';
import 'package:vtrack/screens/signup.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  Widget pageResult;
  switch (settings.name) {
    case RoutePath.login:
      pageResult = LoginScreen();
      break;
    case RoutePath.forgotPassword:
      pageResult = ForgotPassword();
      break;
    case RoutePath.signup:
      pageResult = SignUpScreen();
      break;
    case RoutePath.homePage:
      pageResult = HomeScreen();
      break;
  }
  print(pageResult);
  return _generateMaterialRoute(pageResult);
}

Route<dynamic> _generateMaterialRoute(Widget widget) {
  return MaterialPageRoute(builder: (_) => widget);
}
