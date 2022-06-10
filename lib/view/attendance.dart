import 'package:flutter/material.dart';
import 'package:flutter_inf1300/route/route.dart' as route;
import 'package:flutter_inf1300/controller/http_service.dart';
import 'package:flutter_inf1300/model/aluno.dart';
import 'package:intl/intl.dart';

class AttendancePage extends StatefulWidget {
  final Object? arguments;
  const AttendancePage({required this.arguments});
  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  //String attendanceDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  final HttpService httpService = HttpService();
  List<int> checkboxAttendance = [];
  List<int> studentsCourse = [];
  late DateTime selectedDate = DateTime.now();

  void postAttendance() async {
    List<Object> listPresenca = [];
    studentsCourse
        .removeWhere((element) => checkboxAttendance.contains(element));
    checkboxAttendance.forEach((id) => listPresenca.add({
          'present': true,
          'course_id': int.parse(widget.arguments.toString()),
          'student_id': id,
          'date': DateFormat('dd/MM/yyyy').format(selectedDate).toString()
        }));
    studentsCourse.forEach((id) => listPresenca.add({
          'present': false,
          'course_id': int.parse(widget.arguments.toString()),
          'student_id': id,
          'date': DateFormat('dd/MM/yyyy').format(selectedDate).toString()
        }));
    httpService.postPresenca(listPresenca);
  }

  void datePicker() {
    showDatePicker(
            context: context,
            locale: const Locale("pt", "BR"),
            initialDate: DateTime.now(),
            firstDate: DateTime(1950),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

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
            ElevatedButton(
              onPressed: () => datePicker(),
              child: Text(
                DateFormat('dd/MM/yyyy').format(selectedDate).toString(),
                style: const TextStyle(color: Color(0xFF4E4E4E)),
              ),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.grey.shade200),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                  side: const BorderSide(
                    color: Color(0xffa18c59),
                    width: 1.5,
                  ),
                )),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                postAttendance();
                Navigator.pop(context);
              },
              child: const Text('Salvar',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
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
            studentsCourse = [];
            alunos.forEach((Aluno aluno) => studentsCourse.add(aluno.id));
            return ListView(
              children: alunos
                  .map(
                    (Aluno aluno) => Card(
                      child: ListTile(
                        title: Text(
                          aluno.fullname,
                          style: const TextStyle(color: Color(0xFF4E4E4E)),
                        ),
                        trailing: Checkbox(
                          onChanged: (value) {
                            if (value == true) {
                              setState(() {
                                checkboxAttendance.add(aluno.id);
                              });
                            } else {
                              setState(() {
                                checkboxAttendance.remove(aluno.id);
                              });
                            }
                          },
                          value: checkboxAttendance.contains(aluno.id),
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
