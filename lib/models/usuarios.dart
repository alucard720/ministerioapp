import 'dart:convert';

List<Usuario> usuarioFromJson(String str) =>
    List<Usuario>.from(json.decode(str).map((x) => Usuario.fromJson(x)));

String usuarioToJson(List<Usuario> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usuario {
  Usuario({
    required this.id,
    required this.password,
    this.email,
  });

  int id;
  String password;
  String? email;

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        password: json["password"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "password": password,
        "email": email,
      };
}
