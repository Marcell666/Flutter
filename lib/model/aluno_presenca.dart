class AlunoPresenca {
  final bool present;
  final String name;

  AlunoPresenca({required this.present, required this.name});

  factory AlunoPresenca.fromJson(Map<String, dynamic> json) {
    return AlunoPresenca(
      present: json['present'],
      name: json['name'],
    );
  }
}
