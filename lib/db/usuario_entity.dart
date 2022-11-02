class Usuario {
  int id;
  int identificacion;
  String correo;
  String password;

  Usuario(
      {required this.id,
      required this.identificacion,
      required this.correo,
      required this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'identificacion': identificacion,
      'correo': correo,
      'password': password
    };
  }
}
