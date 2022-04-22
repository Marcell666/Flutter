class Curso {
  final int id;
  final String name;
  final String classroom;
  final int begin;
  final int finish;
  //final List<String> days;

  Curso({
    required this.id,
    required this.name,
    required this.classroom,
    required this.begin,
    required this.finish,
  });

  factory Curso.fromJson(Map<String, dynamic> json) {
    return Curso(
      id: json['id'],
      name: json['name'],
      classroom: json['classroom'],
      begin: json['begin'],
      finish: json['finish'],
    );
  }
}
