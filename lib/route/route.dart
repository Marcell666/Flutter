import 'package:flutter/material.dart';

import 'package:flutter_inf1300/view/login.dart';


const String loginPage = 'login';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case loginPage:
      return MaterialPageRoute(builder: (context) => LoginPage());
    //case homePage:
      //return MaterialPageRoute(builder: (context) => HomePage());
    //case settingsPage:
      //return MaterialPageRoute(builder: (context) => SettingsPage());
    default:
      throw('This route name does not exit');
  }
}
