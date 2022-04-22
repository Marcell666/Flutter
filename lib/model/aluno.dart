class Aluno {
  final int id;
  final String username;
  final String fullname;
  //final String password;

  Aluno({required this.id, required this.username, required this.fullname});

  factory Aluno.fromJson(Map<String, dynamic> json) {
    return Aluno(
      id: json['id'],
      username: json['username'],
      fullname: json['name'],
      //password: json['password'],
    );
  }
}
