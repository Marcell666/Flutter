import 'package:flutter/material.dart';
import 'package:flutter_inf1300/route/route.dart' as route;
import 'package:flutter_inf1300/model/aluno.dart';
import 'package:flutter_inf1300/model/curso.dart';
import 'package:flutter_inf1300/controller/http_service.dart';
import 'package:flutter_inf1300/widget/schedule.dart';

class HomePage extends StatelessWidget {
  final HttpService httpService = HttpService();
  late BuildContext contextSave;
  //const HomePage({Key? key}) : super(key: key);

  void choiceAction(String choice) {
    if (choice == Constants.firstItem) {
      Navigator.pushNamed(contextSave, route.settingsPage);
    } else if (choice == Constants.secondItem) {
      Navigator.pop(contextSave);
    }
  }

  @override
  Widget build(BuildContext context) {
    contextSave = context;
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
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert, color: Color(0xffA5A5A5)),
                onSelected: choiceAction,
                itemBuilder: (BuildContext context) {
                  return Constants.choices.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(
                        choice,
                        style: const TextStyle(color: Color(0xFF4E4E4E)),
                      ),
                    );
                  }).toList();
                },
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
              future: httpService.getProfessorCursos(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Curso>> snapshot) {
                if (snapshot.hasData) {
                  List<Curso> cursos = snapshot.data as List<Curso>;
                  return ListView(
                    children: cursos
                        .map(
                          (Curso curso) => Card(
                            child: ListTile(
                              title: Text(
                                curso.name,
                                style:
                                    const TextStyle(color: Color(0xFF4E4E4E)),
                              ),
                              trailing: IconButton(
                                iconSize: 30.0,
                                icon: const Icon(
                                  Icons.add,
                                  color: Color(0xffA5A5A5),
                                ),
                                onPressed: () => Navigator.pushNamed(
                                  context,
                                  route.attendancePage,
                                  arguments: curso.id,
                                ),
                              ),
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
            const ScheduleWidget()
          ],
        ),
      ),
    );
  }
}

class Constants {
  static const String firstItem = 'Configurações';
  static const String secondItem = 'Sair';

  static const List<String> choices = <String>[
    firstItem,
    secondItem,
  ];
}
