import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_localizations.dart';
import 'route/route.dart' as route;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_inf1300/controller/database_helper.dart';
import 'util/language_provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeData themeApp = ThemeData();
  final dbHelper = DatabaseHelper.instance;
  bool _logged = false;
  late String _language;
  late String _country;

  Future<bool> login() async {
    var response = await dbHelper.queryLogged();
    if (!response.isEmpty) {
      _logged = true;
    }
    return _logged;
  }

  getLanguage(BuildContext context) {
    _language = Provider.of<Language>(context).getLanguage;
    if (_language == 'pt') {
      _country = 'BR';
    } else {
      _country = 'US';
    }
    return Locale(_language, _country);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Language(),
        ),
      ],
      child: Builder(
        builder: (BuildContext context) {
          BuildContext rootContext = context;
          return MaterialApp(
            title: 'Flutter Demo',
            theme: themeApp.copyWith(
              colorScheme: themeApp.colorScheme.copyWith(
                primary: const Color(0xff2A87BB),
                background: Colors.grey.shade200,
              ),
              textTheme: Theme.of(context).textTheme.copyWith(
                    titleMedium: const TextStyle(
                      color: Color(0xff4e4e4e),
                    ),
                  ),
            ),
            onGenerateRoute: route.controller,
            initialRoute: _logged ? route.homePage : route.loginPage,
            debugShowCheckedModeBanner: false,
            locale: getLanguage(rootContext),
            supportedLocales: const [
              Locale("pt", "BR"),
              Locale('en', 'US'),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
