import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          title: const Text(
            'Educação Continuada',
            style: TextStyle(
              color: Color(0xffa18c59),
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: const TabBar(
            labelColor: Color(0xffA5A5A5),
            indicatorColor: Color(0xff2A87BB),
            tabs: <Widget>[
              Tab(
                text: 'Listas de Presença',
              ),
              Tab(
                text: 'Horários e Salas de Aula',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("It's cloudy here"),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
          ],
        ),
      ),
    );
  }
}
