class Curso {
  final int id;
  final String name;
  final String classroom;
  var schedule;

  Curso({
    required this.id,
    required this.name,
    required this.classroom,
    required this.schedule,
  });

  factory Curso.fromJson(Map<String, dynamic> json) {
    return Curso(
      id: json['id'],
      name: json['name'],
      classroom: json['classroom'],
      schedule: json['schedule'],
    );
  }
}
