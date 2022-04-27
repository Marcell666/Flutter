import 'package:flutter/material.dart';

// fazer classe

/*

primary -> Colors.grey.shade200
secondary -> Color(0xff2A87BB)

*/
class AppTheme {
  ThemeData get theme {
    return ThemeData(
      primaryColor: Colors.grey.shade200,
      hoverColor: const Color(0xff2A87BB),
    );
  }
}
