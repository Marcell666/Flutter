class Aluno {
  //final int id;
  final String username;
  //final String name;
  //final String password;

  Aluno({
    required this.username,
  });

  factory Aluno.fromJson(Map<String, dynamic> json) {
    return Aluno(
      //id: json['id'],
      username: json['username'],
      //name: json['name'],
      //password: json['password'],
    );
  }
}
