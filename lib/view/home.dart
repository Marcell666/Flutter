import 'package:flutter/material.dart';
import 'package:flutter_inf1300/route/route.dart' as route;
import 'package:flutter_inf1300/model/aluno.dart';
import 'package:flutter_inf1300/controller/http_service.dart';

class HomePage extends StatelessWidget {
  final HttpService httpService = HttpService();
  //const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.grey.shade200,
          title: Row(
            children: <Widget>[
              Image.asset(
                'assets/images/logo_puc.png',
                fit: BoxFit.contain,
                height: 32,
              ),
              const Spacer(),
              const Text(
                'Educação Continuada',
                style: TextStyle(
                  color: Color(0xffa18c59),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const IconButton(
                iconSize: 30.0,
                icon: Icon(Icons.more_vert, color: Color(0xffA5A5A5)),
                onPressed: null,
              ),
            ],
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
        body: TabBarView(
          children: <Widget>[
            FutureBuilder(
              future: httpService.getAlunos(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Aluno>> snapshot) {
                if (snapshot.hasData) {
                  List<Aluno> alunos = snapshot.data as List<Aluno>;
                  return ListView(
                    children: alunos
                        .map(
                          (Aluno aluno) => Card(
                            child: ListTile(
                              title: Text(aluno.username),
                            ),
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            const Center(
              child: Text("It's rainy here"),
            ),
          ],
        ),
      ),
    );
  }
}
