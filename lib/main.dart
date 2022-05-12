import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'route/route.dart' as route;
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final ThemeData themeApp = ThemeData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeApp.copyWith(
        colorScheme: themeApp.colorScheme.copyWith(
          primary: const Color(0xff2A87BB),
          background: Colors.grey.shade200,
        ),
        textTheme: Theme.of(context).textTheme.copyWith(
              titleMedium: const TextStyle(
                color: Color(0xffa18c59),
              ),
            ),
      ),
      onGenerateRoute: route.controller,
      initialRoute: route.loginPage,
      debugShowCheckedModeBanner: false,
      supportedLocales: const [
        Locale("pt", "BR"),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
