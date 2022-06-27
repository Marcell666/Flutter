import 'package:flutter/material.dart';
import 'package:flutter_inf1300/route/route.dart' as route;
//import 'package:flutter_inf1300/model/aluno.dart';
import 'package:flutter_inf1300/model/curso.dart';
import 'package:flutter_inf1300/controller/http_service.dart';
import 'package:flutter_inf1300/widget/schedule.dart';
import 'package:flutter_inf1300/app_localizations.dart';

class HomePage extends StatelessWidget {
  final HttpService httpService = HttpService();
  late BuildContext contextSave;
  //const HomePage({Key? key}) : super(key: key);

  void choiceAction(String choice) {
    if (choice == 'Value1') {
      Navigator.pushNamed(contextSave, route.settingsPage);
    } else if (choice == 'Value2') {
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
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'Value1',
                    child: Text(AppLocalizations.of(context)!
                        .translate('settings')
                        .toString()),
                  ),
                  PopupMenuItem<String>(
                    value: 'Value2',
                    child: Text(AppLocalizations.of(context)!
                        .translate('logout')
                        .toString()),
                  ),
                ],
              ),
            ],
          ),
          bottom: TabBar(
            labelColor: const Color(0xffA5A5A5),
            indicatorColor: const Color(0xff2A87BB),
            tabs: <Widget>[
              Tab(
                text: AppLocalizations.of(context)?.translate('sidebar0'),
              ),
              Tab(
                text: AppLocalizations.of(context)?.translate('sidebar1'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            FutureBuilder(
              future: httpService
                  .getProfessorCursos(1), //professor com id=1 no banco

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
                              trailing: Wrap(
                                spacing: 5,
                                children: <Widget>[
                                  IconButton(
                                    iconSize: 30.0,
                                    icon: const Icon(
                                      Icons.library_books,
                                      color: Color(0xffA5A5A5),
                                    ),
                                    onPressed: () => Navigator.pushNamed(
                                      context,
                                      route.attendanceCollectionPage,
                                      arguments: curso.id,
                                    ),
                                  ),
                                  IconButton(
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
                                ],
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
