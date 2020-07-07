class FlowRecord {

  String id;
  String name;
  String thumbnail;
  String color;
  DateTime createdAt;
  bool inactive;

  FlowRecord({this.id, this.name, this.thumbnail, this.color, this.createdAt, this.inactive});

  factory FlowRecord.fromJson(Map<String, dynamic> json) {
    return FlowRecord(
      id: json['id'].toString(),
      name: json['name'],
      thumbnail: json['thumbnail'],
      color: json['color'],
      createdAt: DateTime.parse(json['created_at']),
      inactive: json['inactive'] == 1 ? true : false
    );
  }

}