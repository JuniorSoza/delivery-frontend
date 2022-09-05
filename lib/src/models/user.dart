import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? id;
  String? email;
  String? name;
  String? lastname;
  String? phone;
  String? image;
  String? password;
  bool? is_available;
  String? session_token;
  //String createAt;
  //String updateAt;

  User({
    this.id,
    this.email,
    this.name,
    this.lastname,
    this.phone,
    this.image,
    this.password,
    this.is_available,
    this.session_token,
    //this.createAt,
    //this.updateAt,
  });



  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    name: json["name"],
    lastname: json["lastname"],
    phone: json["phone"],
    image: json["image"],
    password: json["password"],
    is_available: json["is_available"],
    session_token: json["session_token"],
    //createAt: json["create_at"],
    //updateAt: json["update_at"],
  );

  @override
  String toString() {
    return 'User{id: $id, email: $email, name: $name, lastname: $lastname, phone: $phone, image: $image, password: $password, is_available: $is_available, session_token: $session_token}';
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "name": name,
    "lastname": lastname,
    "phone": phone,
    "image": image,
    "password": password,
    "is_available": is_available,
    "session_token": session_token,
    //"create_at": createAt,
    //"update_at": updateAt,
  };
}
