import 'package:flutter/material.dart';
import 'package:flutter_inf1300/controller/http_service.dart';
import 'package:flutter_inf1300/model/aluno_presenca.dart';

class AttendanceCollectionListPage extends StatefulWidget {
  final int course;
  final String date;
  AttendanceCollectionListPage({required this.course, required this.date});

  @override
  State<AttendanceCollectionListPage> createState() =>
      _AttendanceCollectionListPageState();
}

class _AttendanceCollectionListPageState
    extends State<AttendanceCollectionListPage> {
  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xff4e4e4e),
        ),
        backgroundColor: Colors.grey.shade200,
      ),
      body: FutureBuilder(
        future: httpService.postPresencaDataAlunos(
            {"data": widget.date, "curso": widget.course}),
        builder: (BuildContext context,
            AsyncSnapshot<List<AlunoPresenca>> snapshot) {
          if (snapshot.hasData) {
            List<AlunoPresenca> alunos = snapshot.data as List<AlunoPresenca>;
            return ListView(
              children: alunos
                  .map(
                    (AlunoPresenca aluno) => Card(
                      child: ListTile(
                        title: Text(
                          aluno.name,
                          style: const TextStyle(color: Color(0xFF4E4E4E)),
                        ),
                        trailing: Checkbox(
                          onChanged: null,
                          value: aluno.present,
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
    );
  }
}
