import 'package:flutter/material.dart';
import 'package:flutter_inf1300/route/route.dart' as route;
import 'package:flutter_inf1300/model/aluno.dart';
import 'package:flutter_inf1300/model/curso.dart';
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
            const Center(
              child: Text(""),
            ),
          ],
        ),
      ),
    );
  }
}
