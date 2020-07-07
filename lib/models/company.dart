class Company {

  String id;
  String name;
  String thumbnail;
  String color;
  DateTime createdAt;
  bool inactive;

  Company({this.id, this.name, this.thumbnail, this.color, this.createdAt, this.inactive});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'].toString(),
      name: json['name'],
      thumbnail: json['thumbnail'],
      color: json['color'],
      createdAt: DateTime.parse(json['created_at']),
      inactive: json['inactive'] == 1 ? true : false
    );
  }

}