import 'package:flutter/material.dart';
import 'package:flutter_inf1300/route/route.dart' as route;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int? _radioValue1 = -1;

  void _handleRadioValueChange1(int? value) {
    setState(() {
      _radioValue1 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade200,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/predio_puc.png',
                ),
                alignment: Alignment.bottomCenter,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.fromLTRB(28, 90, 50, 70),
                child: Column(
                  children: const <Widget>[
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        'Educação Continuada',
                        style: TextStyle(
                            color: Color(0xffa18c59),
                            fontWeight: FontWeight.bold,
                            fontSize: 34),
                      ),
                    ),
                    Text(
                      'Cursos de Especialização e Extensão, Palestras e Eventos',
                      style: TextStyle(
                          color: Color(0xff838587),
                          fontWeight: FontWeight.bold,
                          fontSize: 19),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(65, 0, 65, 80),
                alignment: Alignment.centerLeft,
                child: Column(
                  children: <Widget>[
                    const TextField(
                        decoration: InputDecoration(labelText: 'CPF ou Email')),
                    const TextField(
                        obscureText: true,
                        decoration: InputDecoration(labelText: 'Senha')),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 0.0),
                          child: SizedBox(
                            width: 24.0,
                            height: 24.0,
                            child: Radio(
                              value: 0,
                              groupValue: _radioValue1,
                              onChanged: _handleRadioValueChange1,
                            ),
                          ),
                        ),
                        const Text(
                          'Aluno',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        Radio(
                          value: 1,
                          groupValue: _radioValue1,
                          onChanged: _handleRadioValueChange1,
                        ),
                        const Text(
                          'Professor',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, route.homePage),
                        style: const ButtonStyle(
                            //backgroundColor: Colors.blue[400],
                            ),
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
