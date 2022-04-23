import 'package:flutter/material.dart';
import 'package:flutter_inf1300/route/route.dart' as route;
import 'package:flutter_inf1300/controller/http_service.dart';
import 'package:flutter_inf1300/model/aluno.dart';
import 'package:intl/intl.dart';

class AttendancePage extends StatefulWidget {
  final Object? arguments;
  //const AttendancePage({Key? key, Object? arguments}) : super(key: key);
  const AttendancePage({required this.arguments});
  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  String attendanceDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xff4e4e4e),
        ),
        backgroundColor: Colors.grey.shade200,
        title: Row(
          children: <Widget>[
            const Spacer(),
            ElevatedButton(onPressed: null, child: Text(attendanceDate)),
            const Spacer(),
            ElevatedButton(
              onPressed: null,
              child: const Text(
                'Salvar',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xff2A87BB)),
              ),
            )
          ],
        ),
      ),
      body: FutureBuilder(
        future:
            httpService.getCursosAlunos(int.parse(widget.arguments.toString())),
        builder: (BuildContext context, AsyncSnapshot<List<Aluno>> snapshot) {
          if (snapshot.hasData) {
            List<Aluno> alunos = snapshot.data as List<Aluno>;
            return ListView(
              children: alunos
                  .map(
                    (Aluno aluno) => Card(
                      child: ListTile(
                        title: Text(
                          aluno.fullname,
                          style: const TextStyle(color: Color(0xFF4E4E4E)),
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
