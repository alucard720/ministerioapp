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
}
