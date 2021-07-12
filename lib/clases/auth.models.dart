import 'dart:convert';

class User {
  String? username;
  String? passowrd;

  User({this.username, this.passowrd});

  dataToJSON() {
    return jsonEncode(
      <String, String?>{
        'username': username,
        'password': passowrd,
      },
    );
  }
}

class UserRegister {
  String? usuario;
  String? contrasena;
  String? repContrasena;

  UserRegister({this.usuario, this.contrasena, this.repContrasena});

  dataToJson() {
    return jsonEncode(
      <String, dynamic>{
        'username': usuario,
        'password': contrasena,
      },
    );
  }
}
