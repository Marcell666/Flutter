import 'package:flutter/material.dart';
import 'package:flutter_inf1300/route/route.dart' as route;

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(28, 90, 50, 70),
            child: Column(
              children: const <Widget>[
                Text(
                  'Educação Continuada',
                  style: TextStyle(
                      color: Color(0xffa18c59),
                      fontWeight: FontWeight.bold,
                      fontSize: 34),
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
            margin: const EdgeInsets.fromLTRB(65, 0, 65, 70),
            alignment: Alignment.centerLeft,
            child: Column(
              children: const <Widget>[
                Text(
                  'CPF ou E-mail',
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                ),
                Text(
                  'Senha',
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                ),
                ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                      //backgroundColor: Colors.blue[400],
                      ),
                  child: Text('Entrar'),
                ),
              ],
            ),
          ),
          Container(
            alignment: FractionalOffset.bottomCenter,
            child: const Image(
              image: AssetImage('assets/images/predio_puc.png'),
            ),
          ),
        ],
      ),
    );
  }
}
