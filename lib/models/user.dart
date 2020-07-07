class User {

  String id;
  String name;
  String email;
  String password;
  String role;
  String tokenId;
  DateTime createdAt;
  bool inactive;

  User({this.id, this.name, this.email, this.password, this.role, this.tokenId, this.createdAt, this.inactive});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'].toString(),
      name: json['name'],
      email: json['email'],
      password: json['password'],
      role: json['role'],
      tokenId: json['token_id'],
      createdAt: DateTime.parse(json['created_at']),
      inactive: json['inactive'] == 1 ? true : false
    );
  }
}