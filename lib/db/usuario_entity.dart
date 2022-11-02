class Usuario {
  final int? id;
  final int? indentificacion;
  final String correo;
  final String password;

  Usuario(
      {this.id,
      this.indentificacion,
      required this.correo,
      required this.password});

  factory Usuario.fromMap(Map<String, dynamic> json) => new Usuario(
      id: json['id'],
      indentificacion: json['identifiacion'],
      correo: json['correo'],
      password: json['password']);
}
