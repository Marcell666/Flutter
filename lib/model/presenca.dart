class Presenca {
  //final int id;
  final bool present;
  final int course_id;
  final int student_id;
  final String date;

  Presenca(
      { //required this.id,
      required this.present,
      required this.course_id,
      required this.student_id,
      required this.date});

  factory Presenca.fromJson(Map<String, dynamic> json) {
    return Presenca(
        //id: json['id'],
        present: json['present'],
        course_id: json['course_id'],
        student_id: json['student_id'],
        date: json['date']);
  }
}
