import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String id;
  String email;
  String name;
  String lastname;
  String phone;
  String image;
  String password;
  bool isAvailable;
  String sessionToken;
  String createAt;
  String updateAt;

  User({
    this.id,
    this.email,
    this.name,
    this.lastname,
    this.phone,
    this.image,
    this.password,
    this.isAvailable,
    this.sessionToken,
    this.createAt,
    this.updateAt,
  });



  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    name: json["name"],
    lastname: json["lastname"],
    phone: json["phone"],
    image: json["image"],
    password: json["password"],
    isAvailable: json["is_available"],
    sessionToken: json["session_token"],
    createAt: json["create_at"],
    updateAt: json["update_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "name": name,
    "lastname": lastname,
    "phone": phone,
    "image": image,
    "password": password,
    "is_available": isAvailable,
    "session_token": sessionToken,
    "create_at": createAt,
    "update_at": updateAt,
  };
}
