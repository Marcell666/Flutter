import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_inf1300/model/aluno.dart';
import 'package:flutter_inf1300/model/curso.dart';

class HttpService {
  Future<List<Aluno>> getCursosAlunos(int id) async {
    final response = await http
        .get(Uri.parse('https://cce-backend.herokuapp.com/cursos/$id/alunos'));
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

  Future<List<Curso>> getProfessorCursos() async {
    final response = await http.get(
        Uri.parse('https://cce-backend.herokuapp.com/professores/1/cursos'));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Curso> cursos = body
          .map(
            (dynamic item) => Curso.fromJson(item),
          )
          .toList();
      return cursos;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
