import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

enum SingingCharacter { portugues, english }

class _SettingsPageState extends State<SettingsPage> {
  SingingCharacter? _character = SingingCharacter.portugues;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xff4e4e4e),
        ),
        backgroundColor: Colors.grey.shade200,
      ),
      body: Column(
        children: <Widget>[
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Idioma",
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
