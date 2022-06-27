import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_inf1300/controller/http_service.dart';
import 'package:flutter_inf1300/model/presenca.dart';
import 'package:flutter_inf1300/route/route.dart' as route;

class AttendanceCollectionPage extends StatefulWidget {
  final Object? arguments;
  const AttendanceCollectionPage({required this.arguments});

  @override
  State<AttendanceCollectionPage> createState() =>
      _AttendanceCollectionPageState();
}

class _AttendanceCollectionPageState extends State<AttendanceCollectionPage> {
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
        future: httpService.getAlunosPresenca(int.parse(
            widget.arguments.toString())), //professor com id=1 no banco

        builder:
            (BuildContext context, AsyncSnapshot<List<Presenca>> snapshot) {
          if (snapshot.hasData) {
            List<Presenca> presencas = snapshot.data as List<Presenca>;
            List<Presenca>? presencasUnique = [];
            String oldDate = presencas[0].date;
            String newDate;
            for (int i = 1; i < presencas.length; i++) {
              newDate = presencas[i].date;
              if (oldDate != newDate) {
                presencasUnique.add(presencas[i]);
                oldDate = newDate;
              }
            }
            return ListView(
              children: presencasUnique
                  .map(
                    (Presenca presenca) => Card(
                      child: ListTile(
                        title: Text(
                          presenca.date,
                          style: const TextStyle(color: Color(0xFF4E4E4E)),
                        ),
                        trailing: IconButton(
                          iconSize: 30.0,
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xffA5A5A5),
                          ),
                          onPressed: () => Navigator.pushNamed(
                            context,
                            route.attendanceCollectionListPage,
                            arguments: {
                              'course': int.parse(widget.arguments.toString()),
                              'date': presenca.date
                            },
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
    );
  }
}
