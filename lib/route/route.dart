import 'package:flutter/material.dart';
import 'package:flutter_inf1300/view/attendance_collection%20_list.dart';
import 'package:flutter_inf1300/view/login.dart';
import 'package:flutter_inf1300/view/home.dart';
import 'package:flutter_inf1300/view/attendance.dart';
import 'package:flutter_inf1300/view/settings.dart';
import 'package:flutter_inf1300/view/attendance_collection.dart';

const String loginPage = 'login';
const String homePage = 'home';
const String attendancePage = 'attendance';
const String attendanceCollectionPage = 'attendanceCollection';
const String attendanceCollectionListPage = 'attendanceCollectionList';
const String settingsPage = 'settings';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case loginPage:
      return MaterialPageRoute(builder: (context) => const LoginPage());
    case homePage:
      return MaterialPageRoute(builder: (context) => HomePage());
    case attendancePage:
      return MaterialPageRoute(
          builder: (context) => AttendancePage(arguments: settings.arguments));
    case attendanceCollectionPage:
      return MaterialPageRoute(
          builder: (context) =>
              AttendanceCollectionPage(arguments: settings.arguments));
    case attendanceCollectionListPage:
      return MaterialPageRoute(
          builder: (context) => AttendanceCollectionListPage(
              course: (settings.arguments as Map)["course"],
              date: (settings.arguments as Map)["date"].toString()));
    case settingsPage:
      return MaterialPageRoute(builder: (context) => const SettingsPage());
    default:
      throw ('This route name does not exit');
  }
}
