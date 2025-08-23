import 'dart:convert';

class Train {
  final int? id;
  final String schedule;
  final String time;
  final String categories;
  final String stage;

  Train({
    this.id,
    required this.schedule,
    required this.time,
    required this.categories,
    required this.stage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": id,
      "schedule": schedule,
      "time": time,
      "categories": categories,
      "stage": stage,
    };
  }

  factory Train.fromMap(Map<String, dynamic> map) {
    return Train(
      id: map["id"] as int,
      schedule: map["schedule"] as String,
      time: map["time"] as String,
      categories: map["categories"] as String,
      stage: map["stage"] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Train.fromJson(String source) =>
      Train.fromMap(json.decode(source) as Map<String, dynamic>);
}
