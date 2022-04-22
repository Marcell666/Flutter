import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_inf1300/model/aluno.dart';
import 'package:flutter_inf1300/model/curso.dart';

class HttpService {
// A function that converts a response body into a List<Photo>.
/*
  List<Aluno> parseAlunoList(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Aluno>((json) => Aluno.fromJson(json)).toList();
  }
*/
  //final String alunosURL = 'https://cce-backend.herokuapp.com/alunos';
  Future<List<Aluno>> getAlunos() async {
    final response =
        await http.get(Uri.parse('https://cce-backend.herokuapp.com/alunos'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Aluno> alunos = body
          .map(
            (dynamic item) => Aluno.fromJson(item),
          )
          .toList();
      return alunos;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<List<Curso>> getCursosProfessor() async {
    final response = await http.get(
        Uri.parse('https://cce-backend.herokuapp.com/professores/1/cursos'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      print(body);
      List<Curso> cursos = body
          .map(
            (dynamic item) => Curso.fromJson(item),
          )
          .toList();
      print(cursos);
      return cursos;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
/*
Future<Aluno> fetchAluno(int id) async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/Alunos/$id');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return Aluno.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load Aluno');
  }
}
*/

