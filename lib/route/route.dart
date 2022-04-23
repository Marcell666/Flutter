import 'package:flutter/material.dart';
import 'package:flutter_inf1300/view/login.dart';
import 'package:flutter_inf1300/view/home.dart';
import 'package:flutter_inf1300/view/attendance.dart';

const String loginPage = 'login';
const String homePage = 'home';
const String attendancePage = 'attendance';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case loginPage:
      return MaterialPageRoute(builder: (context) => const LoginPage());
    case homePage:
      return MaterialPageRoute(builder: (context) => HomePage());
    case attendancePage:
      return MaterialPageRoute(
          builder: (context) => AttendancePage(arguments: settings.arguments));
    default:
      throw ('This route name does not exit');
  }
}
