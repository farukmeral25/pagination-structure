import 'dart:convert';

class TaskDto {
  final String title;
  final String subtitle;

  TaskDto({required this.title, required this.subtitle});

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'subtitle': subtitle});

    return result;
  }

  factory TaskDto.fromMap(Map<String, dynamic> map) {
    return TaskDto(
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskDto.fromJson(String source) => TaskDto.fromMap(json.decode(source));
}
