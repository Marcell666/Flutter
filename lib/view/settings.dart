import 'package:flutter/material.dart';
import 'package:flutter_inf1300/app_localizations.dart';
import 'package:flutter_inf1300/util/language_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

enum SingingCharacter { portugues, english }

class _SettingsPageState extends State<SettingsPage> {
  SingingCharacter? _character = SingingCharacter.portugues;

  void _changeLanguage(BuildContext context) {
    if (_character == SingingCharacter.portugues) {
      Provider.of<Language>(context, listen: false).changeLanguage('pt');
    } else {
      Provider.of<Language>(context, listen: false).changeLanguage('en');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xff4e4e4e),
        ),
        backgroundColor: Colors.grey.shade200,
        title: Row(children: [
          const Spacer(),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              _changeLanguage(context);
              Navigator.pop(context);
            },
            child: Text(
                AppLocalizations.of(context)!
                    .translate('saveButtom')
                    .toString(),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(const Color(0xff2A87BB)),
            ),
          )
        ]),
      ),
      body: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              AppLocalizations.of(context)!.translate('language').toString(),
            ),
          ),
          ListTile(
            title: const Text('Português'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.portugues,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('English'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.english,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
