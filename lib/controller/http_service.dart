import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_inf1300/model/aluno.dart';
import 'package:flutter_inf1300/model/professor.dart';
import 'package:flutter_inf1300/model/curso.dart';
import 'package:flutter_inf1300/model/presenca.dart';

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

  Future<List<Curso>> getProfessorCursos(int id) async {
    final response = await http.get(
        Uri.parse('https://cce-backend.herokuapp.com/professores/$id/cursos'));
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

  Future<Presenca> postPresenca(List<Object> listPresenca) async {
    final response = await http.post(
      Uri.parse('https://cce-backend.herokuapp.com/attendances/alunos'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(listPresenca),
    );
    if (response.statusCode == 201) {
      return Presenca.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to post.');
    }
  }

  Future<Professor> loginProfessor(String login, String password) async {
    final response = await http.post(
      Uri.parse(
          'https://cce-backend.herokuapp.com/login/professor?username=$login&password=$password'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 201) {
      return Professor.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to post.');
    }
  }
}
