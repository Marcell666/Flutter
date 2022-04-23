class Aluno {
  final int id;
  final String email;
  final String cpf;
  final String fullname;
  //final String password;

  Aluno(
      {required this.id,
      required this.email,
      required this.cpf,
      required this.fullname});

  factory Aluno.fromJson(Map<String, dynamic> json) {
    return Aluno(
      id: json['id'],
      email: json['email'],
      cpf: json['cpf'],
      fullname: json['fullname'],
      //password: json['password'],
    );
  }
}
