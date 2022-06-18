class Professor {
  final int id;
  final String email;
  final String cpf;
  final String fullname;

  Professor(
      {required this.id,
      required this.email,
      required this.cpf,
      required this.fullname});

  factory Professor.fromJson(Map<String, dynamic> json) {
    return Professor(
      id: json['id'],
      email: json['email'],
      cpf: json['cpf'],
      fullname: json['fullname'],
    );
  }
}
